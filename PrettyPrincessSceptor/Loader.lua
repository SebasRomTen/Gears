local owner : Player = owner

local MisL : "Library" = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/MisL/main/source.lua"))()

local prettyprettyprincess_sceptor = Instance.new("Tool")
prettyprettyprincess_sceptor.Grip = CFrame.fromMatrix(Vector3.new(0, -0.8999999761581421, 0), Vector3.new(1, 0, 0), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1))
prettyprettyprincess_sceptor.GripPos = Vector3.new(0, -0.8999999761581421, 0)
prettyprettyprincess_sceptor.ToolTip = "Pretty Pretty Princess Sceptor"
prettyprettyprincess_sceptor.TextureId = "http://www.roblox.com/asset/?id=113949712"
prettyprettyprincess_sceptor.WorldPivot = CFrame.fromMatrix(Vector3.new(-0.4830459952354431, 16.564422607421875, -0.04647599905729294), Vector3.new(-0.10330211371183395, -0.0000014860555666018627, 0.9946488738059998), Vector3.new(0.6964969038963318, 0.71390300989151, 0.07233772426843643), Vector3.new(-0.7100829482078552, 0.700244128704071, -0.0737466812133789))
prettyprettyprincess_sceptor.Name = "Pretty Pretty Princess Sceptor"
prettyprettyprincess_sceptor.Parent = owner.Backpack

local handle = Instance.new("Part")
handle.BottomSurface = Enum.SurfaceType.Smooth
handle.BrickColor = BrickColor.new(1, 0, 0.7490196228027344)
handle.CFrame = CFrame.fromMatrix(Vector3.new(23.380027770996094, 7.780984878540039, -25.177316665649414), Vector3.new(-0.10330211371183395, -0.0000014860555666018627, 0.9946488738059998), Vector3.new(0.6964969038963318, 0.71390300989151, 0.07233772426843643), Vector3.new(-0.7100829482078552, 0.700244128704071, -0.0737466812133789))
handle.Color = Color3.new(1, 0, 0.74902)
handle.Locked = true
handle.Orientation = Vector3.new(-44.45000076293945, -95.93000030517578, 0)
handle.Rotation = Vector3.new(-96.01000213623047, -45.2400016784668, -98.44000244140625)
handle.Size = Vector3.new(0.30000001192092896, 3, 0.6000000238418579)
handle.TopSurface = Enum.SurfaceType.Smooth
handle.Size = Vector3.new(0.30000001192092896, 3, 0.6000000238418579)
handle.Name = "Handle"
handle.Parent = prettyprettyprincess_sceptor

local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "http://www.roblox.com/asset/?id=113951395"
mesh.TextureId = "http://www.roblox.com/asset/?id=113949852"
mesh.Scale = Vector3.new(1.5, 1.5, 1.5)
mesh.Parent = handle

local fire = Instance.new("Sound")
fire.RollOffMinDistance = 0
fire.SoundId = "http://www.roblox.com/asset/?id=113952851"
fire.Volume = 1
fire.Name = "Fire"
fire.Parent = handle

local wave = Instance.new("Animation")
wave.AnimationId = "http://www.roblox.com/asset/?id=55270038"
wave.Name = "Wave"
wave.Parent = prettyprettyprincess_sceptor

local LScript = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/PrettyPrincessSceptor/LocalScript.lua", "local", prettyprettyprincess_sceptor)
LScript.Name = "LocalScript"

local SScript = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/PrettyPrincessSceptor/Script.lua", "server", prettyprettyprincess_sceptor)
SScript.Name = "Script"

local MouseIcon = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/PrettyPrincessSceptor/MouseIcon.lua", "local", prettyprettyprincess_sceptor)
MouseIcon.Name = "MouseIcon"