	--[[local Camera = workspace.CurrentCamera
	for i=1,5,1 do
		Camera.CFrame = CFrame.new(i,i,i)
	end]]
local Dir = Instance.new("Vector3Value", script)
Dir.Name = "Direction"
    wait(.9)
    script.Parent.Velocity = script:WaitForChild("Direction").Value
