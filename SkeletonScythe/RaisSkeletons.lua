MisL = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/MisL/main/source.lua"))()
-----------------
--| Constants |--
-----------------

local SPAWN_RADIUS = 8 -- Studs

local SKELETON_ASSET_ID = 53604463

local SKELETON_DURATION = 30

local SUMMON_COOLDOWN = 8

-----------------
--| Variables |--
-----------------
local DebrisService = game:GetService('Debris')
local PlayersService = game:GetService('Players')
local RunService = game:GetService("RunService")

local Tool = script.Parent
local ToolHandle = Tool:WaitForChild("Handle")
local SpawnSkeletonRemote = Tool:WaitForChild("SpawnSkeleton")

local MyPlayer = nil

local Fire = script:WaitForChild("Fire")

local GongSound = ToolHandle:WaitForChild("Gong")

local MyModel = nil
local Skeleton = nil
local LastSummonTime = 0

-----------------
--| Functions |--
-----------------

local function MakeSkeleton()
	Skeleton = MisL.Http.returnData("https://raw.githubusercontent.com/SebasRomTen/Gears/main/SkeletonScythe/Skeleton.lua")
	if Skeleton then
		local head = Skeleton:FindFirstChild('Head')
		if head then
			head.Transparency = 0.99
		end
		
		print("SkeletonScript before")
		local skeletonScriptClone = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/SkeletonScythe/SkeletonScript.lua", "server")
		skeletonScriptClone.Parent = Skeleton
		print("Skeleton script after")

		local creatorTag = Instance.new('ObjectValue')
		creatorTag.Name = 'creator' --NOTE: Must be called 'creator' for website stats
		creatorTag.Value = MyPlayer
		local iconTag = Instance.new('StringValue', creatorTag)
		iconTag.Name = 'icon'
		iconTag.Value = Tool.TextureId
		creatorTag.Parent = Skeleton
	end
end

local function SpawnSkeleton(spawnPosition)
	if Skeleton then
		-- Hellfire
		local firePart = Instance.new('Part')
		firePart.Name = 'Effect'
		firePart.Transparency = 1
		firePart.FormFactor = Enum.FormFactor.Custom
		firePart.Size = Vector3.new()
		firePart.Anchored = true
		firePart.CanCollide = false
		firePart.CFrame = CFrame.new(spawnPosition - Vector3.new(0, 4, 0))
		local fireClone = Fire:Clone()
		fireClone.Enabled = true
		fireClone.Parent = firePart
		delay(0.5, function()
			if fireClone then
				fireClone.Enabled = false
			end
		end)
		DebrisService:AddItem(firePart, 3)
		firePart.Parent = workspace

		-- Spawn
		local skeletonClone = Skeleton:Clone()
		
		local skeletonScriptClone = NS([[
		
		--Made by Stickmasterluke

--Zombie artificial stupidity script
--(Modified for skeletons)
print("Skeleton Script")
sp=script.Parent
lastattack=0
nextrandom=0
--nextsound=0
nextjump=0
chasing=false

variance=4

damage=11
attackrange=4.5
sightrange=60
runspeed=18
wonderspeed=8
healthregen=false
colors={"Sand red","Dusty Rose","Medium blue","Sand blue","Lavender","Earth green","Brown","Medium stone grey","Brick yellow"}

function raycast(spos,vec,currentdist)
	local hit2,pos2=game.Workspace:FindPartOnRay(Ray.new(spos+(vec*.01),vec*currentdist),sp)
	if hit2 and pos2 then
		if hit2.Transparency>=.8 or hit2.Name=="Handle" or string.sub(hit2.Name,1,6)=="Effect" then
			local currentdist=currentdist-(pos2-spos).magnitude
			return raycast(pos2,vec,currentdist)
		end
	end
	return hit2,pos2
end

function waitForChild(parent,childName)
	local child=parent:findFirstChild(childName)
	if child then return child end
	while true do
		child=parent.ChildAdded:wait()
		if child.Name==childName then return child end
	end
end

-- ANIMATION

-- declarations

local Torso=waitForChild(sp,"Torso")
local Head=waitForChild(sp,"Head")
local RightShoulder=waitForChild(Torso,"Right Shoulder")
local LeftShoulder=waitForChild(Torso,"Left Shoulder")
local RightHip=waitForChild(Torso,"Right Hip")
local LeftHip=waitForChild(Torso,"Left Hip")
local Neck=waitForChild(Torso,"Neck")
local Humanoid=waitForChild(sp,"Humanoid")
local BodyColors=waitForChild(sp,"Body Colors")
local pose="Standing"
--local hitsound=waitForChild(Torso,"HitSound")
if healthregen then
	local regenscript=waitForChild(sp,"HealthRegenerationScript")
	regenscript.Disabled=false
end
Humanoid.WalkSpeed=wonderspeed

local toolAnim="None"
local toolAnimTime=0

BodyColors.HeadColor=BrickColor.new("Grime")
local randomcolor1=colors[math.random(1,#colors)]
BodyColors.TorsoColor=BrickColor.new(randomcolor1)
BodyColors.LeftArmColor=BrickColor.new(randomcolor1)
BodyColors.RightArmColor=BrickColor.new(randomcolor1)
local randomcolor2=colors[math.random(1,#colors)]
BodyColors.LeftLegColor=BrickColor.new(randomcolor2)
BodyColors.RightLegColor=BrickColor.new(randomcolor2)

function IsTeamMate(Player1, Player2)
	return (Player1 and Player2 and not Player1.Neutral and not Player2.Neutral and Player1.TeamColor == Player2.TeamColor)
end

function IsInTable(Table,Value)
	for _,v in pairs(Table) do
		if v == Value then
			return true
		end
	end
	return false
end

function onRunning(speed)
	if speed>0 then
		pose="Running"
	else
		pose="Standing"
	end
end
function onDied()
	pose="Dead"
end
function onJumping()
	pose="Jumping"
end
function onClimbing()
	pose="Climbing"
end
function onGettingUp()
	pose = "GettingUp"
end
function onFreeFall()
	pose = "FreeFall"
end
function onFallingDown()
	pose = "FallingDown"
end
function onSeated()
	pose = "Seated"
end
function onPlatformStanding()
	pose = "PlatformStanding"
end

function moveJump()
	RightShoulder.MaxVelocity = 0.5
	LeftShoulder.MaxVelocity = 0.5
	RightShoulder.DesiredAngle=3.14
	LeftShoulder.DesiredAngle=-3.14
	RightHip.DesiredAngle=0
	LeftHip.DesiredAngle=0
end

function moveFreeFall()
	RightShoulder.MaxVelocity = 0.5
	LeftShoulder.MaxVelocity =0.5
	RightShoulder.DesiredAngle=3.14
	LeftShoulder.DesiredAngle=-3.14
	RightHip.DesiredAngle=0
	LeftHip.DesiredAngle=0
end

function moveSit()
	RightShoulder.MaxVelocity = 0.15
	LeftShoulder.MaxVelocity = 0.15
	RightShoulder.DesiredAngle=3.14 /2
	LeftShoulder.DesiredAngle=-3.14 /2
	RightHip.DesiredAngle=3.14 /2
	LeftHip.DesiredAngle=-3.14 /2
end

function animate(time)
	local amplitude
	local frequency
	if (pose == "Jumping") then
		moveJump()
		return
	end
	if (pose == "FreeFall") then
		moveFreeFall()
		return
	end
	if (pose == "Seated") then
		moveSit()
		return
	end
	local climbFudge = 0
	if (pose == "Running") then
		RightShoulder.MaxVelocity = 0.15
		LeftShoulder.MaxVelocity = 0.15
		amplitude = 1
		frequency = 9
	elseif (pose == "Climbing") then
		RightShoulder.MaxVelocity = 0.5 
		LeftShoulder.MaxVelocity = 0.5
		amplitude = 1
		frequency = 9
		climbFudge = 3.14
	else
		amplitude = 0.1
		frequency = 1
	end
	local desiredAngle = amplitude * math.sin(time*frequency)
	if not chasing and frequency==9 then
		frequency=4
	end
	if chasing then
		RightShoulder.DesiredAngle=math.pi/2
		LeftShoulder.DesiredAngle=-math.pi/2
		RightHip.DesiredAngle=-desiredAngle*2
		LeftHip.DesiredAngle=-desiredAngle*2
	else
		RightShoulder.DesiredAngle=desiredAngle + climbFudge
		LeftShoulder.DesiredAngle=desiredAngle - climbFudge
		RightHip.DesiredAngle=-desiredAngle
		LeftHip.DesiredAngle=-desiredAngle
	end
end


function attack(time,attackpos)
	if time-lastattack>=1 then
		local hit,pos=raycast(Torso.Position,(attackpos-Torso.Position).unit,attackrange)
		if hit and hit.Parent and hit.Parent.Name~=sp.Name then
			local h=hit.Parent:FindFirstChildOfClass("Humanoid")
			if h then
				local creator=sp:FindFirstChild("creator")
				if creator then
					if creator.Value then
						if creator.Value~=game.Players:GetPlayerFromCharacter(h.Parent) then
							for i,oldtag in ipairs(h:GetChildren()) do
								if oldtag.Name=="creator" then
									oldtag:Destroy()
								end
							end
							creator:Clone().Parent=h
						else
							return
						end
					end
				end
				h:TakeDamage(damage)
				if RightShoulder and LeftShoulder then
					RightShoulder.CurrentAngle=0
					LeftShoulder.CurrentAngle=0
				end
			end
		end
		lastattack=time
	end
end


Humanoid.Died:Connect(onDied)
Humanoid.Running:Connect(onRunning)
Humanoid.Jumping:Connect(onJumping)
Humanoid.Climbing:Connect(onClimbing)
Humanoid.GettingUp:Connect(onGettingUp)
Humanoid.FreeFalling:Connect(onFreeFall)
Humanoid.FallingDown:Connect(onFallingDown)
Humanoid.Seated:Connect(onSeated)
Humanoid.PlatformStanding:Connect(onPlatformStanding)

local DetectionRange = 200

function populatehumanoids()
	local Pos = Torso.CFrame.p + Vector3.new(1,1,1) * DetectionRange
	local Neg = Torso.CFrame.p - Vector3.new(1,1,1) * DetectionRange
	local Region = Region3.new(Neg,Pos)
	local Parts = workspace:FindPartsInRegion3WithIgnoreList(Region,{sp,sp:WaitForChild("creator").Value.Character},math.huge)
	for _,parts in pairs(Parts) do
		if parts and parts.Parent then
			local Hum,FF = parts.Parent:FindFirstChildOfClass("Humanoid"),parts.Parent:FindFirstChildOfClass("ForceField")
			if Hum and Hum.Health ~= 0 and not FF and not IsTeamMate(sp:WaitForChild("creator").Value,game:GetService("Players"):GetPlayerFromCharacter(Hum.Parent)) and not IsInTable(humanoids,Hum) then
				table.insert(humanoids,Hum)
			end
		end
	end
end
while sp.Parent and Humanoid and Humanoid.Parent and Humanoid.Health>0 and Torso and Head and Torso and Torso.Parent do
	for _,parts in pairs(sp:GetDescendants()) do
		if parts:IsA("BasePart") and parts:CanSetNetworkOwnership() then
			parts:SetNetworkOwner(nil)
		end
	end

	local _,time=wait(1/3)
	humanoids={}
	populatehumanoids()
	closesttarget=nil
	closestdist=sightrange
	local creator=sp:FindFirstChild("creator")
	for i,h in ipairs(humanoids) do
		if h and h.Parent then
			if h.Health>0 and h.Parent.Name~=sp.Name and h.Parent~=sp then
				local plr=game.Players:GetPlayerFromCharacter(h.Parent)
				if not creator or not plr or creator.Value~=plr then
					local t=h.Parent:FindFirstChild("Torso") or h.Parent:FindFirstChild("UpperTorso")
					if t then
						local dist=(t.Position-Torso.Position).magnitude
						if dist<closestdist then
							closestdist=dist
							closesttarget=t
						end
					end
				end
			end
		end
	end
	if closesttarget then
		if not chasing then
			--playsound(time)
			chasing=true
			Humanoid.WalkSpeed=runspeed
		end
		Humanoid:MoveTo(closesttarget.Position+(Vector3.new(1,1,1)*(variance*((math.random()*2)-1))),closesttarget)
		if math.random()<.5 then
			attack(time,closesttarget.Position)
		end
	else
		if chasing then
			chasing=false
			Humanoid.WalkSpeed=wonderspeed
		end
		if time>nextrandom then
			nextrandom=time+3+(math.random()*5)
			local randompos=Torso.Position+((Vector3.new(1,1,1)*math.random()-Vector3.new(.5,.5,.5))*40)
			Humanoid:MoveTo(randompos,game.Workspace.Terrain)
		end
	end
	if time>nextjump then
		nextjump=time+7+(math.random()*5)
		Humanoid.Jump=true
	end
	animate(time)
end

wait(4)
sp:Destroy() --Rest In Pizza
		
		]])
		skeletonScriptClone.Parent = skeletonClone
		
		DebrisService:AddItem(skeletonClone, SKELETON_DURATION)
		skeletonClone.Parent = workspace
		skeletonClone:MoveTo(spawnPosition) --NOTE: Model must be in Workspace

		-- Rise!
		local torso = skeletonClone:FindFirstChild('Torso')
		if torso then
			torso.CFrame = torso.CFrame - Vector3.new(0, 4.5, 0)
			for i = 0, 4.5, 0.15 do
				torso.CFrame = torso.CFrame + Vector3.new(0, i, 0)
				RunService.Heartbeat:Wait()
			end
		end
	end
end

local function RaiseSkeletons()
	if not Skeleton then -- Try again
		MakeSkeleton()
	end
	for theta = 72, 360, 72 do
		SpawnSkeleton(MyModel.HumanoidRootPart.CFrame:pointToWorldSpace(Vector3.new(math.cos(theta), 0, math.sin(theta)) * SPAWN_RADIUS))
	end
end

local function OnEquipped(mouse)
	MyModel = Tool.Parent
	
	MyPlayer = PlayersService:GetPlayerFromCharacter(MyModel)
	
	MakeSkeleton()
end

--------------------
--| Script Logic |--
--------------------

Tool.Equipped:Connect(OnEquipped)

SpawnSkeletonRemote.OnServerEvent:Connect(function(Player)
	local ToolPlayer = PlayersService:GetPlayerFromCharacter(Tool.Parent)
	if ToolPlayer == Player then
		
		if tick() - LastSummonTime < SUMMON_COOLDOWN then return end
		
		LastSummonTime = tick()
		local humanoid = MyModel:FindFirstChildOfClass('Humanoid')
		if humanoid then
			humanoid.WalkSpeed = 0
		end
		local RaiseAnim = humanoid:LoadAnimation(script:WaitForChild(humanoid.RigType.Name .."Summon"))
		RaiseAnim:Play()
		spawn(function()
			for i = 1, 3 do
				if GongSound then GongSound:Play() end
				wait(1.5)
			end
			RaiseSkeletons()
		end)
		wait(1)
		if humanoid then
			humanoid.WalkSpeed = 16
		end			
	end
end)