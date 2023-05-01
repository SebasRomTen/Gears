--Made by Luckymaxer

Mouse_Icon = "rbxasset://textures/GunCursor.png"
Reloading_Icon = "rbxasset://textures/GunWaitCursor.png"

Tool = script.Parent
EQy = false
Mouse = nil

function UpdateIcon()
	if Mouse and EQy then
		Mouse.Icon = Tool.Enabled and Mouse_Icon or Reloading_Icon
	end
end

function OnEquipped(ToolMouse)
	Mouse = ToolMouse
	EQy = true
	UpdateIcon()
end

function EQ()
	EQy = false
end

function OnChanged(Property)
	if Property == "Enabled" then
		UpdateIcon()
	end
end

Tool.Unequipped:Connect(EQ)
Tool.Equipped:connect(OnEquipped)
Tool.Changed:connect(OnChanged)
