--Rescripted by Luckymaxer

Mouse_Icon = "rbxasset://textures/GunCursor.png"
Reloading_Icon = "rbxasset://textures/GunWaitCursor.png"

Tool = script.Parent
Eq = false
Mouse = nil

function UpdateIcon()
	if Mouse and Eq then
		Mouse.Icon = Tool.Enabled and Mouse_Icon or Reloading_Icon
	end
end

function OnEquipped(ToolMouse)
	Mouse = ToolMouse
	Eq = true
	UpdateIcon()
end

function OnUnequipped()
	Eq = false
end

function OnChanged(Property)
	if Property == "Enabled" then
		UpdateIcon()
	end
end

Tool.Unequipped:Connect(OnUnequipped)
Tool.Equipped:connect(OnEquipped)
Tool.Changed:connect(OnChanged)
