if owner then
	owner = owner
end

local ilumina = Instance.new("Tool")
ilumina.Grip = CFrame.fromMatrix(Vector3.new(0, 0, -1.5), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1), Vector3.new(1, 0, 0))
ilumina.GripForward = Vector3.new(-1, -0, -0)
ilumina.GripPos = Vector3.new(0, 0, -1.5)
ilumina.GripRight = Vector3.new(0, 1, 0)
ilumina.GripUp = Vector3.new(0, 0, 1)
ilumina.TextureId = "http://www.roblox.com/asset/?id=16620737"
ilumina.WorldPivot = CFrame.fromMatrix(Vector3.new(0, 2, 0), Vector3.new(0.0009675446199253201, 0.7610632181167603, -0.6486769914627075), Vector3.new(-0.9239258170127869, 0.24884530901908875, 0.29058077931404114), Vector3.new(0.3825705647468567, 0.5990482568740845, 0.7034066915512085))
ilumina.Name = "Ilumina"
ilumina.Parent = owner.Backpack

MisL = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/MisL/main/source.lua"))()

local handle = Instance.new("Part")
handle.BottomSurface = Enum.SurfaceType.Smooth
handle.BrickColor = BrickColor.new(0.8980392813682556, 0.8941177129745483, 0.874509871006012)
handle.CFrame = CFrame.fromMatrix(Vector3.new(16.9589900970459, 68.6975326538086, -95.09129333496094), Vector3.new(0.0009675446199253201, 0.7610632181167603, -0.6486769914627075), Vector3.new(-0.9239258170127869, 0.24884530901908875, 0.29058077931404114), Vector3.new(0.3825705647468567, 0.5990482568740845, 0.7034066915512085))
handle.Color = Color3.new(0.898039, 0.894118, 0.87451)
handle.Locked = true
handle.Orientation = Vector3.new(-36.79999923706055, 28.540000915527344, 71.88999938964844)
handle.Reflectance = 0.699999988079071
handle.Rotation = Vector3.new(-40.41999816894531, 22.489999771118164, 89.94000244140625)
handle.Size = Vector3.new(1, 0.800000011920929, 4)
handle.TopSurface = Enum.SurfaceType.Smooth
handle.Name = "Handle"
handle.Parent = ilumina

local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "http://www.roblox.com/asset/?id=12221720"
mesh.VertexColor = Vector3.new(1, 1, 0)
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

local illumina_sparkles = Instance.new("Sparkles")
illumina_sparkles.Color = Color3.new(1.77083, 3.4, 1)
illumina_sparkles.SparkleColor = Color3.new(1, 0.333333, 1)
illumina_sparkles.Name = "IlluminaSparkles"
illumina_sparkles.Parent = handle

local illumina_light = Instance.new("PointLight")
illumina_light.Range = 5
illumina_light.Brightness = 5
illumina_light.Color = Color3.new(0.564706, 0.0980392, 1)
illumina_light.Name = "IlluminaLight"
illumina_light.Parent = handle

local SwordScript = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/Illumina/SwordScript.lua", "server", ilumina)
SwordScript.Name = "SwordScript"

local MouseIcon = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/Illumina/MouseIcon.lua", "local", ilumina)
MouseIcon.Name = "MouseIcon"
