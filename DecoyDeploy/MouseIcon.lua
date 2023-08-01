--Rescripted by Luckymaxer

Mouse_Icon = "rbxasset://textures/GunCursor.png"
Reloading_Icon = "rbxasset://textures/GunWaitCursor.png"

Tool = script.Parent
Equipped = false
Mouse = nil

function UpdateIcon()
	if Mouse and Equipped then
		Mouse.Icon = Tool.Enabled and Mouse_Icon or Reloading_Icon
	end
end

function OnEquipped(ToolMouse)
	Mouse = ToolMouse
	UpdateIcon()
end

function UN()
	Equipped = false
end

function OnChanged(Property)
	if Property == "Enabled" then
		UpdateIcon()
		Equipped = true
	end
end

Tool.Equipped:connect(OnEquipped)
Tool.Unequipped:Connect(UN)
Tool.Changed:connect(OnChanged)