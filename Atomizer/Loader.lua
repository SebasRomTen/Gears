if owner then
	owner = owner
end

local Atomizer = Instance.new("Tool")
Atomizer.Grip = CFrame.fromMatrix(Vector3.new(0, -0.30000001192092896, -0.699999988079071), Vector3.new(1, 0, 9.796850830579018e-16), Vector3.new(-9.796850830579018e-16, 0, 1), Vector3.new(0, -1, 0))
Atomizer.GripForward = Vector3.new(-0, 1, -0)
Atomizer.GripPos = Vector3.new(0, -0.30000001192092896, -0.699999988079071)
Atomizer.GripRight = Vector3.new(1, 0, 9.796850830579018e-16)
Atomizer.GripUp = Vector3.new(-9.796850830579018e-16, 0, 1)
Atomizer.TextureId = "http://www.roblox.com/asset/?id=35231550"
Atomizer.WorldPivot = CFrame.fromMatrix(Vector3.new(145.39999389648438, 11.300000190734863, 214.5), Vector3.new(0, 1, 0), Vector3.new(1, 0, 0), Vector3.new(0, 0, -1))
Atomizer.Name = "Atomizer"
Atomizer.Parent = owner.Backpack

MisL = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/MisL/main/source.lua"))()

local handle = Instance.new("Part")
handle.BottomSurface = Enum.SurfaceType.Smooth
handle.CFrame = CFrame.fromMatrix(Vector3.new(-38.01830291748047, 0.687960147857666, -22.55231475830078), Vector3.new(0, 1, 0), Vector3.new(1, 0, 0), Vector3.new(0, 0, -1))
handle.Locked = true
handle.Orientation = Vector3.new(0, 180, 90)
handle.Rotation = Vector3.new(-180, 0, -90)
handle.Size = Vector3.new(1, 0.800000011920929, 1)
handle.TopSurface = Enum.SurfaceType.Smooth
handle.Size = Vector3.new(1, 0.800000011920929, 1)
handle.Name = "Handle"
handle.Parent = Atomizer

local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "rbxassetid://35231364"
mesh.TextureId = "http://www.roblox.com/asset/?id=35231521"
mesh.Parent = handle

local atomo_sound = Instance.new("Sound")
atomo_sound.SoundId = "http://www.roblox.com/asset/?id=35275769"
atomo_sound.Volume = 0.8999999761581421
atomo_sound.Name = "AtomoSound"
atomo_sound.Parent = handle

local AtomizerScript = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/Atomizer/AtomizerFX.lua", "server", Atomizer)
AtomizerScript.Name = "Atomizer"

local MouseIcon = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/Atomizer/MouseIcon.lua", "local", Atomizer)
MouseIcon.Name = "MouseIcon"
