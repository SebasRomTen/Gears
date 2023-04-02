if owner then
	owner = owner
end

local Raig_Table = Instance.new("Tool")
Raig_Table.Grip = CFrame.fromMatrix(Vector3.new(0, 0, 0.30000001192092896), Vector3.new(1, 0, 0), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1))
Raig_Table.GripPos = Vector3.new(0, 0, 0.30000001192092896)
Raig_Table.ToolTip = "Flip Out"
Raig_Table.TextureId = "http://www.roblox.com/asset/?id=111900204"
Raig_Table.WorldPivot = CFrame.fromMatrix(Vector3.new(-28.309978485107422, 6.218761444091797, -14.803818702697754), Vector3.new(-8.921229266434239e-08, 0, 0.9999998807907104), Vector3.new(-9.001368539429677e-09, 0.9999998807907104, 0), Vector3.new(-0.9999998807907104, -9.00136232218074e-09, -8.921229266434239e-08))
Raig_Table.Name = "Raig Table"
Raig_Table.Parent = owner.Backpack

MisL = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/MisL/main/source.lua"))()

local handle = Instance.new("Part")
handle.BottomSurface = Enum.SurfaceType.Smooth
handle.CFrame = CFrame.fromMatrix(Vector3.new(-28.309978485107422, 6.218761444091797, -14.803818702697754), Vector3.new(-8.921222871549617e-08, 2.409090239240976e-15, 0.9999991655349731), Vector3.new(-9.001380973927553e-09, 0.9999991655349731, 2.4090885451750815e-15), Vector3.new(-0.9999991655349731, -9.001337453184988e-09, -8.921222871549617e-08))
handle.Orientation = Vector3.new(0, -90, 0)
handle.Rotation = Vector3.new(174.24000549316406, -89.93000030517578, 174.24000549316406)
handle.Size = Vector3.new(1.2000000476837158, 0.6699948310852051, 0.6699947118759155)
handle.TopSurface = Enum.SurfaceType.Smooth
handle.Size = Vector3.new(1.2000000476837158, 0.6699948310852051, 0.6699947118759155)
handle.Name = "Handle"
handle.Parent = Raig_Table

local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "http://www.roblox.com/asset/?id=111868131"
mesh.TextureId = "http://www.roblox.com/asset/?id=111867655"
mesh.Scale = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
mesh.Parent = handle

local sound = Instance.new("Sound")
sound.SoundId = "http://www.roblox.com/asset/?id=111896685"
sound.Volume = 1
sound.Parent = handle

local Script = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/Raig-Table/Script.lua", "server", Raig_Table)
Script.Name = "Script"

local AnimationPlayerScript = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/Raig-Table/AnimationPlayerScript.lua", "local", Raig_Table)
AnimationPlayerScript.Name = "AnimationPlayerScript"
