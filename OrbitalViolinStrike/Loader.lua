if owner then
	owner = owner
end

local orbital_violin_strike = Instance.new("Tool")
orbital_violin_strike.Grip = CFrame.fromMatrix(Vector3.new(-1.25, -1, 0.10000000149011612), Vector3.new(-0.8235782980918884, -0.45376214385032654, 0.3403216302394867), Vector3.new(-0.031555742025375366, -0.562415599822998, -0.8262523412704468), Vector3.new(0.5663241744041443, -0.6912224888801575, 0.44887444376945496))
orbital_violin_strike.GripForward = Vector3.new(-0.5663241744041443, 0.6912224888801575, -0.44887444376945496)
orbital_violin_strike.GripPos = Vector3.new(-1.25, -1, 0.10000000149011612)
orbital_violin_strike.GripRight = Vector3.new(-0.8235782980918884, -0.45376214385032654, 0.3403216302394867)
orbital_violin_strike.GripUp = Vector3.new(-0.031555742025375366, -0.562415599822998, -0.8262523412704468)
orbital_violin_strike.TextureId = "http://www.roblox.com/asset?id=181327214"
orbital_violin_strike.WorldPivot = CFrame.fromMatrix(Vector3.new(9.695133209228516, 5.833709716796875, 6.907989501953125), Vector3.new(0.8660253286361694, -0.3535533547401428, -0.35355329513549805), Vector3.new(0.4999999403953552, 0.6123725771903992, 0.6123720407485962), Vector3.new(1.8311047256247548e-07, -0.7071065902709961, 0.7071068286895752))
orbital_violin_strike.Name = "Orbital Violin Strike"
orbital_violin_strike.Parent = owner.Backpack

MisL = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/MisL/main/source.lua"))()

local handle = Instance.new("Part")
handle.BottomSurface = Enum.SurfaceType.Smooth
handle.CFrame = CFrame.fromMatrix(Vector3.new(-2.879981517791748, 47.16328048706055, -27.83763885498047), Vector3.new(0.8660253286361694, -0.3535533547401428, -0.35355329513549805), Vector3.new(0.4999999403953552, 0.6123725771903992, 0.6123720407485962), Vector3.new(1.8311047256247548e-07, -0.7071065902709961, 0.7071068286895752))
handle.Locked = true
handle.Orientation = Vector3.new(45, 0, -30)
handle.Rotation = Vector3.new(45, 0, -30)
handle.Size = Vector3.new(1.5, 3.5625, 0.75)
handle.TopSurface = Enum.SurfaceType.Smooth
handle.Name = "Handle"
handle.Parent = orbital_violin_strike

local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "http://www.roblox.com/asset?id=183439731"
mesh.TextureId = "http://www.roblox.com/asset?id=181327196"
mesh.Scale = Vector3.new(0.8500000238418579, 0.8500000238418579, 0.8500000238418579)
mesh.Parent = handle

local violin_song = Instance.new("Sound")
violin_song.SoundId = "http://www.roblox.com/asset?id=183434101"
violin_song.Volume = 1
violin_song.Name = "ViolinSong"
violin_song.Parent = handle

local bow_equip = Instance.new("Animation")
bow_equip.AnimationId = "http://www.roblox.com/asset?id=183428213"
bow_equip.Name = "BowEquip"
bow_equip.Parent = orbital_violin_strike

local start_playing = Instance.new("Animation")
start_playing.AnimationId = "http://www.roblox.com/asset?id=183436589"
start_playing.Name = "StartPlaying"
start_playing.Parent = orbital_violin_strike

local playing = Instance.new("Animation")
playing.AnimationId = "http://www.roblox.com/asset?id=183438463"
playing.Name = "Playing"
playing.Parent = orbital_violin_strike

local Script = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/OrbitalViolinStrike/Script.lua", "server", orbital_violin_strike)
Script.Name = "Script"

local LocalScript = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/OrbitalViolinStrike/LocalScript.lua", "local", orbital_violin_strike)
LocalScript.Name = "LocalScript"

local MouseIcon = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/OrbitalViolinStrike/MouseIcon.lua", "local", orbital_violin_strike)
MouseIcon.Name = "MouseIcon"
