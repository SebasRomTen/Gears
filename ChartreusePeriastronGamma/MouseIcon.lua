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
	Equipped = true
	UpdateIcon()
end

function OnUnequipped()
	Equipped = false
end

function OnChanged(Property)
	if Property == "Enabled" then
		UpdateIcon()
	end
end

Tool.Unequipped:Connect(OnUnequipped)
Tool.Equipped:Connect(OnEquipped)
Tool.Changed:Connect(OnChanged)