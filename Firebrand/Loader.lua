local MisL : "Library" = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/MisL/main/source.lua"))()

local owner : Player = owner

local firebrand = Instance.new("Tool")
firebrand.Grip = CFrame.fromMatrix(Vector3.new(0, 0, -2), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1), Vector3.new(1, 0, 0))
firebrand.GripForward = Vector3.new(-1, -0, -0)
firebrand.GripPos = Vector3.new(0, 0, -2)
firebrand.GripRight = Vector3.new(0, 1, 0)
firebrand.GripUp = Vector3.new(0, 0, 1)
firebrand.TextureId = "http://www.roblox.com/asset/?id=81147983"
firebrand.WorldPivot = CFrame.fromMatrix(Vector3.new(0, 2.299999952316284, 0), Vector3.new(0.0009677186608314514, 0.7610632181167603, -0.6486769914627075), Vector3.new(-0.9239258170127869, 0.2488453984260559, 0.2905806005001068), Vector3.new(0.3825705051422119, 0.5990482568740845, 0.7034066915512085))
firebrand.Name = "Firebrand"
firebrand.Parent = owner.Backpack

local handle = Instance.new("Part")
handle.BottomSurface = Enum.SurfaceType.Smooth
handle.BrickColor = BrickColor.new(0.38823533058166504, 0.37254902720451355, 0.38431376218795776)
handle.CFrame = CFrame.fromMatrix(Vector3.new(-85.00665283203125, 20.25946807861328, -43.12522506713867), Vector3.new(0.0009677186608314514, 0.7610632181167603, -0.6486769914627075), Vector3.new(-0.9239258170127869, 0.2488453984260559, 0.2905806005001068), Vector3.new(0.3825705051422119, 0.5990482568740845, 0.7034066915512085))
handle.Color = Color3.new(0.388235, 0.372549, 0.384314)
handle.Locked = true
handle.Orientation = Vector3.new(-36.79999923706055, 28.540000915527344, 71.88999938964844)
handle.Reflectance = 0.699999988079071
handle.Rotation = Vector3.new(-40.41999816894531, 22.489999771118164, 89.94000244140625)
handle.Size = Vector3.new(1, 0.800000011920929, 6)
handle.TopSurface = Enum.SurfaceType.Smooth
handle.Size = Vector3.new(1, 0.800000011920929, 6)
handle.Name = "Handle"
handle.Parent = firebrand

local lunge = Instance.new("Sound")
lunge.SoundId = "http://www.roblox.com/asset/?id=12222208"
lunge.Volume = 0.6000000238418579
lunge.Name = "Lunge"
lunge.Parent = handle

local slash = Instance.new("Sound")
slash.SoundId = "http://www.roblox.com/asset/?id=12222216"
slash.Volume = 0.699999988079071
slash.Name = "Slash"
slash.Parent = handle

local unsheath = Instance.new("Sound")
unsheath.SoundId = "http://www.roblox.com/asset/?id=12222225"
unsheath.Volume = 1
unsheath.Name = "Unsheath"
unsheath.Parent = handle

local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "http://www.roblox.com/asset/?id=12221720"
mesh.TextureId = "http://www.roblox.com/asset/?id=12224218"
mesh.Scale = Vector3.new(1.5, 1.5, 1.5)
mesh.VertexColor = Vector3.new(0.5, 0, 0)
mesh.Parent = handle

local SwordScript = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/Firebrand/SwordScript.lua", "server", firebrand)
SwordScript.Name = "SwordScript"

local MouseIcon = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/Firebrand/MouseIcon.lua", "local", firebrand)
MouseIcon.Name = "MouseIcon"