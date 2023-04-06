local fakeOwner : Player = owner

if owner then
	owner = owner or fakeOwner
end

MisL = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/MisL/main/source.lua"))()

local skeletonscythe = Instance.new("Tool")
skeletonscythe.Grip = CFrame.fromMatrix(Vector3.new(0.9399999976158142, -4.699999809265137, -0.1599999964237213), Vector3.new(0, 0, -1), Vector3.new(0, 1, 0), Vector3.new(1, -0, 0))
skeletonscythe.GripForward = Vector3.new(-1, 0, -0)
skeletonscythe.GripPos = Vector3.new(0.9399999976158142, -4.699999809265137, -0.1599999964237213)
skeletonscythe.GripRight = Vector3.new(0, 0, -1)
skeletonscythe.ToolTip = "Rise from your grave!"
skeletonscythe.TextureId = "http://www.roblox.com/asset/?id=95891250"
skeletonscythe.WorldPivot = CFrame.fromMatrix(Vector3.new(-10.229999542236328, 19.809999465942383, 18.529998779296875), Vector3.new(0.706535816192627, -0.7076758742332458, 0.00008768259431235492), Vector3.new(0.7076756358146667, 0.7065355777740479, -0.00008856950444169343), Vector3.new(0.0000012236770317031187, 0.00012491892266552895, 0.9999992847442627))
skeletonscythe.Name = "SkeletonScythe"
skeletonscythe.Parent = fakeOwner.Backpack

local handle = Instance.new("Part")
handle.BottomSurface = Enum.SurfaceType.Smooth
handle.CFrame = CFrame.fromMatrix(Vector3.new(-16.044593811035156, 11.43959903717041, -15.3446683883667), Vector3.new(0.706535816192627, -0.7076758742332458, 0.00008768259431235492), Vector3.new(0.7076756358146667, 0.7065355777740479, -0.00008856950444169343), Vector3.new(0.0000012236770317031187, 0.00012491892266552895, 0.9999992847442627))
handle.Locked = true
handle.Orientation = Vector3.new(-0.009999999776482582, 0, -45.04999923706055)
handle.Rotation = Vector3.new(-0.009999999776482582, 0, -45.04999923706055)
handle.Size = Vector3.new(4.599997043609619, 2.200000286102295, 0.5000003576278687)
handle.TopSurface = Enum.SurfaceType.Smooth
handle.Size = Vector3.new(4.599997043609619, 2.200000286102295, 0.5000003576278687)
handle.Name = "Handle"
handle.Parent = skeletonscythe

local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "http://www.roblox.com/asset/?id=95891318"
mesh.TextureId = "http://www.roblox.com/asset/?id=95891299"
mesh.Scale = Vector3.new(0.800000011920929, 0.800000011920929, 0.800000011920929)
mesh.Parent = handle

local swordslash = Instance.new("Sound")
swordslash.SoundId = "rbxasset://sounds//swordslash.wav"
swordslash.Volume = 1
swordslash.Name = "SwordSlash"
swordslash.Parent = handle

local gong = Instance.new("Sound")
gong.SoundId = "http://www.roblox.com/asset/?id=96098241"
gong.Volume = 1
gong.Name = "Gong"
gong.Parent = handle

local right_grip_attachment = Instance.new("Attachment")
right_grip_attachment.Axis = Vector3.new(0, 0, -1)
right_grip_attachment.Visible = false
right_grip_attachment.Name = "RightGripAttachment"
right_grip_attachment.Parent = handle

local fire_particle = Instance.new("Attachment")
fire_particle.Axis = Vector3.new(0.17364828288555145, 0.9848077297210693, 1.2385628167521645e-07)
fire_particle.Position = Vector3.new(1.1999988555908203, 9.664345270721242e-07, 0.0000032501179703103844)
fire_particle.Visible = false
fire_particle.Name = "FireParticle"
fire_particle.Parent = handle

local fire_light = Instance.new("PointLight")
fire_light.Range = 6
fire_light.Color = Color3.new(1, 0.333333, 0)
fire_light.Shadows = true
fire_light.Name = "FireLight"
fire_light.Parent = fire_particle

local fire_effect = MisL.newScript([[

local Fire = script.Parent
local Rate = 1/1000


while Fire do
	for i=1,3,1 do
		script.Parent.Range = script.Parent.Range + 1
		wait(Rate)
	end
	for i=1,2,1 do
		script.Parent.Range = script.Parent.Range - 1
		wait(Rate)
	end
	for i=1,1,1 do
		script.Parent.Range = script.Parent.Range + 1
		wait(Rate)
	end
	for i=1,2,1 do
		script.Parent.Range = script.Parent.Range - 1
		wait(Rate)
	end
end

]], "server", fire_light)
fire_effect.Name = "Fire_Effect"

local fire = Instance.new("ParticleEmitter")
fire.Acceleration = Vector3.new(8, 6, 6)
fire.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(1, 0.333333, 0)), ColorSequenceKeypoint.new(0.49584001302719116, Color3.new(1, 0, 0)), ColorSequenceKeypoint.new(1, Color3.new(0.364706, 0, 0))})
fire.Lifetime = NumberRange.new(0, 1)
fire.LightEmission = 0.8600000143051147
fire.Rate = 70
fire.RotSpeed = NumberRange.new(5, 9)
fire.Rotation = NumberRange.new(4, 9)
fire.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 1.625), NumberSequenceKeypoint.new(0.12267299741506577, 1.5), NumberSequenceKeypoint.new(0.15443600714206696, 1.4375), NumberSequenceKeypoint.new(0.20810499787330627, 1.3125), NumberSequenceKeypoint.new(0.35706499218940735, 1.3125), NumberSequenceKeypoint.new(0.5553119778633118, 1.25), NumberSequenceKeypoint.new(0.7250819802284241, 0.875), NumberSequenceKeypoint.new(0.9047099947929382, 0.4375), NumberSequenceKeypoint.new(1, 0.125)})
fire.Speed = NumberRange.new(7, 9)
fire.SpreadAngle = Vector2.new(28, 28)
fire.Texture = "http://www.roblox.com/asset/?id=248625108"
fire.Name = "Fire"
fire.Parent = fire_particle

local spawnskeleton = Instance.new("RemoteEvent")
spawnskeleton.Name = "SpawnSkeleton"
spawnskeleton.Parent = skeletonscythe

local ScytheScript = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/SkeletonScythe/ScytheScript.lua", "server", skeletonscythe)
ScytheScript.Name = "ScytheScript"

coroutine.wrap(function()
	local r15 = Instance.new("Folder")
	r15.Name = "R15"

	local scythe_equip2 = Instance.new("Animation")
	scythe_equip2.AnimationId = "rbxassetid://1296863675"
	scythe_equip2.Name = "ScytheEquip2"
	scythe_equip2.Parent = r15

	local scythe_idle2 = Instance.new("Animation")
	scythe_idle2.AnimationId = "rbxassetid://1296867556"
	scythe_idle2.Name = "ScytheIdle2"
	scythe_idle2.Parent = r15

	local scytheslash = Instance.new("Animation")
	scytheslash.AnimationId = "rbxassetid://1296868982"
	scytheslash.Name = "ScytheSlash"
	scytheslash.Parent = r15

	local r6 = Instance.new("Folder")
	r6.Name = "R6"

	local scythe_equip2_2 = Instance.new("Animation")
	scythe_equip2_2.AnimationId = "http://www.roblox.com/Asset?ID=96064636"
	scythe_equip2_2.Name = "ScytheEquip2"
	scythe_equip2_2.Parent = r6

	local scythe_idle2_2 = Instance.new("Animation")
	scythe_idle2_2.AnimationId = "http://www.roblox.com/Asset?ID=96065457"
	scythe_idle2_2.Name = "ScytheIdle2"
	scythe_idle2_2.Parent = r6

	local scytheslash_2 = Instance.new("Animation")
	scytheslash_2.AnimationId = "http://www.roblox.com/Asset?ID=96071496"
	scytheslash_2.Name = "ScytheSlash"
	scytheslash_2.Parent = r6

	local scythe_equip2_3 = Instance.new("Animation")
	scythe_equip2_3.AnimationId = "http://www.roblox.com/Asset?ID=96064636"
	scythe_equip2_3.Name = "ScytheEquip2"

	local scythe_idle2_3 = Instance.new("Animation")
	scythe_idle2_3.AnimationId = "http://www.roblox.com/Asset?ID=96065457"
	scythe_idle2_3.Name = "ScytheIdle2"

	local scytheslash_3 = Instance.new("Animation")
	scytheslash_3.AnimationId = "http://www.roblox.com/Asset?ID=96071496"
	scytheslash_3.Name = "ScytheSlash"

	local MostAnimations = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/SkeletonScythe/MostAnimations.lua", "local", skeletonscythe)
	r15.Parent = MostAnimations
	r6.Parent = MostAnimations
	scythe_equip2.Parent = MostAnimations
	scythe_idle2.Parent = MostAnimations
	scytheslash.Parent = MostAnimations
	MostAnimations.Name = "MostAnimations"
end)()

local MouseIcon = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/SkeletonScythe/MouseIcon.lua", "local", skeletonscythe)
MouseIcon.Name = "MouseIcon"

local r15_summon = Instance.new("Animation")
r15_summon.AnimationId = "rbxassetid://1296930651"
r15_summon.Name = "R15Summon"

local r6_summon = Instance.new("Animation")
r6_summon.AnimationId = "http://www.roblox.com/Asset?ID=93693205"
r6_summon.Name = "R6Summon"

local fire = Instance.new("ParticleEmitter")
fire.Acceleration = Vector3.new(8, 6, 6)
fire.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(1, 0.333333, 0)), ColorSequenceKeypoint.new(0.49584001302719116, Color3.new(1, 0, 0)), ColorSequenceKeypoint.new(1, Color3.new(0.364706, 0, 0))})
fire.Lifetime = NumberRange.new(0, 1)
fire.LightEmission = 0.8600000143051147
fire.Rate = 100
fire.RotSpeed = NumberRange.new(5, 9)
fire.Rotation = NumberRange.new(4, 9)
fire.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 1.625), NumberSequenceKeypoint.new(0.12267299741506577, 1.5), NumberSequenceKeypoint.new(0.15443600714206696, 1.4375), NumberSequenceKeypoint.new(0.20810499787330627, 1.3125), NumberSequenceKeypoint.new(0.35706499218940735, 1.3125), NumberSequenceKeypoint.new(0.5553119778633118, 1.25), NumberSequenceKeypoint.new(0.7250819802284241, 0.875), NumberSequenceKeypoint.new(0.9047099947929382, 0.4375), NumberSequenceKeypoint.new(1, 0.125)})
fire.Speed = NumberRange.new(7, 9)
fire.SpreadAngle = Vector2.new(28, 28)
fire.Texture = "http://www.roblox.com/asset/?id=248625108"
fire.Name = "Fire"
fire.Enabled = false
	
local RaiseSkeletons = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/SkeletonScythe/RaisSkeletons.lua", "server", skeletonscythe)
RaiseSkeletons.Name = "RaiseSkeletons"
fire.Parent = RaiseSkeletons
r6_summon.Parent = RaiseSkeletons
r15_summon.Parent = RaiseSkeletons

local LocalRaiseSkeletons = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/SkeletonScythe/LocalRaiseSkeletons.lua", "local", skeletonscythe)
LocalRaiseSkeletons.Name = "LocalRaiseSkeletons"