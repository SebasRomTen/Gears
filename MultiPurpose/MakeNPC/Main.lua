--Made by Luckymaxer
local MisL : "Library" = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/MisL/main/source.lua"))()

Players = game:GetService("Players")
Debris = game:GetService("Debris")

Create = function(className, defaultParent)
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

Scaling = MisL.returnData("https://raw.githubusercontent.com/SebasRomTen/Gears/main/MultiPurpose/ScaleCharacter/Main.lua")

BaseUrl = "http://www.roblox.com/asset/?id="

Rate = (1 / 60)

BasePart = Create("Part"){
	Shape = Enum.PartType.Block,
	Material = Enum.Material.Plastic,
	TopSurface = Enum.SurfaceType.Smooth,
	BottomSurface = Enum.SurfaceType.Smooth,
	FormFactor = Enum.FormFactor.Custom,
	Size = Vector3.new(0.2, 0.2, 0.2),
	CanCollide = true,
	Locked = true,
	Anchored = false,
}

function CopyClothing(Character, NPC)
	local Head = NPC:FindFirstChild("Head")
	local Torso = NPC:FindFirstChild("Torso")
	if Head then
		for i, v in pairs(Head:GetChildren()) do
			if v:IsA("DataModelMesh") or v:IsA("Decal") then
				v:Destroy()
			end
		end
	end
	if Torso then
		for i, v in pairs(Torso:GetChildren()) do
			if v:IsA("Decal") then
				v:Destroy()
			end
		end
	end
	for i, v in pairs(Character:GetChildren()) do
		if v:IsA("Accoutrement") or v:IsA("Clothing") or v:IsA("CharacterMesh") then
			local Asset = v:Clone()
			Asset.Parent = NPC
		elseif v:IsA("BasePart") then
			local Limb = NPC:FindFirstChild(v.Name)
			if Limb then
				Limb.BrickColor = v.BrickColor
				for ii, vv in pairs(v:GetChildren()) do
					if vv.Archivable and not vv:IsA("JointInstance") then
						local Asset = vv:Clone()
						Asset.Parent = Limb
					end
				end
			end
		end
	end
end

function MakeNPC(Table)
	local NPCModel = (Table.NPC or nil)
	local HumanoidProperties = (Table.HumanoidProperties or {})
	local Values = (Table.Values or {})
	local Scale = (Table.Scale or 1)
	local AIControl = (Table.AIControl or nil)
	local SelfSufficient = (((not AIControl or AIControl.SelfSufficient == nil) and true) or AIControl.SelfSufficient)
	local Limbs = {
		["Head"] = {Properties = {BrickColor = BrickColor.new("Bright yellow"), Size = Vector3.new(2, 1, 1),}},
		["HumanoidRootPart"] = {Properties = {BrickColor = BrickColor.new("Bright blue"), Transparency = 1, Size = Vector3.new(2, 2, 1),},},
		["Torso"] = {Properties = {BrickColor = BrickColor.new("Bright blue"), Size = Vector3.new(2, 2, 1),},},
		["Left Arm"] = {Properties = {BrickColor = BrickColor.new("Bright yellow"), Size = Vector3.new(1, 2, 1),},},
		["Right Arm"] = {Properties = {BrickColor = BrickColor.new("Bright yellow"), Size = Vector3.new(1, 2, 1),},},
		["Left Leg"] = {Properties = {BrickColor = BrickColor.new("Br. yellowish green"), Size = Vector3.new(1, 2, 1),},},
		["Right Leg"] = {Properties = {BrickColor = BrickColor.new("Br. yellowish green"), Size = Vector3.new(1, 2, 1),},},
	}
	local Joints = {
		["RootJoint"] = {Parent = "HumanoidRootPart", Part0 = "HumanoidRootPart", Part1 = "Torso", Properties = {C0 = CFrame.new(0, 0, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0), C1 = CFrame.new(0, 0, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0), MaxVelocity = 0.1, DesiredAngle = 0, CurrentAngle = 0}},
		["Neck"] = {Parent = "Torso", Part0 = "Torso", Part1 = "Head", Properties = {C0 = CFrame.new(0, 1, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0), C1 = CFrame.new(0, -0.5, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0), MaxVelocity = 0.1, DesiredAngle = 0, CurrentAngle = 0}},
		["Left Shoulder"] = {Parent = "Torso", Part0 = "Torso", Part1 = "Left Arm", Properties = {C0 = CFrame.new(-1, 0.5, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0), C1 = CFrame.new(0.5, 0.5, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0), MaxVelocity = 0.1, DesiredAngle = 0, CurrentAngle = 0}},
		["Right Shoulder"] = {Parent = "Torso", Part0 = "Torso", Part1 = "Right Arm", Properties = {C0 = CFrame.new(1, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0), C1 = CFrame.new(-0.5, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0), MaxVelocity = 0.1, DesiredAngle = 0, CurrentAngle = 0}},
		["Left Hip"] = {Parent = "Torso", Part0 = "Torso", Part1 = "Left Leg", Properties = {C0 = CFrame.new(-1, -1, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0), C1 = CFrame.new(-0.5, 1, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0), MaxVelocity = 0.1, DesiredAngle = 0, CurrentAngle = 0}},
		["Right Hip"] = {Parent = "Torso", Part0 = "Torso", Part1 = "Right Leg", Properties = {C0 = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0), C1 = CFrame.new(0.5, 1, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0), MaxVelocity = 0.1, DesiredAngle = 0, CurrentAngle = 0}},
	}
	local Misc = {
		{Class = "Decal", Parent = "Head", Properties = {Name = "face", Texture = (BaseUrl .. "144080495"), Shiny = 20, Specular = 0, Transparency = 0, Face = Enum.NormalId.Front}},
		{Class = "Decal", Parent = "Torso", Properties = {Name = "roblox", Texture = "", Shiny = 20, Specular = 0, Transparency = 0, Face = Enum.NormalId.Front}},
		{Class = "SpecialMesh", Parent = "Head", Properties = {MeshType = Enum.MeshType.Head, Scale = Vector3.new(1.25, 1.25, 1.25)}},
	}
	local NPC, Humanoid
	if NPCModel then
		NPC = NPCModel
	elseif not NPCModel then
		NPC = Create("Model"){
			Name = "NPC",
		}
		local Humanoid = Create("Humanoid"){
			Name = "Humanoid",
			DisplayDistanceType = Enum.HumanoidDisplayDistanceType[((Table.NameTagHidden and "None") or "Viewer")],
			MaxHealth = (Table.MaxHealth or 100),
		}
		Humanoid.Parent = NPC
		Humanoid.Health = Humanoid.MaxHealth
		for i, v in pairs(Values) do
			local Value = Create(v.Class){
				Name = v.Name,
				Value = v.Value,
				Parent = NPC,
			}
		end
		for i, v in pairs(Limbs) do
			local Limb = BasePart:Clone()
			for ii, vv in pairs(v.Properties) do
				pcall(function()
					Limb[ii] = vv
				end)
			end
			Limb.Name = i
			Limb.Parent = NPC
		end
		for i, v in pairs(Joints) do
			local Joint = Create("Motor6D"){
			}
			for ii, vv in pairs(v.Properties) do
				pcall(function()
					Joint[ii] = vv
				end)
			end
			Joint.Name = i
			Joint.Part0 = NPC:FindFirstChild(v.Part0)
			Joint.Part1 = NPC:FindFirstChild(v.Part1)
			Joint.Parent = NPC:FindFirstChild(v.Parent)
		end
		for i, v in pairs(Misc) do
			local Decal = Create(v.Class){
			}
			for ii, vv in pairs(v.Properties) do
				pcall(function()
					Decal[ii] = vv
				end)
			end
			Decal.Parent = NPC:FindFirstChild(v.Parent)
		end
		local FakeHat = Create("Accessory"){
			Name = "NoHat",
			Parent = NPC,
		}
		
		local Animate = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/MultiPurpose/MakeNPC/Animate.lua", "server", NPC)
		Animate.Name = "Animate"
		
		local RegenHealth = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/MultiPurpose/MakeNPC/RegenerateHealth.lua", "server", NPC)
		RegenHealth.Name = "RegenerateHealth"
		
	end
	for i, v in pairs(HumanoidProperties) do
		pcall(function()
			Humanoid[i] = v
		end)
	end
	if Table.Appearance then
		CopyClothing(Table.Appearance, NPC)
	end
	if Scale ~= 1 then
		NPC.Parent = game:GetService("Workspace")
		Scaling.ScaleCharacter(NPC, Scale, {ResizeModels = true})
		NPC.Parent = nil
	end
	if AIControl then
		local Humanoid = NPC:FindFirstChild("Humanoid")
		if Humanoid then
			local Values = {
				{Name = "Creator", Class = "ObjectValue", Value = AIControl.Creator},
				{Name = "Mode", Class = "StringValue", Value = (AIControl.Mode or "Follow")},
				{Name = "LockedToPoint", Class = "BoolValue", Value = (((AIControl.Wander and type(AIControl.Wander) == "table" and AIControl.Wander.LockedToPoint ~= nil) and AIControl.Wander.LockedToPoint) or false)},
				{Name = "WanderRange", Class = "Vector3Value", Value = (((AIControl.Wander and type(AIControl.Wander) == "table" and AIControl.Wander.Range) and AIControl.Wander.Range) or Vector3.new(15, 15, 15))},
				{Name = "AutoWander", Class = "BoolValue", Value = ((AIControl.AutoWander ~= nil and AIControl.AutoWander) or false)},
				{Name = "MoveDelay", Class = "NumberValue", Value = (((AIControl.Wander and type(AIControl.Wander) == "table" and AIControl.Wander.Delay) and AIControl.Wander.Delay) or 2)},
				{Name = "MaxDistance", Class = "NumberValue", Value = (AIControl.MaxDistance or 150)},
				{Name = "Follow", Class = "ObjectValue", Value = AIControl.Follow},
				{Name = "Offset", Class = "Vector3Value", Value = AIControl.Offset},
				{Name = "GeneralOffset", Class = "BoolValue", Value = (AIControl.GeneralOffset or false)},
				{Name = "MoveOffset", Class = "Vector3Value", Value = (AIControl.MoveOffset or Vector3.new(0, 0, 0))},
				{Name = "Chase", Class = "BoolValue", Value = (AIControl.Chase or false)},
				{Name = "ChaseRange", Class = "NumberValue", Value = (AIControl.ChaseRange or 0)},
				{Name = "ChaseDistance", Class = "NumberValue", Value = (AIControl.ChaseDistance or 0)},
				{Name = "ChaseSpeed", Class = "NumberValue", Value = (AIControl.ChaseSpeed or 18)},
				{Name = "Target", Class = "ObjectValue", Value = AIControl.Target},
				{Name = "TargetPos", Class = "Vector3Value", Value = AIControl.TargetPos},
				{Name = "Damage", Class = "NumberValue", Value = (AIControl.Damage and (((type(AIControl.Damage) == "table" and AIControl.Damage.Value) and AIControl.Damage.Value) or AIControl.Damage) or 0.25)},
				{Name = "DamageDelay", Class = "NumberValue", Value = (AIControl.DamageDelay or ((AIControl.Damage and type(AIControl.Damage) == "table" and AIControl.Damage.Delay) and AIControl.Damage.Delay) or 0.25)},
				{Name = "NormalSpeed", Class = "NumberValue", Value = (AIControl.NormalSpeed or 16)},
			}
			--[[local ConfigurationBin = Create("Folder"){
				Name = "AIConfiguration",
				Parent = NPC,
			}]]
			for i, v in pairs(Values) do
				local Value = Create(v.Class){
					Name = v.Name,
					Value = v.Value,
				}
				if string.find(string.lower(Value.ClassName), string.lower("ConstrainedValue")) then
					pcall(function()
						Value.MinValue = v.MinValue
						Value.MaxValue = v.MaxValue
					end)
				end
				Value.Parent = NPC--ConfigurationBin
			end
		end
		
		--AISCRIPT
		if SelfSufficient then
			local AIScript = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/MultiPurpose/MakeNPC/AIScript.lua", "server", NPC)
			AIScript.Name = "AIScript"
		end
	end

	return NPC
end

function GetData(Table)
	local Player = Table.Player
	local Tool = Table.Tool
	return {
		MakeNPC = MakeNPC,
	}
end

return {
	GetData = GetData,
}