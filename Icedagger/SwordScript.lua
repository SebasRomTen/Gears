--Rescripted by Luckymaxer

local MisL : "Library" = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/MisL/main/source.lua"))()

Tool = script.Parent
Handle = Tool:WaitForChild("Handle")
Mesh = Handle:WaitForChild("Mesh")

Players = game:GetService("Players")
Debris = game:GetService("Debris")
RunService = game:GetService("RunService")

BaseUrl = "http://www.roblox.com/asset/?id="

Grips = {
	Up = CFrame.new(0, 0, -0.75, 0, 0, 1, 1, 0, 0, 0, 1, 0),
	Out = CFrame.new(0, 0, -0.75, 0, -1, -0, -1, 0, -0, 0, 0, -1),
}

DamageValues = {
	BaseDamage = 5,
	SlashDamage = 10,
	LungeDamage = 15,
}

Damage = DamageValues.BaseDamage

Sounds = {
	Slash = Handle:WaitForChild("Slash"),
	Lunge = Handle:WaitForChild("Lunge"),
	Unsheath = Handle:WaitForChild("Unsheath"),
}

LastAttack = 0

CanFreeze = false
ToolEquipped = false

Tool.Enabled = true

function SwordUp()
	Tool.Grip = Grips.Up
end

function SwordOut()
	Tool.Grip = Grips.Out
end

function ToggleFreeze(Boolean)
	CanFreeze = Boolean
	if CanFreeze then
		Handle.BrickColor = BrickColor.new("Bright blue")
		Mesh.VertexColor = Vector3.new(0, 0.7, 1)
		Tool.TextureId = (BaseUrl .. "179697540")
	else
		Handle.BrickColor = BrickColor.new("White")
		Mesh.VertexColor = Vector3.new(1, 1, 1)
		Tool.TextureId = (BaseUrl .. "83689547")
	end
end

function IceEffect(character)
	if not character then
		return
	end
	local humanoid = character:FindFirstChild("Humanoid")
	if not humanoid then
		return
	end
	for i, v in pairs(character:GetChildren()) do
		if v:IsA("ForceField") then
			return
		end
	end
	local IceEffectCopy = character:FindFirstChild("IceEffect")
	local ImmuneFire = character:FindFirstChild("Firebrand")
	if IceEffectCopy or ImmuneFire then
		return
	end
	
	local ice_form = Instance.new("Sound")
	ice_form.SoundId = "http://www.roblox.com/asset/?id=41763367"
	ice_form.Volume = 0.6000000238418579
	ice_form.Name = "IceForm"

	local shatter = Instance.new("Sound")
	shatter.PlaybackSpeed = 1.7999999523162842
	shatter.SoundId = "http://www.roblox.com/asset/?id=87015121"
	shatter.Volume = 0.6000000238418579
	shatter.Name = "Shatter"

	local shatter2 = Instance.new("Sound")
	shatter2.PlaybackSpeed = 1.2999999523162842
	shatter2.SoundId = "http://www.roblox.com/asset/?id=122571929"
	shatter2.Volume = 1
	shatter2.Name = "Shatter2"
	
	IceEffectCopy = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/Icedagger/IceEffect.lua", "server")
	IceEffectCopy.Name = "IceEffect"
	ice_form.Parent = IceEffectCopy
	shatter.Parent = IceEffectCopy
	shatter2.Parent = IceEffectCopy
	local Creator = Instance.new("ObjectValue")
	Creator.Name = "Creator"
	Creator.Value = Player
	Creator.Parent = IceEffectCopy
	IceEffectCopy.Parent = character
end

function IsTeamMate(Player1, Player2)
	return (Player1 and Player2 and not Player1.Neutral and not Player2.Neutral and Player1.TeamColor == Player2.TeamColor)
end

function TagHumanoid(humanoid, player)
	local Creator_Tag = Instance.new("ObjectValue")
	Creator_Tag.Name = "creator"
	Creator_Tag.Value = player
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

function Attack()
	Damage = DamageValues.SlashDamage
	Sounds.Slash:Play()
	local Anim = Instance.new("StringValue")
	Anim.Name = "toolanim"
	Anim.Value = "Slash"
	Anim.Parent = Tool
end

function Lunge()
	Damage = DamageValues.LungeDamage
	Sounds.Lunge:Play()
	local Anim = Instance.new("StringValue")
	Anim.Name = "toolanim"
	Anim.Value = "Lunge"
	Anim.Parent = Tool	
	local Force = Instance.new("BodyVelocity")
	Force.velocity = Vector3.new(0, 10, 0) 
	Force.maxForce = Vector3.new(0, 4000, 0)
	Debris:AddItem(Force, 0.5)
	Force.Parent = RootPart
	wait(0.25)
	SwordOut()
	wait(0.25)
	if Force and Force.Parent then
		Force:Destroy()
	end
	wait(0.5)
	SwordUp()
end

function Blow(Hit)
	if not Hit or not Hit.Parent or not CheckIfAlive() then
		return
	end
	local RightArm = (Character:FindFirstChild("Right Arm") or Character:FindFirstChild("RightHand"))
	if not RightArm then
		return
	end
	local RightGrip = RightArm:FindFirstChild("RightGrip")
	if not RightGrip or (RightGrip.Part0 ~= RightArm and RightGrip.Part1 ~= RightArm) or (RightGrip.Part0 ~= Handle and RightGrip.Part1 ~= Handle) then
		return
	end
	local character = Hit.Parent
	local humanoid = character:FindFirstChild("Humanoid")
	if not humanoid or humanoid.Health == 0 then
		return
	end
	local player = Players:GetPlayerFromCharacter(character)
	if player and (player == Player or IsTeamMate(Player, player)) then
		return
	end
	if humanoid.Health > 0 then
		if not CanFreeze then
			UntagHumanoid(humanoid)
			TagHumanoid(humanoid, Player)
			humanoid:TakeDamage(Damage)
		end
		if CanFreeze then
			IceEffect(character)
		end
	end
end

function Activated()
	if not Tool.Enabled or not ToolEquipped or not CheckIfAlive() then
		return
	end
	Tool.Enabled = false
	local Tick = RunService.Stepped:wait()
	if (Tick - LastAttack) < 0.2 then
		Lunge()
	else
		Attack()
	end
	Damage = DamageValues.BaseDamage
	LastAttack = Tick
	Tool.Enabled = true
end

function CheckIfAlive()
	return (((Character and Character.Parent and Humanoid and Humanoid.Parent and Humanoid.Health > 0 and RootPart and RootPart.Parent and Player and Player.Parent) and true) or false)
end

function Equipped()
	Character = Tool.Parent
	Player = Players:GetPlayerFromCharacter(Character)
	Humanoid = Character:FindFirstChild("Humanoid")
	RootPart = Character:FindFirstChild("HumanoidRootPart")
	if not CheckIfAlive() then
		return
	end
	ToolEquipped = true
	Spawn(function()
		ToggleFreeze(false)
		if ToolUnequipped then
			ToolUnequipped:disconnect()
		end
		local CurrentlyEquipped = true
		ToolUnequipped = Tool.Unequipped:connect(function()
			CurrentlyEquipped = false
		end)
		wait(1.5)
		if ToolEquipped and CurrentlyEquipped and CheckIfAlive() then
			Sounds.Unsheath:Play()
			ToggleFreeze(true)
		end
	end)
end

function Unequipped()
	ToggleFreeze(false)
	ToolEquipped = false
end

ToggleFreeze(false)
SwordUp()

Handle.Touched:connect(Blow)

Tool.Activated:connect(Activated)
Tool.Equipped:connect(Equipped)
Tool.Unequipped:connect(Unequipped)