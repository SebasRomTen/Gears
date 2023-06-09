script.Name = "CellScript"

-----------------
local Target = script:FindFirstChild("Target")

if not Target then script:Destroy() end

Target = Target.Value

local Humanoid = Target:FindFirstChildOfClass("Humanoid")
Humanoid:UnequipTools()

local Stop = false
coroutine.wrap(function()
	repeat
		Humanoid.JumpPower = 0
		Humanoid.WalkSpeed = 0
		game:GetService("RunService").Heartbeat:Wait()
	until Stop
end)()

local function waitForChild(parent, instance)
	while parent:FindFirstChild(instance) == nil do 
		wait()
	end 
	return parent[instance]
end  

local vCharacter = script:FindFirstChild("Target")
if not vCharacter then script:Destroy() end

vCharacter = vCharacter.Value
 
local vTorso = waitForChild(vCharacter, "HumanoidRootPart")
local vHumanoid = vCharacter:FindFirstChildOfClass("Humanoid")

if not vHumanoid then script:Destroy() end
vTorso.Anchored = true 


local Prison_Part = Instance.new("Part")
Prison_Part.Shape = "Block"
Prison_Part.Size = Vector3.new(5, 5, 5)
Prison_Part.FormFactor = 3
Prison_Part.CFrame = vTorso.CFrame 
Prison_Part.Parent = vCharacter 

local Prison_Mesh = Instance.new("SpecialMesh")
Prison_Mesh.MeshId = "http://www.roblox.com/asset/?id=82332649"
Prison_Mesh.TextureId = "http://www.roblox.com/asset/?id=82332693"
Prison_Mesh.Parent = Prison_Part 
Prison_Mesh.Scale = Vector3.new(1, 1, 1)

local Prison_Weld = Instance.new("Weld") 
Prison_Weld.Part0 = vTorso 
Prison_Weld.Part1 = Prison_Part 
Prison_Weld.Name = "PrisonWeld"
Prison_Weld.Parent = Prison_Part

local Services = {
	Players = (game:FindService("Players") or game:GetService("Players")),
	Debris = (game:FindService("Debris") or game:GetService("Debris")),
}

wait(7.5)
Stop = false
