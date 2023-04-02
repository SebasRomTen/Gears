local Subspace_Tripmine = Instance.new("Tool")
Subspace_Tripmine.Grip = CFrame.fromMatrix(Vector3.new(-0.5, 0, 0), Vector3.new(0, -0, 1), Vector3.new(0, 1, 0), Vector3.new(-1, 0, 0))
Subspace_Tripmine.GripForward = Vector3.new(1, -0, -0)
Subspace_Tripmine.GripPos = Vector3.new(-0.5, 0, 0)
Subspace_Tripmine.GripRight = Vector3.new(0, -0, 1)
Subspace_Tripmine.TextureId = "http://www.roblox.com/asset/?id=11987521"
Subspace_Tripmine.WorldPivot = CFrame.fromMatrix(Vector3.new(-2, 3.4000000953674316, 10), Vector3.new(1, 0, 0), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1))
Subspace_Tripmine.Name = "Subspace Tripmine"
Subspace_Tripmine.Parent = owner.Backpack

MisL = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/MisL/main/source.lua"))()

local handle = Instance.new("Part")
handle.BottomSurface = Enum.SurfaceType.Smooth
handle.BrickColor = BrickColor.new(1, 0, 0.7490196228027344)
handle.CFrame = CFrame.fromMatrix(Vector3.new(-5.6211466789245605, 5.8288469314575195, -20.91588592529297), Vector3.new(1, 0, 0), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1))
handle.Color = Color3.new(1, 0, 0.74902)
handle.Size = Vector3.new(2, 2, 2)
handle.TopSurface = Enum.SurfaceType.Smooth
handle.Size = Vector3.new(2, 2, 2)
handle.Name = "Handle"
handle.Parent = Subspace_Tripmine

local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "http://www.roblox.com/asset/?id=11954776"
mesh.TextureId = "http://www.roblox.com/asset/?id=11954766"
mesh.Scale = Vector3.new(0.699999988079071, 0.699999988079071, 0.699999988079071)
mesh.Parent = handle

MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/SubspaceTripmine/PlantBombFixed.lua", "server", Subspace_Tripmine) --PlantBomb Script
MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/SubspaceTripmine/LocalGui.lua", "local", Subspace_Tripmine) --Local Gui LocalScript
