local Airstrike = Instance.new("Tool")
Airstrike.Grip = CFrame.fromMatrix(Vector3.new(-0.3292371928691864, -0.5762642621994019, 0.15727588534355164), Vector3.new(-0.2923717498779297, 0.0999610647559166, 0.9510660171508789), Vector3.new(0, 0.9945219159126282, -0.10452846437692642), Vector3.new(-0.9563047289848328, -0.030561169609427452, -0.29077011346817017))
Airstrike.GripForward = Vector3.new(0.9563047289848328, 0.030561169609427452, 0.29077011346817017)
Airstrike.GripPos = Vector3.new(-0.3292371928691864, -0.5762642621994019, 0.15727588534355164)
Airstrike.GripRight = Vector3.new(-0.2923717498779297, 0.0999610647559166, 0.9510660171508789)
Airstrike.GripUp = Vector3.new(0, 0.9945219159126282, -0.10452846437692642)
Airstrike.ToolTip = "Call in an airstrike on a designated location."
Airstrike.TextureId = "http://www.roblox.com/asset/?id=88743128"
Airstrike.WorldPivot = CFrame.fromMatrix(Vector3.new(-54.311763763427734, 5.289547443389893, -44.7132682800293), Vector3.new(0.2923717498779297, 0, 0.9563047289848328), Vector3.new(-0.0999610647559166, 0.9945219159126282, 0.030561169609427452), Vector3.new(-0.9510660171508789, -0.10452846437692642, 0.29077011346817017))
Airstrike.Name = "Airstrike"
Airstrike.Parent = owner.Backpack

MisL = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/MisL/main/source.lua"))()

local handle = Instance.new("Part")
handle.CFrame = CFrame.fromMatrix(Vector3.new(-3.1197214126586914, 8.430130004882812, -26.801076889038086), Vector3.new(0.2923717498779297, 0, 0.9563047289848328), Vector3.new(-0.0999610647559166, 0.9945219159126282, 0.030561169609427452), Vector3.new(-0.9510660171508789, -0.10452846437692642, 0.29077011346817017))
handle.Locked = true
handle.Orientation = Vector3.new(6, -73, 0)
handle.Reflectance = 0.3499999940395355
handle.Rotation = Vector3.new(19.770000457763672, -72, 18.8799991607666)
handle.Size = Vector3.new(0.800000011920929, 2.299999952316284, 0.4000000059604645)
handle.Size = Vector3.new(0.800000011920929, 2.299999952316284, 0.4000000059604645)
handle.Name = "Handle"
handle.Parent = Airstrike

local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "http://www.roblox.com/asset/?id=88742707"
mesh.TextureId = "http://www.roblox.com/asset/?id=88742969"
mesh.Parent = handle

local sound = Instance.new("Sound")
sound.SoundId = "http://www.roblox.com/asset/?id=88858815"
sound.Volume = 1
sound.Parent = handle

local right_grip_attachment = Instance.new("Attachment")
right_grip_attachment.Axis = Vector3.new(-0.9396922588348389, -0.029808182269334793, -0.34071969985961914)
right_grip_attachment.CFrame = CFrame.fromMatrix(Vector3.new(-0.4000000059604645, -0.5, 0), Vector3.new(-0.9396922588348389, -0.029808182269334793, -0.34071969985961914), Vector3.new(9.791064030650887e-07, 0.9961947202682495, -0.08715572953224182), Vector3.new(0.3420211374759674, -0.08189989626407623, -0.9361164569854736))
right_grip_attachment.Orientation = Vector3.new(4.697780132293701, 159.92962646484375, -1.713895320892334)
right_grip_attachment.Position = Vector3.new(-0.4000000059604645, -0.5, 0)
right_grip_attachment.SecondaryAxis = Vector3.new(9.791064030650887e-07, 0.9961947202682495, -0.08715572953224182)
right_grip_attachment.Visible = false
right_grip_attachment.WorldAxis = Vector3.new(0.052287131547927856, 0.005970017984509468, -0.9986142516136169)
right_grip_attachment.WorldCFrame = CFrame.fromMatrix(Vector3.new(-3.186689615249634, 7.932868957519531, -27.19887924194336), Vector3.new(0.052287131547927856, 0.005970017984509468, -0.9986142516136169), Vector3.new(-0.016689546406269073, 0.9998477697372437, 0.005103530362248421), Vector3.new(0.9984926581382751, 0.016399569809436798, 0.05237880349159241))
right_grip_attachment.WorldOrientation = Vector3.new(-0.9396684169769287, 86.99713897705078, 0.34210485219955444)
right_grip_attachment.WorldPosition = Vector3.new(-3.186689615249634, 7.932868957519531, -27.19887924194336)
right_grip_attachment.WorldSecondaryAxis = Vector3.new(-0.016689546406269073, 0.9998477697372437, 0.005103530362248421)
right_grip_attachment.Name = "RightGripAttachment"
right_grip_attachment.Parent = handle

local Script = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/Airstrike/Script.lua", "server", Airstrike)
Script.Name = "Script"

local LocalScript = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/Airstrike/LocalScript.lua", "local", Airstrike)
LocalScript.Name = "LocalScript"
