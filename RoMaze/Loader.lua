local ro_maze = Instance.new("Tool")
ro_maze.Grip = CFrame.fromMatrix(Vector3.new(0, -0.30000001192092896, 0), Vector3.new(0, 0, -1), Vector3.new(1, -0, 0), Vector3.new(-0, -1, -0))
ro_maze.GripForward = Vector3.new(0, 1, 0)
ro_maze.GripPos = Vector3.new(0, -0.30000001192092896, 0)
ro_maze.GripRight = Vector3.new(0, 0, -1)
ro_maze.GripUp = Vector3.new(1, -0, 0)
ro_maze.WorldPivot = CFrame.fromMatrix(Vector3.new(-5.134459018707275, 7.944089889526367, -25.339336395263672), Vector3.new(-0.6844619512557983, -0.0010939519852399826, -0.7290480732917786), Vector3.new(-0.000031439296435564756, -0.9999991655349731, 0.0015300360973924398), Vector3.new(-0.7290489077568054, 0.0010701718274503946, 0.6844608783721924))
ro_maze.Name = "RoMaze"
ro_maze.Parent = owner.Backpack

MisL = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/MisL/main/source.lua"))()

local handle = Instance.new("Part")
handle.CFrame = CFrame.fromMatrix(Vector3.new(-5.134459018707275, 7.944089889526367, -25.339336395263672), Vector3.new(-0.6844649910926819, -0.001093955826945603, -0.7290495038032532), Vector3.new(-0.00003143910726066679, -1.000003695487976, 0.0015300404047593474), Vector3.new(-0.7290509343147278, 0.0010701743885874748, 0.6844611167907715))
handle.Orientation = Vector3.new(-0.05999999865889549, -46.810001373291016, -179.94000244140625)
handle.Rotation = Vector3.new(-0.09000000357627869, -46.810001373291016, 180)
handle.Size = Vector3.new(1.5599994659423828, 1, 0.46000009775161743)
handle.Size = Vector3.new(1.5599994659423828, 1, 0.46000009775161743)
handle.Name = "Handle"
handle.Parent = ro_maze

local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "http://www.roblox.com/asset/?id=58266976 "
mesh.TextureId = "http://www.roblox.com/asset/?id=73808769"
mesh.Parent = handle

MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/RoMaze/RoMaze_Main.lua", "local", ro_maze)
