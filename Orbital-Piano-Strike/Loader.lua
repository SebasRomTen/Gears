if owner then
	owner = owner
end

local orbital_piano_strike = Instance.new("Tool")
orbital_piano_strike.Grip = CFrame.fromMatrix(Vector3.new(-1.25, 1.75, -3.25), Vector3.new(-1, 0, 8.742277657347586e-08), Vector3.new(0, 1, 0), Vector3.new(-8.742277657347586e-08, 0, -1))
orbital_piano_strike.GripForward = Vector3.new(8.742277657347586e-08, -0, 1)
orbital_piano_strike.GripPos = Vector3.new(-1.25, 1.75, -3.25)
orbital_piano_strike.GripRight = Vector3.new(-1, 0, 8.742277657347586e-08)
orbital_piano_strike.TextureId = "http://www.roblox.com/asset/?id=113221292"
orbital_piano_strike.WorldPivot = CFrame.fromMatrix(Vector3.new(9.637653350830078, 5.664242744445801, 4.042239665985107), Vector3.new(0.3656652867794037, -1.4528523939461024e-09, -0.9307462573051453), Vector3.new(0.015467955730855465, 0.9998618960380554, 0.0060769435949623585), Vector3.new(0.9306176900863647, -0.016618873924016953, 0.36561480164527893))
orbital_piano_strike.Name = "Orbital Piano Strike"
orbital_piano_strike.Parent = owner.Backpack

MisL = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/MisL/main/source.lua"))()

local handle = Instance.new("Part")
handle.BottomSurface = Enum.SurfaceType.Smooth
handle.CFrame = CFrame.fromMatrix(Vector3.new(-9.6237211227417, 33.72048568725586, -23.800811767578125), Vector3.new(0.3656652867794037, -1.4528523939461024e-09, -0.9307462573051453), Vector3.new(0.015467955730855465, 0.9998618960380554, 0.0060769435949623585), Vector3.new(0.9306176900863647, -0.016618873924016953, 0.36561480164527893))
handle.Locked = true
handle.Orientation = Vector3.new(0.949999988079071, 68.55000305175781, 0)
handle.Rotation = Vector3.new(2.5999999046325684, 68.52999877929688, -2.4200000762939453)
handle.Size = Vector3.new(1, 1.2000000476837158, 1)
handle.TopSurface = Enum.SurfaceType.Smooth
handle.Name = "Handle"
handle.Parent = orbital_piano_strike

local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "http://www.roblox.com/asset/?id=113221356"
mesh.TextureId = "http://www.roblox.com/asset/?id=113221332"
mesh.Scale = Vector3.new(2, 2, 2)
mesh.Parent = handle

local PianoScript = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/Orbital-Piano-Strike/PianoScript.lua", "server", orbital_piano_strike)
PianoScript.Name = "PianoScript"

local MouseIcon = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/Orbital-Piano-Strike/MouseIcon.lua", "server", orbital_piano_strike)
MouseIcon.Name = "MouseIcon"
