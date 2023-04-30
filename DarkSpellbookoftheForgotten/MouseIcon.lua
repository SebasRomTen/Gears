--Made by Luckymaxer

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
	Equipped = false
	UpdateIcon()
end

function OEQ()
	Equipped = false
end

function OnChanged(Property)
	if Property == "Enabled" then
		UpdateIcon()
	end
end

Tool.Unequipped:Connect(OEQ)
Tool.Equipped:Connect(OnEquipped)
Tool.Changed:Connect(OnChanged)
