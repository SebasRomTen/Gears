--Rescripted by Luckymaxer

Model = script.Parent

Debris = game:GetService("Debris")

Creator = script:FindFirstChild("Creator")
Tool = script:FindFirstChild("Tool")

function DestroyModel()
	if Model and Model.Parent then
		Debris:AddItem(Model, 2)
		Model:Destroy()
	end
end

if not Creator or not Creator.Value or not Creator.Value:IsA("Player") or not Creator.Value.Parent or not Tool or not Tool.Value or not Tool.Value.Parent then
	DestroyModel()
	return
end

Creator = Creator.Value
Tool = Tool.Value

Character = Creator.Character
if not Character then
	DestroyModel()
	return
end

Creator.Changed:connect(function(Property)
	if Property == "Parent" and not Creator.Parent then
		DestroyModel()
	end
end)

Character.Changed:connect(function(Property)
	if Property == "Parent" and not Character.Parent then
		DestroyModel()
	end
end)

Tool.Changed:connect(function(Property)
	if Property == "Parent" then
		DestroyModel()
	end
end)
