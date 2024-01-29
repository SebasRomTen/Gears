local Meshes = {[1] = "http://www.roblox.com/asset/?id=114027041", -- up
			   [2] = "http://www.roblox.com/asset/?id=114027177", -- mid
			   [3] = "http://www.roblox.com/asset/?id=114027209"} -- down


local DebrisService = game:GetService('Debris')
local PlayersService = game:GetService('Players')


local Eagle = script.Parent
local FINAL_CLEANUP_TIME = 60
local Owner = Eagle:WaitForChild('PlayerOwner')
local Torso = Eagle:WaitForChild('Torso')
local MyMesh = Torso:WaitForChild('Mesh')
--local bp = Torso:WaitForChild('bp')
local bv = Torso:WaitForChild('bv')
local bg = Torso:WaitForChild('bg')
local TIME_BETWEEN_FLAPS = 0.085

local BIRD_DAMAGE = 15

local SearchRangeXZ = 35
local SearchRangeY = 15
local ChaseRange = 60

local CurrentTarget = nil

local HitHums = {}

DebrisService:AddItem(Eagle, FINAL_CLEANUP_TIME)


function tagHumanoid(humanoid, player)
	if humanoid ~= nil and player ~= nil then
		local creatorTag = Instance.new("ObjectValue")
		creatorTag.Name = "creator"
		creatorTag.Value = player
		creatorTag.Parent = humanoid
		DebrisService:AddItem(creatorTag, 1) 
	end
end

function IsToolEquipped()
	local player = Owner.Value
	if player and player.Character then
		local tool = player.Character:FindFirstChild("RedcliffHorn")
		if tool then
			return true
		end
	end
	return false
end

function FindTarget()
	local ownerHum = Owner and Owner.Value and Owner.Value.Character and Owner.Value.Character:FindFirstChild('Humanoid')
	local pxPos = Torso.Position + Vector3.new(0,-8,0)
	local searchVec = Vector3.new(SearchRangeXZ, SearchRangeY, SearchRangeXZ)
	local searchRegion = Region3.new(pxPos - searchVec, pxPos + searchVec)
	local partList = game.Workspace:FindPartsInRegion3(searchRegion, Owner.Value, 50)
	local closestPart
	local closestDistance = ChaseRange
	for i,part in pairs(partList) do
		local partDistance = (part.Position - pxPos).magnitude
		local hum = part.Parent:FindFirstChild("Humanoid")
		-- TODO: do we need to check if it wasn't our humanoid?
		if partDistance < closestDistance and hum and hum:IsA("Humanoid") and hum.Health>0 and hum ~= ownerHum then
			closestPart = part
			closestDistance = partDistance
		end
	end
	if closestPart then 
		local EnemyTarget = closestPart.Parent
		--print("found attack target")
		return EnemyTarget
	end
end

function findHumanoid(part)
	while part ~= nil do
		if part:FindFirstChild('Humanoid') then
			--print("Found hum")
			return part:FindFirstChild('Humanoid')
		end
		part = part.Parent
	end
end


function onHit(part)
	local hum = findHumanoid(part)
	local ownerHum = Owner.Value and Owner.Value.Character and Owner.Value.Character:FindFirstChild('Humanoid')
	if ownerHum and hum and hum ~= ownerHum then
		tagHumanoid(hum, Owner.Value)
		hum:TakeDamage(BIRD_DAMAGE)
		--print("Dealt damage")
	end
end

function FlapWings()
	local keepFlapping = true

	spawn(function()
		while keepFlapping do
			task.wait()
			for i = 2, #Meshes do
				if Meshes[i] then
					MyMesh.MeshId = Meshes[i]
					task.wait(TIME_BETWEEN_FLAPS)
				end
			end
			for i = #Meshes - 1, 1, -1 do
				if Meshes[i] then
					MyMesh.MeshId = Meshes[i]
					task.wait(TIME_BETWEEN_FLAPS)
				end
			end
		end
	end)
	
	return function() keepFlapping = false end
end

function HookUpDeathCB()
	if Owner and Owner.Value and Owner.Value.Character and
			Owner.Value.Character:FindFirstChild('Humanoid') then
		Owner.Value.Character.Humanoid.Died:connect(function()
			DebrisService:AddItem(Eagle, 1)
		end)
		PlayersService.PlayerRemoving:connect(function(player) 
			if player and player == Owner.Value then
				DebrisService:AddItem(Eagle, 1)
			end
		end)
		if not IsToolEquipped() then
			DebrisService:AddItem(Eagle, 1)
		end
		Owner.Value.Character.ChildRemoved:connect(function()
			if not IsToolEquipped() then
				DebrisService:AddItem(Eagle, 1)
			end
		end)
	else
		DebrisService:AddItem(Eagle, 1)
		--print('Eagle: No Owner Value, deleting self.')
	end
end

function FlyTowards(object)
	local keepFlying = true	
	
	spawn(function()
		while keepFlying do
			task.wait(0.1)
			local flyDir
			if object:IsA('Model') then
				flyDir = object:GetModelCFrame().p - Torso.CFrame.p
			elseif object:IsA('BasePart') then
				flyDir = object.CFrame.p - Torso.CFrame.p
			end
			if flyDir.magnitude < 30 then
				bv.velocity = flyDir.unit * 30
			elseif flyDir.magnitude > 90 then
				bv.velocity = flyDir.unit * 90
			else
				bv.velocity = flyDir
			end
			if bv.velocity.unit:Dot(Torso.Velocity.unit) < -0.75 then
				local origVelocity = bv.velocity
				bv.velocity = (bv.velocity:Cross(Vector3.new(0,1,0)) * Vector3.new(1,0,1)) + Vector3.new(0,origVelocity.Y, 0)
			end
			bg.cframe = CFrame.new(Vector3.new(), bv.velocity.unit)
		end
	end)
	
	return function() keepFlying = false end
end

HookUpDeathCB()

local cancelFunc = FlapWings()

local cancelFlyFunc = nil

Torso.Touched:connect(onHit)

while true do
	local nextTarget = FindTarget()
	if nextTarget then
		CurrentTarget = nextTarget
	end
	if CurrentTarget then
		if cancelFlyFunc then
			cancelFlyFunc()
		end
		cancelFlyFunc = FlyTowards(CurrentTarget)
	end
	if not nextTarget then
		local ownerTorso = Owner and Owner.Value and Owner.Value.Character and Owner.Value.Character:FindFirstChild('Torso')
		if ownerTorso then
			if cancelFlyFunc then
				cancelFlyFunc()
			end			
			cancelFlyFunc = FlyTowards(ownerTorso)
		end
	end
	task.wait(10)
end