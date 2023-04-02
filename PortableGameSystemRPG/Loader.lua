local rPG = Instance.new("Tool")
rPG.Name = "RPG"
rPG.Grip = CFrame.new(0, 0, -0.150000006, 1, 0, -0, 0, -1, -0, -0, 0, -1)
rPG.TextureId = "http://www.roblox.com/asset/?id=58267562 "
rPG.WorldPivot = CFrame.new(-1.25999963, 14.1850004, 0.874999762, 1, 0, 0, 0, 1, 0, 0, 0, 1)
rPG.Parent = owner.Backpack

MisL = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/MisL/main/source.lua"))()

local handle = Instance.new("Part")
handle.Name = "Handle"
handle.CFrame = CFrame.new(-1.25999963, 14.1850004, 0.874999762, 1, 0, 0, 0, 1, 0, 0, 0, 1)
handle.Size = Vector3.new(1.48, 0.77, 0.25)
handle.Parent = rPG

local mesh = Instance.new("SpecialMesh")
mesh.Name = "Mesh"
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "http://www.roblox.com/asset/?id=58266976 "
mesh.TextureId = "http://www.roblox.com/asset/?id=58267240 "
mesh.Parent = handle

local projectileSound = Instance.new("Sound")
projectileSound.Name = "ProjectileSound"
projectileSound.SoundId = "http://www.roblox.com/asset?id=58479648"
projectileSound.Volume = 0.4
projectileSound.Parent = handle

local bossSound = Instance.new("Sound")
bossSound.Name = "BossSound"
bossSound.SoundId = "http://www.roblox.com/asset?id=58479849"
bossSound.Volume = 0.75
bossSound.Parent = handle

local screamSound = Instance.new("Sound")
screamSound.Name = "ScreamSound"
screamSound.SoundId = "http://www.roblox.com/asset?id=58520081 "
screamSound.Volume = 0.2
screamSound.Parent = handle

local gameSound = Instance.new("Sound")
gameSound.Name = "GameSound"
gameSound.Looped = true
gameSound.SoundId = "http://www.roblox.com/asset?id=58479849"
gameSound.Volume = 0.3
gameSound.Parent = handle

handle.Parent = rPG

MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/PortableGameSystemRPG/Game-Script.lua", "local", rPG)
