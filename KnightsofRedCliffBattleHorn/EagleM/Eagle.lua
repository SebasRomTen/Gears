local MisL : "Library" = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/MisL/main/source.lua"))()

local eagle = Instance.new("Model")
eagle.Name = "Eagle"

local torso = Instance.new("Part")
torso.BottomSurface = Enum.SurfaceType.Smooth
torso.CFrame = CFrame.fromMatrix(Vector3.new(-291.2093505859375, 0, 64.309326171875), Vector3.new(1, 0, 0), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1))
torso.Size = Vector3.new(1.1999993324279785, 1.2000000476837158, 2)
torso.TopSurface = Enum.SurfaceType.Smooth
torso.Name = "Torso"
torso.Parent = eagle

local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "http://www.roblox.com/asset/?id=114027041"
mesh.TextureId = "http://www.roblox.com/asset/?id=114027249"
mesh.Parent = torso

local bg = Instance.new("BodyGyro")
bg.MaxTorque = Vector3.new(400000, 400000, 400000)
bg.Name = "bg"
bg.Parent = torso

local bv = Instance.new("BodyVelocity")
bv.MaxForce = Vector3.new(60, 4000, 60)
bv.P = 500
bv.Velocity = Vector3.new(0, 0, 0)
bv.Name = "bv"
bv.Parent = torso

local EagleScript = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/KnightsofRedCliffBattleHorn/EagleM/EagleScript.lua", "server", eagle)
EagleScript.Name = "EagleScript"

local player_owner = Instance.new("ObjectValue")
player_owner.Name = "PlayerOwner"
player_owner.Parent = eagle

return eagle