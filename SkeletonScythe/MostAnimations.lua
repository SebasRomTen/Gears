local r15 = Instance.new("Folder")
r15.Name = "R15"
r15.Parent = script

local scythe_equip2 = Instance.new("Animation")
scythe_equip2.AnimationId = "rbxassetid://1296863675"
scythe_equip2.Name = "ScytheEquip2"
scythe_equip2.Parent = r15

local scythe_idle2 = Instance.new("Animation")
scythe_idle2.AnimationId = "rbxassetid://1296867556"
scythe_idle2.Name = "ScytheIdle2"
scythe_idle2.Parent = r15

local scytheslash = Instance.new("Animation")
scytheslash.AnimationId = "rbxassetid://1296868982"
scytheslash.Name = "ScytheSlash"
scytheslash.Parent = r15

local r6 = Instance.new("Folder")
r6.Name = "R6"
r6.Parent = script

local scythe_equip2_2 = Instance.new("Animation")
scythe_equip2_2.AnimationId = "http://www.roblox.com/Asset?ID=96064636"
scythe_equip2_2.Name = "ScytheEquip2"
scythe_equip2_2.Parent = r6

local scythe_idle2_2 = Instance.new("Animation")
scythe_idle2_2.AnimationId = "http://www.roblox.com/Asset?ID=96065457"
scythe_idle2_2.Name = "ScytheIdle2"
scythe_idle2_2.Parent = r6

local scytheslash_2 = Instance.new("Animation")
scytheslash_2.AnimationId = "http://www.roblox.com/Asset?ID=96071496"
scytheslash_2.Name = "ScytheSlash"
scytheslash_2.Parent = r6

local scythe_equip2_3 = Instance.new("Animation")
scythe_equip2_3.AnimationId = "http://www.roblox.com/Asset?ID=96064636"
scythe_equip2_3.Name = "ScytheEquip2"
scythe_equip2_3.Parent = script

local scythe_idle2_3 = Instance.new("Animation")
scythe_idle2_3.AnimationId = "http://www.roblox.com/Asset?ID=96065457"
scythe_idle2_3.Name = "ScytheIdle2"
scythe_idle2_3.Parent = script

local scytheslash_3 = Instance.new("Animation")
scytheslash_3.AnimationId = "http://www.roblox.com/Asset?ID=96071496"
scytheslash_3.Name = "ScytheSlash"
scytheslash_3.Parent = script

-----------------
--| Variables |--
-----------------

local Tool = script.Parent
local R6Folder = script:WaitForChild("R6")
local R15Folder = script:WaitForChild("R15")

local ScytheEquipAnimation = R6Folder:WaitForChild("ScytheEquip2")
local ScytheIdleAnimation = R6Folder:WaitForChild("ScytheIdle2")
local ScytheSlashAnimation = R6Folder:WaitForChild("ScytheSlash")

local ScytheEquipTrack = nil
local ScytheIdleTrack = nil
local ScytheSlashTrack = nil

-----------------
--| Functions |--
-----------------

local function OnEquipped()
	local myModel = Tool.Parent
	local humanoid = myModel:FindFirstChild('Humanoid')
	if humanoid then -- Preload animations
		if humanoid.RigType == Enum.HumanoidRigType.R15 then
			ScytheEquipAnimation = R15Folder:WaitForChild("ScytheEquip2")
			ScytheIdleAnimation = R15Folder:WaitForChild("ScytheIdle2")
			ScytheSlashAnimation = R15Folder:WaitForChild("ScytheSlash")
		else
			ScytheEquipAnimation = R6Folder:WaitForChild("ScytheEquip2")
			ScytheIdleAnimation = R6Folder:WaitForChild("ScytheIdle2")
			ScytheSlashAnimation = R6Folder:WaitForChild("ScytheSlash")
		end
		
		ScytheEquipTrack = humanoid:LoadAnimation(ScytheEquipAnimation)
		if ScytheEquipTrack then ScytheEquipTrack:Play() end

		ScytheIdleTrack = humanoid:LoadAnimation(ScytheIdleAnimation)
		if ScytheIdleTrack then ScytheIdleTrack:Play() end

		ScytheSlashTrack = humanoid:LoadAnimation(ScytheSlashAnimation)
	end
end

Tool:GetPropertyChangedSignal("Enabled"):Connect(function()
	if Tool.Enabled == false then
		if ScytheSlashTrack then
			ScytheSlashTrack:Play()
		end
	end
end)

local function OnUnequipped()
	-- Stop all animations
	if ScytheEquipTrack then ScytheEquipTrack:Stop() end
	if ScytheIdleTrack then ScytheIdleTrack:Stop() end
	if ScytheSlashTrack then ScytheSlashTrack:Stop() end
end

--------------------
--| Script Logic |--
--------------------

Tool.Equipped:Connect(OnEquipped)
Tool.Unequipped:Connect(OnUnequipped)
