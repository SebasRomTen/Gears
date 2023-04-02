if owner then
	owner = owner
end

local Darkheart = Instance.new("Tool")
Darkheart.Grip = CFrame.fromMatrix(Vector3.new(0, 0, -1.5), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1), Vector3.new(1, 0, 0))
Darkheart.GripForward = Vector3.new(-1, -0, -0)
Darkheart.GripPos = Vector3.new(0, 0, -1.5)
Darkheart.GripRight = Vector3.new(0, 1, 0)
Darkheart.GripUp = Vector3.new(0, 0, 1)
Darkheart.TextureId = "http://www.roblox.com/asset/?id=16868189"
Darkheart.WorldPivot = CFrame.fromMatrix(Vector3.new(-2.5536470715792348e-09, 2, 3.5863820357917575e-08), Vector3.new(0.0009708432480692863, 0.7610650062561035, -0.6486745476722717), Vector3.new(-0.9239227771759033, 0.24885159730911255, 0.29058417677879333), Vector3.new(0.3825772702693939, 0.5990439057350159, 0.7034065127372742))
Darkheart.Name = "Darkheart"
Darkheart.Parent = owner.Backpack

MisL = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/MisL/main/source.lua"))()

local handle = Instance.new("Part")
handle.AssemblyAngularVelocity = Vector3.new(1, 1, 1)
handle.AssemblyLinearVelocity = Vector3.new(3.314860885783588e-11, 0.008084343746304512, 9.068085171648477e-11)
handle.BottomSurface = Enum.SurfaceType.Smooth
handle.BrickColor = BrickColor.new(0.06666667014360428, 0.06666667014360428, 0.06666667014360428)
handle.CFrame = CFrame.fromMatrix(Vector3.new(-20.135421752929688, 6.944673538208008, -14.678918838500977), Vector3.new(0.0009708432480692863, 0.7610650062561035, -0.6486745476722717), Vector3.new(-0.9239227771759033, 0.24885159730911255, 0.29058417677879333), Vector3.new(0.3825772702693939, 0.5990439057350159, 0.7034065127372742))
handle.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
handle.Locked = true
handle.Orientation = Vector3.new(-36.79999923706055, 28.540000915527344, 71.88999938964844)
handle.Reflectance = 0.699999988079071
handle.Rotation = Vector3.new(-40.41999816894531, 22.489999771118164, 89.94000244140625)
handle.Size = Vector3.new(1, 0.800000011920929, 4)
handle.TopSurface = Enum.SurfaceType.Smooth
handle.Size = Vector3.new(1, 0.800000011920929, 4)
handle.Name = "Handle"
handle.Parent = Darkheart

local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "http://www.roblox.com/asset/?id=12221720"
mesh.TextureId = "http://www.roblox.com/asset/?id=12224218"
mesh.Scale = Vector3.new(0.800000011920929, 0.800000011920929, 1)
mesh.VertexColor = Vector3.new(0, 0, 0)
mesh.Parent = handle

local slash = Instance.new("Sound")
slash.SoundId = "http://www.roblox.com/asset/?id=12222216"
slash.Volume = 0.699999988079071
slash.Name = "Slash"
slash.Parent = handle

local lunge = Instance.new("Sound")
lunge.SoundId = "http://www.roblox.com/asset/?id=12222208"
lunge.Volume = 0.6000000238418579
lunge.Name = "Lunge"
lunge.Parent = handle

local unsheath = Instance.new("Sound")
unsheath.SoundId = "http://www.roblox.com/asset/?id=12222225"
unsheath.Volume = 1
unsheath.Name = "Unsheath"
unsheath.Parent = handle

local SwordScript = MisL.newScript('https://raw.githubusercontent.com/SebasRomTen/Gears/main/Darkheart/SwordScript.lua', 'server', Darkheart)
SwordScript.Name = "SwordScript"

local MouseIcon = MisL.newScript('https://raw.githubusercontent.com/SebasRomTen/Gears/main/Darkheart/MouseIcon.lua', 'local', Darkheart)
MouseIcon.Name = "MouseIcon"
