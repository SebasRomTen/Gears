--Rescripted by Luckymaxer
MisL = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/MisL/main/source.lua"))()

Tool = script.Parent
Handle = Tool:WaitForChild("Handle")

Players = game:GetService("Players")
Debris = game:GetService("Debris")
RunService = game:GetService("RunService")

Create = function(ty)
	return function(data)
		local obj = Instance.new(ty)
		for k, v in pairs(data) do
			if type(k) == 'number' then
				v.Parent = obj
			else
				obj[k] = v
			end
		end
		return obj
	end
end

BaseUrl = "rbxassetid://"

SoulCounter = script:WaitForChild("SoulCounter")
HelpGui = script:WaitForChild("HelpGui")

LastAttack = 0
Lunging = false

Grips = {
	Up = CFrame.new(0, -2.3, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
	Out = CFrame.new(0, -2.3, 0, 1, 0, 0, 0, 0, -1, -0, 1, 0),
}

Animations = {
	--Consume = {Animation = Tool:WaitForChild("Consume"), FadeTime = nil, Weight = nil, Speed = nil},
	Purge = {Animation = Tool:WaitForChild("Purge"), FadeTime = nil, Weight = nil, Speed = nil},
	R15Purge = {Animation = Tool:WaitForChild("R15Purge"), FadeTime = nil, Weight = nil, Speed = nil}
}

Sounds = {
	Consume = Handle:WaitForChild("Consume"),
	Purge = Handle:WaitForChild("Purge"),
	Unsheath = Handle:WaitForChild("Unsheath"),
	Slash = Handle:WaitForChild("Slash"),
	Lunge = Handle:WaitForChild("Lunge"),
}

BasePart = Create("Part"){
	Material = Enum.Material.Plastic,
	Shape = Enum.PartType.Block,
	TopSurface = Enum.SurfaceType.Smooth,
	BottomSurface = Enum.SurfaceType.Smooth,
	FormFactor = Enum.FormFactor.Custom,
	Size = Vector3.new(0.2, 0.2, 0.2),
	CanCollide = true,
	Locked = true,
}

SoulFire = Create("Fire"){
	Name = "Fire",
	Color = Color3.new((255 / 255), (0 / 255), (0 / 255)),
	SecondaryColor = Color3.new((85 / 255), (0 / 255), (0 / 255)),
	Heat = 18,
	Size = 2.5,
	Enabled = true,
}
SoulLight = Create("PointLight"){
	Name = "Light",
	Color = SoulFire.Color,
	Brightness = 35,
	Range = 4,
	Shadows = false,
	Enabled = true,
}

Gravity = workspace.Gravity

SoulColors = {
	Color3.new(1, 0, 0),
	Color3.new(1, 0.2, 0),
	Color3.new(0.8, 0.2, 0),
	Color3.new(1, 0, 0.2),
	Color3.new(0.8, 0.4, 0),
}

SwordDamage = 25

Abilities = {
	Consume = {
		Enabled = true,
		Active = false,
		ReloadTime = 20,
	},
	Purge = {
		Enabled = true,
		Active = false,
		ReloadTime = 42,
	},
}

ToolEquipped = false

ServerControl = (Tool:FindFirstChild("ServerControl") or Create("RemoteFunction"){
	Name = "ServerControl",
	Parent = Tool,
})

ClientControl = (Tool:FindFirstChild("ClientControl") or Create("RemoteFunction"){
	Name = "ClientControl",
	Parent = Tool,
})

SoulCounter.Value = 0
Tool.Grip = Grips.Up
Tool.Enabled = true

function IsTeamMate(Player1, Player2)
	return (Player1 and Player2 and not Player1.Neutral and not Player2.Neutral and Player1.TeamColor == Player2.TeamColor)
end

function TagHumanoid(humanoid, player)
	local Creator_Tag = Create("ObjectValue"){
		Name = "creator",
		Value = player,
	}
	Debris:AddItem(Creator_Tag, 2)
	Creator_Tag.Parent = humanoid
end

function UntagHumanoid(humanoid)
	for i, v in pairs(humanoid:GetChildren()) do
		if v:IsA("ObjectValue") and v.Name == "creator" then
			v:Destroy()
		end
	end
end

function Decimate(character)
	if not character or not CheckIfAlive() then
		return
	end
	for i, v in pairs(character:GetChildren()) do
		if v:IsA("ForceField") then
			return
		end
	end
	local DecimateScriptCopy = character:FindFirstChild("DecimateScript")
	if DecimateScriptCopy then
		return
	end
	local Values = {
		{Name = "Creator", Class = "ObjectValue", Value = Player},
		{Name = "Counter", Class = "ObjectValue", Value = SoulCounter},
	}
	local DecimateScriptCopy = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/Crescendo/DecimateScript.lua", "server")
	for i, v in pairs(Values) do
		local Value = Create(v.Class){
			Name = v.Name,
			Value = v.Value,
			Parent = DecimateScriptCopy,
		}
	end
	DecimateScriptCopy.Parent = character
end

function Blow(Part, Damage)
	local PartTouched
	PartTouched = Part.Touched:connect(function(Hit)
		if not Hit or not Hit.Parent or not CheckIfAlive() then
			return
		end
		local RightArm = Character:FindFirstChild("Right Arm") or Character:FindFirstChild("RightHand")
		if not RightArm then
			return
		end
		local RightGrip = RightArm:FindFirstChild("RightGrip")
		if not RightGrip or (RightGrip.Part0 ~= Handle and RightGrip.Part1 ~= Handle) then
			return
		end
		local character = Hit.Parent
		if character == Character then
			return
		end
		local humanoid = character:FindFirstChild("Humanoid")
		if not humanoid or humanoid.Health == 0 then
			return
		end
		local player = Players:GetPlayerFromCharacter(character)
		if player and (player == Player or IsTeamMate(Player, player)) then
			return
		end
		local HealthAfter = (humanoid.Health - Damage)
		if HealthAfter < 20 then
			Decimate(character)
		else
			UntagHumanoid(humanoid)
			TagHumanoid(humanoid, Player)
			humanoid:TakeDamage(Damage)
		end
		Humanoid.Health = (Humanoid.Health + (Damage / 10))
		spawn(function()
			humanoid.WalkSpeed = 9
			wait(1.25)
			humanoid.WalkSpeed = 16
		end)
	end)
	return PartTouched
end

function CreateTrail(Damage, TrailRate)
	local TrailLoop
	local Count = Create("IntValue"){
		Value = 0,
	}
	local Enabled = Create("BoolValue"){
		Value = true,
	}
	spawn(function()
		while Enabled.Value and ToolEquipped and CheckIfAlive() do
			local TrailPart = Handle:Clone()
			TrailPart.Name = "Effect"
			TrailPart.Transparency = 0.5
			TrailPart.CanCollide = false
			TrailPart.Anchored = true
			Blow(TrailPart, 5)
			Count.Value = (Count.Value + 1)
			Debris:AddItem(TrailPart, 1)
			TrailPart.Parent = game:GetService("Workspace")
			TrailPart.CFrame = Handle.CFrame
			wait(TrailRate)
		end
	end)
	return {Connection = TrailLoop, Count = Count, Enabled = Enabled}
end

function Lunge()
	Lunging = true
	local Target = InvokeClient("MousePosition")
	if not Target then
		return
	end
	local TargetPosition = Target.Position
	local Direction = (CFrame.new(Torso.Position, TargetPosition).lookVector * Vector3.new(1, 0, 1))
	Tool.Grip = Grips.Out
	Sounds.Lunge:Play()
	local Anim = Create("StringValue"){
		Name = "toolanim",
		Value = "Lunge",
		Parent = Tool,
	}
	if Direction.Magnitude > .01 then
		Direction = Direction.Unit 
		local NewBV = Create("BodyVelocity"){
			P = 100000,
			maxForce = Vector3.new(100000, 0, 100000),
			velocity = (Direction * 50),
		}
		Debris:AddItem(NewBV, 0.75)
		NewBV.Parent = Torso
		Torso.CFrame = CFrame.new(Torso.Position, (TargetPosition * Vector3.new(1, 0, 1) + Vector3.new(0, Torso.Position.Y, 0)))
	end
	spawn(function()
		local LungeTrail = CreateTrail(5, 0.08)
		while Lunging and CheckIfAlive() and ToolEquipped do
			RunService.Stepped:wait()
		end
		LungeTrail.Enabled.Value = false
	end)
	wait(0.75)
	Lunging = false 
	Tool.Grip = Grips.Up
	wait(0.5)
end

function Attack()		
	Tool.Grip = Grips.Up
	Sounds.Slash:Play()
	local Anim = Create("StringValue"){
		Name = "toolanim",
		Value = "Slash",
		Parent = Tool,
	}
	spawn(function()
		local AttackTrail = CreateTrail(5, 0.06)
		while AttackTrail.Count.Value < 4 and CheckIfAlive() and ToolEquipped do
			RunService.Stepped:wait()
		end
		AttackTrail.Enabled.Value = false
	end)
	Tool.Grip = Grips.Up
end
--[[
function SetPlayerMaxHealth(humanoid, health)
	if not humanoid or not health then
		return
	end
	local Ratio = (humanoid.Health / humanoid.MaxHealth)
	humanoid.MaxHealth = health
	humanoid.Health = (Ratio * humanoid.MaxHealth)
end
]]
function Encompass()
	for i, v in pairs(Souls:GetChildren()) do
		if v:IsA("BasePart") and v.Name == "Effect" then
			v:Destroy()
		end
	end
	if ToolUnequipped2 then
		ToolUnequipped2:disconnect()
	end
	local CurrentlyEquipped = true
	ToolUnequipped2 = Tool.Unequipped:connect(function()
		CurrentlyEquipped = false
		if ToolUnequipped2 then
			ToolUnequipped2:disconnect()
		end
	end)
	local CurrentCount = SoulCounter.Value
	for i = 1, CurrentCount do
		local Part = BasePart:Clone()
		Part.Name = "Effect"
		Part.Transparency = 1
		Part.Anchored = true
		Part.CanCollide = false
		local Fire = SoulFire:Clone()
		Fire.Size = 1
		Fire.Color = SoulColors[math.random(1, #SoulColors)]
		Fire.Enabled = true
		Fire.Parent = Part
		local Light = SoulLight:Clone()
		Light.Color = Fire.Color
		Light.Enabled = true
		Light.Parent = Part
		--Debris:AddItem(Part, 45)
		Part.Parent = Souls
		spawn(function()
			while Part and Part.Parent and CurrentlyEquipped and ToolEquipped and CheckIfAlive() do
				for i = 1, 30 do
					Part.CFrame = (Torso.CFrame + CFrame.Angles(0, (2 * i * math.pi / 30), 0) * Torso.CFrame.lookVector * 5)
					wait()
				end					
			end
		end)
		wait(0.75)
	end
end

function ConsumeTarget(character, number)
	local Part = BasePart:Clone()
	Part.Name = "Effect"
	Part.Transparency = 1
	Part.Size = Vector3.new(0.5, 0.5, 0.5)
	Part.CanCollide = false
	local Fire = SoulFire:Clone()
	Fire.Size = 1
	Fire.Enabled = true
	Fire.Parent = Part
	local Light = SoulLight:Clone()
	Light.Color = Fire.Color
	Light.Enabled = true
	Light.Parent = Part
	if number and number < 3 then
		number = 3
	end
	if character then
		local torso = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
		if torso then
			number = (number or 4)
			for i = 1, number do
				local Part2 = Part:Clone()
				Part2.CFrame = (Torso.CFrame + Torso.CFrame.lookVector * 4)
				local Propulsion = Create("RocketPropulsion"){
					Target = torso,
					TargetOffset = Vector3.new(0, 2, 0),
					ThrustP = 500,
					ThrustD = 5,
					MaxSpeed = 150,
					MaxTorque = Vector3.new(4000000, 4000000, 0),
					Parent = Part2,
				}
				Debris:AddItem(Part2, 15)
				Part2.Parent = game:GetService("Workspace")
				Propulsion.ReachedTarget:connect(function()
					if not CheckIfAlive() then
						return
					end
					if Part2 and Part2.Parent then
						Part2:Destroy()
					end
					Decimate(character)
				end)
				Propulsion:Fire()
				wait(0.25)
			end
		end
	else
		local TargetPosition = InvokeClient("MousePosition")
		if TargetPosition then
			TargetPosition = TargetPosition.Position
			local Direction = (TargetPosition - Torso.Position).Unit
			for i = 1, 5 do
				local Part2 = Part:Clone()
				Part2.CFrame = (Torso.CFrame + Torso.CFrame.lookVector * 4)
				local Velocity = (Direction * 150)
				local Mass = (Part2:GetMass() * Gravity)
				local BF = Create("BodyForce"){
					Parent = Part2,
					force = Vector3.new(0, Part2:GetMass() * 196.2, 0),
				}
				Part2.Velocity = Velocity
				Part2.Touched:connect(function(Hit)
					if not Hit or not Hit.Parent then
						return
					end
					local character = Hit.Parent
					if character:IsA("Accessory") then
						character = Hit.Parent
					end
					local humanoid = character:FindFirstChild("Humanoid")
					if not humanoid or humanoid.Health == 0 then
						return
					end
					local player = Players:GetPlayerFromCharacter(character)
					if player and (Player == player or IsTeamMate(Player, player)) then
						return
					end
					if Part2 and Part2.Parent then
						Part2:Destroy()
					end
					Decimate(character)
				end)
				Debris:AddItem(Part2, 15)
				Part2.Parent = game:GetService("Workspace")
			end
		end
	end
end

function CreateFirePart(CreateNew)
	for i, v in pairs(Handle:GetChildren()) do
		if v:IsA("BasePart") then
			v:Destroy()
		end
	end
	if not CreateNew then
		return
	end
	FirePart = BasePart:Clone()
	FirePart.Name = "Effect"
	FirePart.Transparency = 1
	FirePart.CanCollide = false
	local Fire = SoulFire:Clone()
	Fire.Enabled = true
	Fire.Parent = FirePart
	local Light = SoulLight:Clone()
	Light.Color = Fire.Color
	Light.Enabled = true
	Light.Parent = FirePart
	local Weld = Create("Weld"){
		Part0 = Handle,
		Part1 = FirePart,
		C0 = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
		C1 = CFrame.new(0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
		Parent = FirePart,
	}
	FirePart.Parent = Handle
end

function CheckIfAlive()
	return (((Character and Character.Parent and Humanoid and Humanoid.Parent and Humanoid.Health > 0 and Torso and Torso.Parent and Player and Player.Parent) and true) or false)
end

function Activated()
	if not Tool.Enabled or not ToolEquipped or not CheckIfAlive() then
		return
	end
	Tool.Enabled = false 
	local Time = RunService.Stepped:wait()
	if (Time - LastAttack) < 0.2 then
		Lunge()
	else
		Attack()
	end
	LastAttack = Time
	Tool.Enabled = true
end

function Equipped()
	Character = Tool.Parent
	Player = Players:GetPlayerFromCharacter(Character)
	Humanoid = Character:FindFirstChild("Humanoid")
	Torso = Character:FindFirstChild("Torso") or Character:FindFirstChild("UpperTorso")
	if not CheckIfAlive() then
		return
	end
	ToolEquipped = true
	spawn(function()
		local CurrentlyEquipped = true
		ToolUnequipped1 = Tool.Unequipped:connect(function()
			CurrentlyEquipped = false
			if ToolUnequipped1 then
				ToolUnequipped1:disconnect()
			end
		end)
		Sounds.Unsheath:Play()
		Humanoid.WalkSpeed = 18
		--SetPlayerMaxHealth(Humanoid, 135)
		CreateFirePart(true)
		spawn(function()
			while ToolEquipped and CurrentlyEquipped and CheckIfAlive() do
				wait(1)
				if not ToolEquipped or not CurrentlyEquipped or not CheckIfAlive() then
					break
				end
				Humanoid.Health = (Humanoid.Health + 0.25)
			end
		end)
		local ModelName = (Player.Name .. "'sSouls")
		Souls = Create("Model"){
			Name = ModelName,
		}
		local Values = {
			{Name = "Creator", Class = "ObjectValue", Value = Player},
			{Name = "Tool", Class = "ObjectValue", Value = Tool},
		}
		local RemoverCopy = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/Crescendo/Remover.lua", "server")
		for i, v in pairs(Values) do
			local Value = Create(v.Class){
				Name = v.Name,
				Value = v.Value,
				Parent = RemoverCopy,
			}
		end
		RemoverCopy.Parent = Souls
		Souls.Parent = game:GetService("Workspace")
		SoulCounter.Changed:connect(Encompass)
		Encompass()
	end)
end

function Unequipped()
	CreateFirePart(true)
	for i, v in pairs({ToolUnequipped1, ToolUnequipped2, HelpGuiCopy}) do
		if tostring(v) == "Connection" then
			v:disconnect()
		elseif v and v.Parent then
			v:Destroy()
		end
	end
	--[[for i, v in pairs(Sounds) do
		v:Stop()
	end]]
	if CheckIfAlive() then
		--SetPlayerMaxHealth(Humanoid, 100)
		Humanoid.WalkSpeed = 16
	end
	Tool.Grip = Grips.Up
	ToolEquipped = false
end

function OnServerInvoke(player, mode, value)
	if player ~= Player or not ToolEquipped or not value or not CheckIfAlive() then
		return
	end
	if mode == "KeyPress" then
		local Key = value.Key
		local Down = value.Down
		if Down and Tool.Enabled then
			if Key == "e" then
				local Ability = Abilities.Consume
				if Ability.Enabled and not Ability.Active then
					Ability.Enabled = false
					Ability.Active = true
					Sounds.Consume:Play()
					local MarkedCharacter = {Player = nil, Distance = 175}
					for i, v in pairs(Players:GetChildren()) do
						if v:IsA("Player") and v ~= Player and v.Character then
							local character = v.Character
							local humanoid = character:FindFirstChild("Humanoid")
							local torso = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
							if humanoid and humanoid.Health > 0 and torso then
								local DistanceApart = (Handle.Position - torso.Position).Magnitude
								if DistanceApart < MarkedCharacter.Distance then
									MarkedCharacter.Player = character
									MarkedCharacter.Distance = DistanceApart
								end
							end
						end
					end
					if MarkedCharacter.Player then
						ConsumeTarget(MarkedCharacter.Player, 4)
					else
						ConsumeTarget() 
					end
					Ability.Active = false
					wait(Ability.ReloadTime)
					Ability.Enabled = true
				end
			elseif Key == "x" then
				local Ability = Abilities.Purge
				if SoulCounter.Value == 0 then
					local PlayerGui = Player:FindFirstChild("PlayerGui")
					if PlayerGui then
						HelpGuiCopy = PlayerGui:FindFirstChild(HelpGui.Name)
						if not HelpGuiCopy then
							HelpGuiCopy = HelpGui:Clone()
							local TextLabel = HelpGuiCopy:FindFirstChild("TextLabel")
							if TextLabel then
								TextLabel.Visible = false
								TextLabel.Position = UDim2.new(0.5, -200, 0, -100)
								Debris:AddItem(HelpGuiCopy, 7.5)
								HelpGuiCopy.Parent = PlayerGui
								TextLabel.Visible = true
								TextLabel:TweenPosition(UDim2.new(0.5, -250, 0, 70), 1, 1, 1, true)
							end
						end
					end
					return
				end
				if Ability.Enabled and not Ability.Active then
					Ability.Enabled = false
					Ability.Active = true
					Sounds.Purge:Play()
					local Animation = Animations.Purge
					if Humanoid and Humanoid.RigType == Enum.HumanoidRigType.R15 then
						Animation = Animations.R15Purge
					end
					spawn(function()
						InvokeClient("PlayAnimation", Animation)
					end)
					Humanoid.WalkSpeed = 10
					wait(1.25)
					Humanoid.WalkSpeed = 18
					local SoulCount = SoulCounter.Value
					SoulCounter.Value = 0
					for i = 1, SoulCount do
						local Pillar = BasePart:Clone()
						BasePart.Name = "Effect"
						Pillar.Transparency = 1
						Pillar.Size = Vector3.new(6, 33, 6)
						Pillar.CanCollide = false 
						local Fire = SoulFire:Clone()
						Fire.Size = 25 
						Fire.Heat = 25
						Fire.Enabled = true
						Fire.Parent = Pillar
						local Light = SoulLight:Clone()
						Light.Color = Fire.Color
						Light.Enabled = true
						Light.Parent = Pillar
						local Mass = (Pillar:GetMass() * Gravity)
						local Float = Create("BodyForce"){
							Name = "Float",
							force = Vector3.new(0, Mass, 0),
							Parent = Pillar,
						}
						local TorsoCFrame = Torso.CFrame
						local DesiredCFrame = (CFrame.new((TorsoCFrame + (TorsoCFrame.lookVector * Vector3.new(1, 0, 1)) * 2).p) * CFrame.new(0, -3, 0))
						local Angle = CFrame.Angles(0, (2 * i * math.pi / SoulCount), 0)
						Pillar.CFrame = (CFrame.new(TorsoCFrame.p, Vector3.new(DesiredCFrame.X, TorsoCFrame.Y, DesiredCFrame.Z)) * Angle)
						Pillar.Velocity = (Pillar.CFrame.lookVector * 75)
						local OriginPos = Pillar.CFrame
						Pillar.Touched:connect(function(Hit)
							if not Hit or not Hit.Parent then
								return
							end
							local character = Hit.Parent
							if character:IsA("Accessory") then
								character = Hit.Parent
							end
							local humanoid = character:FindFirstChild("Humanoid")
							local torso = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
							if not humanoid or humanoid.Health == 0 or not torso then
								return
							end
							local player = Players:GetPlayerFromCharacter(character)
							if player and (Player == player or IsTeamMate(Player, player)) then
								return
							end
							local DistanceApart = (OriginPos.p - torso.Position).Magnitude
							UntagHumanoid(humanoid)
							TagHumanoid(humanoid, Player)
							humanoid:TakeDamage(77 / (DistanceApart % 10))
						end)
						Debris:AddItem(Pillar, 5)
						Pillar.Parent = game:GetService("Workspace")
					end
					Ability.Active = false
					wait(Ability.ReloadTime)
					Ability.Enabled = true
				end
			end
		end
	end
end

function InvokeClient(Mode, Value)
	local ClientReturn = nil
	pcall(function()
		ClientReturn = ClientControl:InvokeClient(Player, Mode, Value)
	end)
	return ClientReturn
end

CreateFirePart(true)

ServerControl.OnServerInvoke = OnServerInvoke

Tool.Activated:connect(Activated)
Tool.Equipped:connect(Equipped)
Tool.Unequipped:connect(Unequipped)

Blow(Handle, SwordDamage)

workspace:GetPropertyChangedSignal("Gravity"):Connect(function()
	Gravity = workspace.Gravity
end)
