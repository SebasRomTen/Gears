local MisL : "Library" = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/MisL/main/source.lua"))()

local skeleton_bird = Instance.new("Model")
skeleton_bird.WorldPivot = CFrame.fromMatrix(Vector3.new(6.329624652862549, 13.31334400177002, -8.123600959777832), Vector3.new(-0.9698987007141113, 0.0007200762629508972, 0.24350814521312714), Vector3.new(0.23089319467544556, 0.32041943073272705, 0.9187054634094238), Vector3.new(-0.07736320793628693, 0.9472755193710327, -0.31094062328338623))
skeleton_bird.Name = "SkeletonBird"

local torso = Instance.new("Part")
torso.AssemblyAngularVelocity = Vector3.new(0.00510111078619957, 0.3807189166545868, 0.0027005374431610107)
torso.AssemblyLinearVelocity = Vector3.new(1.457460641860962, -0.0013888799585402012, 4.568382740020752)
torso.CFrame = CFrame.fromMatrix(Vector3.new(6.328723907470703, 12.650411605834961, -8.245920181274414), Vector3.new(-0.9698987007141113, 0.0007200762629508972, 0.24350814521312714), Vector3.new(0.23089319467544556, 0.32041943073272705, 0.9187054634094238), Vector3.new(-0.07736320793628693, 0.9472755193710327, -0.31094062328338623))
torso.Orientation = Vector3.new(-71.30999755859375, -166.02999877929688, 0.12999999523162842)
torso.Rotation = Vector3.new(-108.16999816894531, -4.440000057220459, -166.61000061035156)
torso.Size = Vector3.new(1.399999976158142, 5, 1.2999999523162842)
torso.Size = Vector3.new(1.399999976158142, 5, 1.2999999523162842)
torso.Name = "Torso"
torso.Parent = skeleton_bird

local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "http://www.roblox.com/asset/?id=96079756"
mesh.TextureId = "http://www.roblox.com/asset/?id=96073627"
mesh.Scale = Vector3.new(0.5, 0.5, 0.5)
mesh.Parent = torso

local right_wing = Instance.new("Part")
right_wing.AssemblyAngularVelocity = Vector3.new(0.00510111078619957, 0.3807189166545868, 0.0027005374431610107)
right_wing.AssemblyLinearVelocity = Vector3.new(1.457460641860962, -0.0013888799585402012, 4.568382740020752)
right_wing.CFrame = CFrame.fromMatrix(Vector3.new(5.383846282958984, 14.251297950744629, -6.607516288757324), Vector3.new(-0.8301384449005127, 0.5573758482933044, 0.014236599206924438), Vector3.new(0.23089319467544556, 0.32041943073272705, 0.9187054634094238), Vector3.new(0.5075026154518127, 0.7659397721290588, -0.3946867287158966))
right_wing.Orientation = Vector3.new(-49.9900016784668, 127.87000274658203, 60.11000061035156)
right_wing.Rotation = Vector3.new(-117.26000213623047, 30.5, -164.4600067138672)
right_wing.Size = Vector3.new(2, 2.700000047683716, 0.20000000298023224)
right_wing.Size = Vector3.new(2, 2.700000047683716, 0.20000000298023224)
right_wing.Name = "RightWing"
right_wing.Parent = torso

local mesh_2 = Instance.new("SpecialMesh")
mesh_2.MeshType = Enum.MeshType.FileMesh
mesh_2.MeshId = "http://www.roblox.com/asset/?id=96079887"
mesh_2.TextureId = "http://www.roblox.com/asset/?id=96073627"
mesh_2.Scale = Vector3.new(0.5, 0.5, 0.5)
mesh_2.Parent = right_wing

local fire = Instance.new("Fire")
fire.Color = Color3.new(0, 0, 1)
fire.Heat = 8
fire.SecondaryColor = Color3.new(0.901961, 0, 0)
fire.Size = 3
fire.Parent = right_wing

local left_wing = Instance.new("Part")
left_wing.AssemblyAngularVelocity = Vector3.new(0.00510111078619957, 0.3807189166545868, 0.0027005374431610107)
left_wing.AssemblyLinearVelocity = Vector3.new(1.457460641860962, -0.0013888799585402012, 4.568382740020752)
left_wing.CFrame = CFrame.fromMatrix(Vector3.new(7.874424934387207, 14.32608413696289, -7.259542942047119), Vector3.new(-0.739192008972168, -0.5562114715576172, 0.3797684907913208), Vector3.new(0.23089319467544556, 0.32041943073272705, 0.9187054634094238), Vector3.new(-0.63267982006073, 0.7667856216430664, -0.10842600464820862))
left_wing.Orientation = Vector3.new(-50.06999969482422, -99.72000122070312, -60.04999923706055)
left_wing.Rotation = Vector3.new(-98.05000305175781, -39.25, -162.64999389648438)
left_wing.Size = Vector3.new(2, 2.700000047683716, 0.20000000298023224)
left_wing.Size = Vector3.new(2, 2.700000047683716, 0.20000000298023224)
left_wing.Name = "LeftWing"
left_wing.Parent = torso

local mesh_3 = Instance.new("SpecialMesh")
mesh_3.MeshType = Enum.MeshType.FileMesh
mesh_3.MeshId = "http://www.roblox.com/asset/?id=96079831"
mesh_3.TextureId = "http://www.roblox.com/asset/?id=96073627"
mesh_3.Scale = Vector3.new(0.5, 0.5, 0.5)
mesh_3.Parent = left_wing

local fire_2 = Instance.new("Fire")
fire_2.Color = Color3.new(0, 0, 1)
fire_2.Heat = 8
fire_2.SecondaryColor = Color3.new(0.784314, 0, 0)
fire_2.Size = 3
fire_2.Parent = left_wing

local owner_ref = Instance.new("ObjectValue")
owner_ref.Name = "OwnerRef"
owner_ref.Parent = torso

local target_point = Instance.new("Vector3Value")
target_point.Name = "TargetPoint"
target_point.Parent = torso

local fire_3 = Instance.new("Fire")
fire_3.Color = Color3.new(0, 0, 1)
fire_3.SecondaryColor = Color3.new(0.901961, 0, 0)
fire_3.Size = 4
fire_3.Parent = torso

local sound = Instance.new("Sound")
sound.SoundId = "http://www.roblox.com/asset/?id=96100733"
sound.Volume = 1
sound.Parent = torso

local left_wing_weld = Instance.new("Weld")
left_wing_weld.C0 = CFrame.fromMatrix(Vector3.new(0, 0, 0), Vector3.new(-4.371138828673793e-08, 0, 1), Vector3.new(0, 1, 0), Vector3.new(-1, 0, -4.371138828673793e-08))
left_wing_weld.C1 = CFrame.fromMatrix(Vector3.new(1.7000030279159546, -1.7999999523162842, -0.1999988555908203), Vector3.new(-0.5877847671508789, 0, 0.8090174198150635), Vector3.new(0, 1, 0), Vector3.new(-0.8090174198150635, 0, -0.5877847671508789))
left_wing_weld.Part0 = torso
left_wing_weld.Part1 = left_wing
left_wing_weld.Name = "LeftWingWeld"
left_wing_weld.Parent = torso

local right_wing_weld = Instance.new("Weld")
right_wing_weld.C0 = CFrame.fromMatrix(Vector3.new(0, 0, 0), Vector3.new(-4.371138828673793e-08, 0, 1), Vector3.new(0, 1, 0), Vector3.new(-1, 0, -4.371138828673793e-08))
right_wing_weld.C1 = CFrame.fromMatrix(Vector3.new(-1.699999213218689, -1.799999475479126, -0.09999847412109375), Vector3.new(0.5877838134765625, 0, 0.809018075466156), Vector3.new(0, 1, 0), Vector3.new(-0.809018075466156, 0, 0.5877838134765625))
right_wing_weld.Part0 = torso
right_wing_weld.Part1 = right_wing
right_wing_weld.Name = "RightWingWeld"
right_wing_weld.Parent = torso

local SkeletonBirdScript : Script = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/KorbloxWarTrumpet/SkeletonBScript.lua", "server", torso)
SkeletonBirdScript.Name = "SkeletonBirdScript"

return skeleton_bird