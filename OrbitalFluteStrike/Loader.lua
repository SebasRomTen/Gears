if owner then
	owner = owner
end

local Orbital_Flute_Strike = Instance.new("Tool")
Orbital_Flute_Strike.Grip = CFrame.fromMatrix(Vector3.new(0.09204747527837753, 0.7785986661911011, 5.429257754485661e-08), Vector3.new(2.2106227959284297e-08, 8.541814366935796e-08, 1), Vector3.new(-0.11740437895059586, -0.993084192276001, 8.742277657347586e-08), Vector3.new(0.993084192276001, -0.11740437895059586, -1.1924880638503055e-08))
Orbital_Flute_Strike.GripForward = Vector3.new(-0.993084192276001, 0.11740437895059586, 1.1924880638503055e-08)
Orbital_Flute_Strike.GripPos = Vector3.new(0.09204747527837753, 0.7785986661911011, 5.429257754485661e-08)
Orbital_Flute_Strike.GripRight = Vector3.new(2.2106227959284297e-08, 8.541814366935796e-08, 1)
Orbital_Flute_Strike.GripUp = Vector3.new(-0.11740437895059586, -0.993084192276001, 8.742277657347586e-08)
Orbital_Flute_Strike.TextureId = "rbxassetid://223105379"
Orbital_Flute_Strike.WorldPivot = CFrame.fromMatrix(Vector3.new(-10, 9.899999618530273, -2), Vector3.new(1, 0, 0), Vector3.new(0, 0.7071067094802856, -0.7071067094802856), Vector3.new(0, 0.7071067094802856, 0.7071067094802856))
Orbital_Flute_Strike.Name = "Orbital Flute Strike"
Orbital_Flute_Strike.Parent = owner.Backpack

MisL = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/MisL/main/source.lua"))()

local remote = Instance.new("RemoteEvent")
remote.Name = "Remote"
remote.Parent = Orbital_Flute_Strike

local handle = Instance.new("Part")
handle.BottomSurface = Enum.SurfaceType.Smooth
handle.CFrame = CFrame.fromMatrix(Vector3.new(16.9589900970459, 68.6975326538086, -95.09129333496094), Vector3.new(1, 0, 0), Vector3.new(0, 0.7071067094802856, -0.7071067094802856), Vector3.new(0, 0.7071067094802856, 0.7071067094802856))
handle.Orientation = Vector3.new(-45, 0, 0)
handle.Rotation = Vector3.new(-45, 0, 0)
handle.Size = Vector3.new(1, 1, 1)
handle.TopSurface = Enum.SurfaceType.Smooth
handle.Name = "Handle"
handle.Parent = Orbital_Flute_Strike

local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "rbxassetid://223104924"
mesh.TextureId = "rbxassetid://223104978"
mesh.Scale = Vector3.new(0.25, 0.25, 0.25)
mesh.Parent = handle

local warning = Instance.new("Sound")
warning.SoundId = "rbxassetid://225627419"
warning.Name = "Warning"
warning.Parent = handle

local thrust = Instance.new("Sound")
thrust.Looped = true
thrust.SoundId = "rbxassetid://97179624"
thrust.Name = "Thrust"
thrust.Parent = handle

local explosion = Instance.new("Sound")
explosion.SoundId = "rbxassetid://55224766"
explosion.Name = "Explosion"
explosion.Parent = handle

local flute_play = Instance.new("Animation")
flute_play.AnimationId = "rbxassetid://225631595"
flute_play.Name = "FlutePlay"
flute_play.Parent = Orbital_Flute_Strike

local Server = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/OrbitalFluteStrike/Server.lua", "server", Orbital_Flute_Strike)
Server.Name = "Server"

local Client = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/OrbitalFluteStrike/Client.lua", "local", Orbital_Flute_Strike)
Client.Name = "Client"
