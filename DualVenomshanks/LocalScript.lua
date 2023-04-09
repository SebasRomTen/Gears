--[[
	Rewritten by ArceusInator
	
	This script will run the sword code on the client if filtering is disabled
--]]
local Tool = script.Parent
----------------------------------------------
--[[
	Gear Library by ArceusInator.
	
	Using this to make it easy to make and edit gear.
	
	Converted to script by SebasRomTen
--]]

local Instance_new = Instance.new
local BaseEvent = Instance_new'BindableEvent'
local Signal_connect = BaseEvent.Event.connect
local Event_Fire = BaseEvent.Fire
local Event_Destroy = BaseEvent.Destroy
local Players = game:GetService'Players'

local cooldowns = {}
local RenderStepped = game:GetService'RunService'.RenderStepped
local CAS = game:GetService'ContextActionService'

local Debris = game:GetService'Debris'

local Lib = {}

Lib.Script = script

Lib.GetDescendants = function(object)
	local list = {}

	local search;search = function(parent)
		for index, child in next, parent:GetChildren() do
			table.insert(list, child)
			search(child)
		end
	end

	search(object)

	return list
end

Lib.CFrameModel = function(model, target, primary)
	local descendants = Lib.GetDescendants(model)

	local primary = primary or target.CFrame

	--
	local localCFrames = {}
	for i, object in next, descendants do
		if object:IsA'BasePart' then
			localCFrames[object] = primary.CFrame:toObjectSpace(object.CFrame)
		end
	end

	primary.CFrame = target

	for part, localCFrame in next, localCFrames do
		part.CFrame = target:toWorldSpace(localCFrame)
	end
end

Lib.Create = function(className, defaultParent)
	return function(propList)
		local new = Instance.new(className)
		local parent = defaultParent

		for index, value in next, propList do
			if type(index)=='string' then
				if index == 'Parent' then
					parent = value
				else
					new[index] = value
				end
			elseif type(index)=='number' then
				value.Parent = new
			end
		end

		new.Parent = parent	
		return new
	end
end

Lib.FastSpawn = function(callback, ...)
	local event = Instance_new'BindableEvent'

	--event.Event:connect(callback)
	Signal_connect(event.Event, callback)

	--event:Fire(...)
	Event_Fire(event, ...)

	--event:Destroy()
	Event_Destroy(event)
end

local fullmeta;fullmeta = function(t, meta)
	setmetatable(t, meta)
	for index, other in next, t do
		if type(other) == 'table' then
			fullmeta(other, meta)
		end
	end

	return t
end

Lib.FullMeta = fullmeta

Lib.GetHumanoid = function(obj)
	if obj then
		for i, child in next, obj:GetChildren() do
			if child:IsA'Humanoid' then
				return child
			end
		end
	else
		return nil
	end
end

Lib.GetCharacterFromPart = function(part)
	local current = part
	local character = nil
	local humanoid = nil
	local player = nil
	while true do
		for i, child in next, current:GetChildren() do
			if child:IsA'Humanoid' then
				character = current
				humanoid = child
				break
			end
		end
		if current:IsA'Player' then
			local GLib = require(script.Parent)
			character = current.Character
			humanoid = character and Lib.GetHumanoid(character)
			player = current
			break
		end

		if character then
			break
		else
			current = current.Parent

			if not current or current == game then
				break
			end
		end
	end

	return character, player or (character and Players:GetPlayerFromCharacter(character)), humanoid
end

Lib.GetPlayerFromPart = function(part)
	if not part then return nil end

	local player
	local current = part
	while true do
		player = Players:GetPlayerFromCharacter(current)
		if not player then
			current = current.Parent
			if not current or current == game then
				break
			end
		else
			break
		end
	end

	return player, player and player.Character
end

Lib.IsProtected = function(obj)
	local protected = false
	local check = obj
	while true do
		local hasFF = false
		for index, child in next, check:GetChildren() do
			if child:IsA'ForceField' then
				hasFF = true
				break
			end
		end
		if hasFF then
			protected = true
			break
		else
			check = check.Parent
			if check == nil or check == game or check.Parent == game then
				break
			end
		end
	end

	return protected
end

Lib.IsTeammate = function(a, b)
	if not a or not b then return nil end
	return a and b and a:IsA'Player' and b:IsA'Player' and a.Neutral==false and b.Neutral==false and a.TeamColor==b.TeamColor
end

Lib.TagHumanoid = function(player, humanoid, t)
	if humanoid == nil then return end
	if player == nil then return end
	if humanoid:IsA'Player' then player,humanoid = humanoid,player end

	if humanoid:FindFirstChild'creator' then
		humanoid.creator:Destroy()
	end

	local tag = Instance.new'ObjectValue'
	tag.Name = 'creator'
	tag.Value = player
	tag.Parent = humanoid

	Debris:AddItem(tag, t or 1)
end



local function remove(name)
	local info = cooldowns[name]
	if info then
		info.ShaderFrame:Destroy()
		info.ShadowImage:Destroy()
		cooldowns[name] = nil
	end
end

if not game:FindService'NetworkServer' then
	RenderStepped:connect(function()
		for name, info in next, cooldowns do
			local alpha = math.min((tick()-info.StartedAt)/info.Length, 1)
			info.ShaderFrame.Position = UDim2.new(0, 0, alpha, 0)
			info.ShaderFrame.Size = UDim2.new(1, 0, 1-alpha, 0)
			info.ShadowImage.Position = UDim2.new(0, 0, 0, -alpha*info.ShaderFrame.AbsoluteSize.x)
			if alpha == 1 then
				remove(name)
			end
		end
	end)
end

Lib.SetButtonCooldown = function(name, t)
	remove(name)

	if t and t > 0 then
		local button = CAS:GetButton(name)
		local info = {
			StartedAt = tick(),
			Length = t,
			ShaderFrame = GLib.Create'Frame'{
				Name = 'Shader',
				BackgroundTransparency = 1,
				Parent = button,
				Size = UDim2.new(1, 0, 1, 0),
				ClipsDescendants = true
			},
			ShadowImage = GLib.Create'ImageLabel'{
				Name = 'Image',
				BackgroundTransparency = 1,
				Image = button.Image,
				ImageRectSize = button.ImageRectSize,
				ImageRectOffset = button.ImageRectOffset,
				Size = button.Size,
				ZIndex = button.ZIndex+1
			},
			Button = button
		}
		info.ShadowImage.ImageColor3 = Color3.new(.5, .5, .5)
		info.ShadowImage.Parent = info.ShaderFrame

		cooldowns[name] = info
	end
end

GLib = Lib
-----------------------------

---------------------------------------

--[[
	Rewritten by ArceusInator
	
	This script is the Sword module.  This runs on either the server (when FilteringEnabled is on) or the client (when FilteringEnabled is off)
--]]
local Debris = game:GetService'Debris'
local Tool = script.Parent
local Handle = Tool.Handle
local Config = Tool:WaitForChild'Configurations'

local Sword = {
	-- Advanced settings
	DoubleClickMaxTime = 0.2,

	-- Variables
	State = 'Idle', -- Idle, Slashing, Lunging
	SlashingStartedAt = 0,
	AttackTicket = 0,
	Tracks = {},
	LeftSword = nil,
	SpinDebounce = false,
	Spins = 0,
	SpinTicket = 0,
	PoisonedCharacters = {},
	SpinForce = GLib.Create'BodyAngularVelocity'{
		Name = 'DualVenomshanks_SpinForce',
		P = 1000000,
		angularvelocity = Vector3.new(0, 20, 0),
		maxTorque = Vector3.new(1,1,1)*1000000
	},
	StayUpright = GLib.Create'BodyGyro'{
		Name = 'DualVenomshanks_StayUpright',
		P = 1000000,
		maxTorque = Vector3.new(1, 0, 1)*1000000,
		cframe = CFrame.new()
	},
	SkeletonAssets = {
		["Head"] = {MeshId = 36869983, TextureId = 36869975, Scale = Vector3.new(0.95, 0.9, 0.95)},
		["Torso"] = {MeshId = 36780113, TextureId = 36780292, Scale = Vector3.new(1, 1, 1)},
		["Left Arm"] = {MeshId = 36780032, TextureId = 36780292, Scale = Vector3.new(1, 1, 1)},
		["Right Arm"] = {MeshId = 36780156, TextureId = 36780292, Scale = Vector3.new(1, 1, 1)},
		["Left Leg"] = {MeshId = 36780079, TextureId = 36780292, Scale = Vector3.new(1, 1, 1)},
		["Right Leg"] = {MeshId = 36780195, TextureId = 36780292, Scale = Vector3.new(1, 1, 1)}
	}
}

--
--
function Sword:PoisonStep()
	local myPlayer = GLib.GetPlayerFromPart(Tool)

	for humanoid, info in next, Sword.PoisonedCharacters do
		if Sword:GetHumanoidIsPoisoned(humanoid) and info.Humanoid.Health > 0 then
			local damage = info.Humanoid.MaxHealth*Config.PoisonDamageRatio.Value
			GLib.TagHumanoid(humanoid, myPlayer, 0.1)
			if Config.PoisonBlockedByForceField.Value then
				info.Humanoid:TakeDamage(damage)
			else
				info.Humanoid.Health = info.Humanoid.Health-damage
			end

			spawn(function()
				for obj, propInfo in next, info.ChangeColorObjects do
					info.ChangeColorObjects[obj].Original = obj[propInfo.Property]
					if propInfo.Type == 'BrickColor' then
						obj[propInfo.Property] = Config.PoisonColor.Value
					elseif propInfo.Type == 'Color3' then
						obj[propInfo.Property] = Config.PoisonColor.Value.Color
					elseif propInfo.Type == 'Vector3' then
						obj[propInfo.Property] = Vector3.new(Config.PoisonColor.Value.r, Config.PoisonColor.Value.g, Config.PoisonColor.Value.b)
					end
				end
				wait(Config.PoisonRate.Value/2)
				for obj, propInfo in next, info.ChangeColorObjects do
					obj[propInfo.Property] = propInfo.Original
				end
			end)

			if tick() - info.StartedAt >= Config.PoisonDuration.Value then
				Sword:CureHumanoid(humanoid)
			end
		else
			Sword:CureHumanoid(humanoid)
		end
	end
end

function Sword:GetHumanoidIsPoisoned(humanoid)
	return humanoid:FindFirstChild'Venomshank_Poison'~=nil
end

function Sword:PoisonHumanoid(humanoid)
	if not Sword:GetHumanoidIsPoisoned(humanoid) and not GLib.IsProtected(humanoid) then
		local info = {
			Character = humanoid.Parent,
			Humanoid = humanoid,
			ChangeColorObjects = {},
			StartedAt = tick()
		}

		for index, obj in next, GLib.GetDescendants(info.Character) do
			if obj:IsA'BasePart' then
				info.ChangeColorObjects[obj] = {
					Property = 'BrickColor',
					Type = 'BrickColor',
					Original = obj.BrickColor
				}
			elseif obj:IsA'FileMesh' then
				info.ChangeColorObjects[obj] = {
					Property = 'VertexColor',
					Type = 'Vector3',
					Original = obj.VertexColor
				}
			elseif obj:IsA'Fire'or obj:IsA'Smoke' or obj:IsA'Light' then
				info.ChangeColorObjects[obj] = {
					Property = 'Color',
					Type = 'Color3',
					Original = obj.Color
				}
			elseif obj:IsA'Sparkles' then
				info.ChangeColorObjects[obj] = {
					Property = 'SparkleColor',
					Type = 'Colors',
					Original = obj.SparkleColor
				}
			end
		end

		Sword.PoisonedCharacters[humanoid] = info
		local status = Instance.new'Model' do
			status.Name = 'Venomshank_Poison'
			status.Parent = humanoid
		end
	end
end

function Sword:CureHumanoid(humanoid)
	Sword.PoisonedCharacters[humanoid] = nil

	if Sword:GetHumanoidIsPoisoned(humanoid) then
		humanoid.Venomshank_Poison:Destroy()
	end
end

function Sword:StartRain()
	if Sword.RainActive then return end
	Sword.RainActive = true

	Handle.AcidRain:Play()

	local puddles = {}
	local projectiles = {}
	local rainfallSpeed = {Min=300/2, Max=525/2}
	local myCharacter, myPlayer, myHumanoid = GLib.GetCharacter(Tool)
	local ignoreList = {myCharacter}
	local humanoid = GLib.GetHumanoid(myCharacter)

	local basePuddle = GLib.Create'Part'{
		Name = 'DualVenomshanks_PoisonPuddle',
		BrickColor = BrickColor.new'Grime',
		Material = 'SmoothPlastic',
		FormFactor = 'Custom',
		Anchored = true,
		CanCollide = false,
		Locked = true,
		TopSurface = 'Smooth',
		BottomSurface = 'Smooth',

		GLib.Create'CylinderMesh'{}
	}
	local baseProjectile = GLib.Create'Part'{
		Name = 'DualVenomshanks_PoisonProjectile',
		BrickColor = BrickColor.new'Grime',
		Material = 'SmoothPlastic',
		FormFactor = 'Custom',
		Anchored = true,
		CanCollide = false,
		Locked = true,
		TopSurface = 'Smooth',
		BottomSurface = 'Smooth',

		GLib.Create'SpecialMesh'{
			MeshType = 'Head'
		}
	} do
		baseProjectile.Size = Vector3.new(1, 1.5, 1)
	end
	local puddleModel = GLib.Create'Model'{
		Name = 'DualVenomshanks_PoisonPuddles',
	} do
		local WFV = Instance.new("NumberValue")
		WFV.Name = "WaitFor"

		local RemoVPDS = NS([[
wait(script:WaitForChild('WaitFor', 5).Value)
script.Parent:Destroy()

]], puddleModel)
		WFV.Parent = RemoVPDS
		RemoVPDS.Name = "RemovePuddles"

		puddleModel.RemovePuddles.WaitFor.Value = Config.PuddleLifetime.Value
		puddleModel.Parent = workspace
	end

	local startingPuddle = basePuddle:Clone()
	startingPuddle.Size = Vector3.new(Config.PuddleRadius.Value*2, 0.2, Config.PuddleRadius.Value*2)
	local hit, pos, norm = workspace:FindPartOnRayWithIgnoreList(
		Ray.new(
			myHumanoid.Torso.Position,
			Vector3.new(0, -100, 0)
		),
		ignoreList
	)
	if hit then
		table.insert(puddles, startingPuddle)
		table.insert(ignoreList, startingPuddle)

		startingPuddle.Parent = puddleModel
		startingPuddle.CFrame = CFrame.new(
			pos,
			pos + norm
		) * CFrame.Angles(math.pi/2, 0, 0)
	end

	GLib.FastSpawn(function()
		local startedAt = tick()
		local delta = 0
		while (tick() - startedAt) < Config.PuddleLifetime.Value and Tool.Parent == myCharacter and humanoid.Health > 0 and puddleModel and puddleModel.Parent do
			-- puddle damage
			local offset = 0
			for index, puddle in next, puddles do
				if puddle.Parent == puddleModel then
					local region = Region3.new(
						puddle.Position - puddle.Size/2,
						puddle.Position + puddle.Size/2
					)
					local parts = workspace:FindPartsInRegion3WithIgnoreList(region, ignoreList, 100)

					local targettingHumanoids = {}
					for index, part in next, parts do
						if ((part.Position - puddle.Position)*Vector3.new(1,0,1)).magnitude <= puddle.Size.x/2 then
							local character, player, humanoid = GLib.GetCharacter(part)
							if character and humanoid and not targettingHumanoids[humanoid] then
								local protected = GLib.IsProtected(humanoid)
								if not protected then
									if (player and not GLib.IsTeammate(player, myPlayer)) or not player then
										targettingHumanoids[humanoid] = {Player = player, Character = character}
									end
								end
							end
						end
					end

					for humanoid, info in next, targettingHumanoids do
						local hitsound = Handle.AcidHit:Clone()
						hitsound.Pitch = (1.2-0.7)*math.random() + 0.7
						hitsound.Parent = humanoid.Torso
						hitsound:Play()

						Debris:AddItem(hitsound, 4)

						if humanoid.Health > 0 then
							GLib.TagHumanoid(myPlayer, humanoid, 1)
							humanoid:TakeDamage(Config.AcidDamage.Value)

							if info.Player ~= nil and info.Character:FindFirstChild'DualVenomshanks_DisableJump'==nil then
								local extra_lifetime = Instance.new("NumberValue")
								extra_lifetime.Name = "ExtraLifetime"

								local lifetime = Instance.new("NumberValue")
								lifetime.Name = "Lifetime"

								local humanoid = Instance.new("ObjectValue")
								humanoid.Name = "Humanoid"

								local disableJumpScript = NLS([[
								
								
	--Copied into the character to disable jumping


local humanoid = script:WaitForChild'Humanoid'.Value
local jumpCon = humanoid.Changed:connect(function(prop)
	if prop == 'Jump' and humanoid.Jump == true then
		humanoid.Jump = false
	end
end)

wait(script:WaitForChild'Lifetime'.Value)

jumpCon:disconnect()

wait(script.ExtraLifetime.Value)

script:Destroy()
								
								
								]])
								disableJumpScript.Humanoid.Value = humanoid
								disableJumpScript.Lifetime.Value = 1.5
								disableJumpScript.ExtraLifetime.Value = 0.5
								disableJumpScript.Parent = info.Character
							end

							if humanoid.Health <= 0 then
								for index, part in next, GLib.GetDescendants(info.Character) do
									local skeletonInfo = Sword.SkeletonAssets[part.Name]
									if part:IsA'BasePart' and skeletonInfo then
										local skelepart = part:Clone()
										skelepart.Name = 'DualVenomshanks_SkeletonPart'
										skelepart.CanCollide = true
										skelepart:ClearAllChildren()

										GLib.Create'SpecialMesh'{
											Name = 'SkeletonMesh',
											MeshType = 'FileMesh',
											Scale = skeletonInfo.Scale,
											TextureId = 'rbxassetid://'..skeletonInfo.TextureId,
											MeshId = 'rbxassetid://'..skeletonInfo.MeshId,
											Parent = skelepart
										}

										part:Destroy()

										Debris:AddItem(skelepart, 10)
										skelepart.Parent = workspace
									end
								end
							end
						end
					end
				else
					table.remove(puddles, index+offset)
					offset = offset-1
				end
			end

			-- Rain spawner
			if math.random() <= 0.1 then
				local proj = baseProjectile:Clone()
				table.insert(projectiles, {
					Proj = proj,
					Mass = 1,
					Speed = rainfallSpeed.Min
				})
				table.insert(ignoreList, proj)
				Debris:AddItem(proj, 5)

				proj.Parent = puddleModel
				local dir = Vector3.new(math.random()-.5, math.random(), math.random()-.5).unit
				proj.CFrame = myHumanoid.Torso.CFrame + dir*Config.PuddleSpawnRadius.Value
			end

			-- Rain mover
			local offset = 0
			for index, info in next, projectiles do
				local hit, pos, norm = workspace:FindPartOnRayWithIgnoreList(
					Ray.new(
						info.Proj.Position,
						Vector3.new(0, math.max(-900, -info.Speed*delta), 0)
					),
					ignoreList
				)
				if hit then
					local character, player, humanoid = GLib.GetCharacter(hit)

					if not humanoid then
						local puddle = basePuddle:Clone()
						local radius = (Config.PuddleRadius.Value - 3)*math.random() + 3
						puddle.Size = Vector3.new(radius, (1-0.2)*math.random()+0.2, radius)
						puddle.CFrame = CFrame.new(pos, pos+norm) * CFrame.Angles(math.pi/2, 0, 0)
						puddle.Parent = puddleModel

						table.insert(puddles, puddle)
						table.insert(ignoreList, puddle)

						table.remove(projectiles, index+offset)
						offset = offset-1

						info.Proj:Destroy()
					end
				else
					info.Speed = math.min(info.Speed + info.Mass*delta, rainfallSpeed.Max)
					info.Proj.CFrame = info.Proj.CFrame + (pos - info.Proj.Position)
				end
			end

			delta = wait()
		end

		Handle.AcidRain:Stop()
		Sword.RainActive = false
	end)
end

function Sword:Spin()
	if Sword.State ~= 'Lunging' then return end
	if Sword.SpinDebounce then return end
	Sword.SpinDebounce = true

	local character = GLib.GetCharacterFromPart(Tool)
	local root = character and (character:FindFirstChild'HumanoidRootPart' or character:FindFirstChild'Torso')
	local humanoid = character and GLib.GetHumanoid(character)

	if character and root and root:IsA'BasePart' and humanoid and humanoid.Health>0 then
		Sword.Spins = Sword.Spins + 1
		Sword.SpinTicket = Sword.SpinTicket + 1
		local mySpinTicket = Sword.SpinTicket

		if Sword.Spins >= Config.SpinsToWhirlwind.Value then
			Sword:Whirlwind()
			Sword.Spins = 0
		else
			if Sword.Spins == Config.SpinsToWhirlwind.Value-1 then
				Tool.Data.WhirlwindAvailable.Value = true
			end

			delay(3.6, function()
				while mySpinTicket == Sword.SpinTicket do
					Sword.Spins = Sword.Spins - 1
					Tool.Data.WhirlwindAvailable.Value = false

					if Sword.Spins <= 0 then break end
					wait(0.5)
				end
			end)

			Sword.SpinForce.Parent = root
			Sword.StayUpright.Parent = root
			Sword:MotorAnimate'Spin'
			wait(0.5)
			Sword:MotorAnimate('Spin', 'Stop')
			Sword.SpinForce.Parent = nil
			Sword.StayUpright.Parent = nil
		end
	end

	Sword.SpinDebounce = false
end

function Sword:ForceSpin() -- Used for mobile controls so that mobile users don't have to double-tap and then press the button
	Sword.AttackTicket = Sword.AttackTicket+1
	GLib.FastSpawn(function() Sword:Lunge(Sword.AttackTicket) end)
	Sword:Spin() -- Now that we're lunging we can spin
end

function Sword:Whirlwind()
	if Sword.WhirlwindDebounce then return end
	Sword.WhirlwindDebounce = true
	Tool.Data.WhirlwindAvailable.Value = false

	local character = GLib.GetCharacterFromPart(Tool)
	local root = character and (character:FindFirstChild'HumanoidRootPart' or character:FindFirstChild'Torso')
	local humanoid = character and GLib.GetHumanoid(character)

	if character and root and root:IsA'BasePart' and humanoid and humanoid.Health>0 then
		Sword:StartRain()
		wait(Config.PuddleLifetime.Value)
	end

	Sword.WhirlwindDebounce = false
end

function Sword:Blow(hit, damage)
	local myPlayer = GLib.GetPlayerFromPart(Tool)
	local character, player, humanoid = GLib.GetCharacterFromPart(hit)

	if myPlayer~=nil and character~=nil and humanoid~=nil and myPlayer~=player then
		local isTeammate = GLib.IsTeammate(myPlayer, player)
		local myCharacter = myPlayer.Character
		local myHumanoid = myCharacter and myCharacter:FindFirstChild'Humanoid'

		if (Config.CanTeamkill.Value==true or isTeammate~=true) and (myHumanoid and myHumanoid:IsA'Humanoid' and myHumanoid.Health > 0) and (Config.CanKillWithForceField.Value or myCharacter:FindFirstChild'ForceField'==nil) and humanoid.Health > 0 then
			local doDamage = Config.IdleDamage.Value
			if Sword.State == 'Slashing' then
				doDamage = Config.SlashDamage.Value
			elseif Sword.State == 'Lunging' then
				doDamage = Config.LungeDamage.Value
			end
			if damage then doDamage=damage end

			GLib.TagHumanoid(humanoid, myPlayer, 1)
			humanoid:TakeDamage(doDamage)
			Sword:PoisonHumanoid(humanoid)
		end
	end
end

function Sword:Connect()
	local function swordTouched(hit)
		Sword:Blow(hit)
	end

	Handle.Touched:connect(swordTouched)

	Tool.Unequipped:connect(function()
		for name, track in next, Sword.Tracks do
			track:Stop()
		end

		Sword.Tracks = {}

		if Sword.LeftSword then Sword.LeftSword:Destroy() Sword.LeftSword=nil end
	end)
	Tool.Equipped:connect(function() if Sword.LeftSword then return end
		Sword.LeftSword = Tool.Handle:Clone()
		Sword.LeftSword.Name = 'LeftSword'
		Sword.LeftSword.Parent = Tool
		local weld = Instance.new("ManualWeld")
		weld.Name = 'Weld'
		weld.Part1 = Sword.LeftSword
		weld.C0 = CFrame.new(0, -1, 0, 1, 0, -0, 0, 0, 1, 0, -1, -0)
		weld.C1 = CFrame.new(0, 0, -2, 0, 0, -1, -1, 0, 0, 0, 1, 0)
		weld.Part0 = Tool.Parent:FindFirstChild'Left Arm'
		weld.Parent = Sword.LeftSword

		Sword.LeftSword.Touched:connect(swordTouched)
	end)
end

function Sword:Attack()
	local myCharacter, myPlayer, myHumanoid = GLib.GetCharacterFromPart(Tool)

	if myHumanoid~=nil and myHumanoid.Health > 0 then
		if Config.CanKillWithForceField.Value or myCharacter:FindFirstChild'ForceField'==nil then
			local now = tick()

			if Sword.State == 'Slashing' and now-Sword.SlashingStartedAt < Sword.DoubleClickMaxTime then
				Sword.AttackTicket = Sword.AttackTicket+1

				Sword:Lunge(Sword.AttackTicket)
			elseif Sword.State == 'Idle' then
				Sword.AttackTicket = Sword.AttackTicket+1
				Sword.SlashingStartedAt = now

				Sword:Slash(Sword.AttackTicket)
			end
		end
	end
end

function Sword:Slash(ticket)
	Sword.State = 'Slashing'

	Sword:MotorAnimate'Slash'
	Handle.SlashSound:Play()

	wait(0.5)

	if Sword.AttackTicket == ticket then
		Sword.State = 'Idle'
	end
end

function Sword:Lunge(ticket)
	Sword.State = 'Lunging'

	Sword:MotorAnimate'Lunge'
	Handle.LungeSound:Play()

	local force = Instance.new'BodyVelocity'
	force.velocity = Vector3.new(0, 10, 0)
	force.maxForce = Vector3.new(0, 4000, 0)
	force.Parent = Tool.Parent.Torso

	wait(0.25)
	Tool.Grip = CFrame.new(0, 0, -2, 0, -1, -0, -1, 0, -0, 0, 0, -1)
	if Tool:FindFirstChild'LeftSword' then
		Tool.LeftSword.Weld.C1 = CFrame.new(0, 0, -2, 0, -1, -0, -1, 0, -0, 0, 0, -1)
	end
	wait(0.25)
	force:Destroy()
	wait(0.5)
	Tool.Grip = CFrame.new(0, 0, -2, 0, 0, 1, 1, 0, 0, 0, 1, 0)
	if Tool:FindFirstChild'LeftSword' then
		Tool.LeftSword.Weld.C1 = CFrame.new(0, 0, -2, 0, 0, -1, -1, 0, 0, 0, 1, 0)
	end

	Sword.State = 'Idle'
end

function Sword:Animate(name)
	local tag = Instance.new'StringValue'
	tag.Name = 'toolanim'
	tag.Value = name
	tag.Parent = Tool -- Tag gets removed by the animation script
end

function Sword:MotorAnimate(name, action)
	local animation = Tool:FindFirstChild(name)
	local character, player, humanoid = GLib.GetCharacterFromPart(Tool)
	if humanoid then
		local track = Sword.Tracks[animation] or humanoid:LoadAnimation(animation)
		Sword.Tracks[animation] = track

		if action == 'Play' or action == nil then
			track:Play()
		elseif action == 'Stop' then
			track:Stop()
		end
	end
end

function Sword:InterpretInput(type, state, keycode)
	if (type == 'Keyboard' and state == 'Begin' and (keycode == 'E' or keycode == 'Q' or keycode == 'F'))
		or (type == 'Gamepad1' and state == 'Begin' and keycode == 'ButtonX') then
		Sword:Spin()
	end
end

--
function Sword:Initialize()
	Sword:Connect()

	spawn(function()
		while script:IsDescendantOf(game) do
			Sword:PoisonStep()
			wait(Config.PoisonRate.Value)
		end
	end)
end

--
--

---------------------------------------

local Handle = Tool:WaitForChild'Handle'
local LeftSword
local Tracks = {}
local DisconnectOnUnquipped = {}
local UIS, CAS = game:GetService'UserInputService', game:GetService'ContextActionService'

if not workspace.FilteringEnabled then
	-- Run the sword code on the client
	
	Sword:Initialize()
end

function onInput(input, type, state, key)
	local type, state, key = type, state, key
	if input then
		type, state, key = input.UserInputType.Name, input.UserInputState.Name, input.KeyCode.Name
	end
	
	if workspace.FilteringEnabled then
		Tool.RemoteInput:FireServer(type, state, key)
	else
		Sword:InterpretInput(type, state, key)
	end
end

function MotorAnimate(name, action)
	local animation = Tool:FindFirstChild(name)
	local track = Tracks[animation] or GLib.GetHumanoid(GLib.GetCharacterFromPart(Tool)):LoadAnimation(animation)
	Tracks[animation] = track
	
	if action == 'Play' or action == nil then
		track:Play()
	elseif action == 'Stop' then
		track:Stop()
	end
end

Tool.Equipped:connect(function(mouse)
	if not Tool:FindFirstChild'LocalLeftSword' then
		mouse.Button1Down:connect(function()
			if workspace.FilteringEnabled then
				-- Send input info to the server
				Tool.RemoteClick:FireServer()
			else
				-- Interpret it on the client
				Sword:Attack()
			end
		end)
		
		if not Tool:FindFirstChild'LeftSword' then
			LeftSword = Tool.Handle:Clone()
			LeftSword.Name = 'LocalLeftSword'
			LeftSword.Parent = Tool
			local weld = Instance.new("ManualWeld")
			weld.Part1 = LeftSword
			weld.C0 = CFrame.new(0, -1, 0, 1, 0, -0, 0, 0, 1, 0, -1, -0)
			weld.C1 = CFrame.new(0, 0, -1.5, 0, 0, 1, 1, 0, 0, 0, 1, 0)
			weld.Part0 = Tool.Parent:FindFirstChild'Left Arm'
			weld.Parent = LeftSword
		end
	end
		
	MotorAnimate('Idle', 'Play')
	
	table.insert(DisconnectOnUnquipped, UIS.InputBegan:connect(onInput))
	if UIS.TouchEnabled then
		local spinDisabled = false
		CAS:BindActionToInputTypes(
			'DualVenomshanks_Spin',
			function(action, state)
				GLib.FastSpawn(function()
					if state == Enum.UserInputState.Begin then
						if not spinDisabled then
							if not Tool.Data.WhirlwindAvailable.Value then
								spinDisabled = true
								if workspace.FilteringEnabled then Tool.RemoteAction:FireServer'Spin' else Sword:ForceSpin() end
								GLib.SetButtonCooldown('DualVenomshanks_Spin', 0.5)
								wait(0.5)
								GLib.SetButtonCooldown('DualVenomshanks_Spin', 0)
								spinDisabled = false
							else
								Tool.Data.WhirlwindAvailable.Value = false
								spinDisabled = true
								if workspace.FilteringEnabled then Tool.RemoteAction:FireServer'Whirlwind' else Sword:Whirlwind() end
								GLib.SetButtonCooldown('DualVenomshanks_Spin', 30)
								wait(30)
								GLib.SetButtonCooldown('DualVenomshanks_Spin', 0)
								spinDisabled = false
							end
						end
					end
				end)
			end,
			true,
			''
		)
		CAS:SetTitle('DualVenomshanks_Spin', 'Spin')
		
		table.insert(DisconnectOnUnquipped, Tool.Data.WhirlwindAvailable.Changed:connect(function(available)
			if available then
				CAS:SetTitle('DualVenomshanks_Spin', 'Acid Rain!')
			else
				CAS:SetTitle('DualVenomshanks_Spin', 'Spin')
			end
		end))
	end
end)
Tool.Unequipped:connect(function()
	if LeftSword then LeftSword:Destroy() end
	
	for name, track in next, Tracks do
		track:Stop()
	end
	Tracks = {}
	
	for i, con in next, DisconnectOnUnquipped do con:disconnect() end
	
	if UIS.TouchEnabled then
		CAS:UnbindAction'DualVenomshanks_Spin'
	end
end)
Tool.ChildAdded:connect(function(child)
	if child.Name == 'LeftSword' then
		if LeftSword then LeftSword:Destroy() end
	end
end)