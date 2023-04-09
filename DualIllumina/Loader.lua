local owner : Player = owner

MisL = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/MisL/main/source.lua"))()

local dual_illumina = Instance.new("Tool")
dual_illumina.Grip = CFrame.fromMatrix(Vector3.new(0, 0, -1.5), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1), Vector3.new(1, 0, 0))
dual_illumina.GripForward = Vector3.new(-1, -0, -0)
dual_illumina.GripPos = Vector3.new(0, 0, -1.5)
dual_illumina.GripRight = Vector3.new(0, 1, 0)
dual_illumina.GripUp = Vector3.new(0, 0, 1)
dual_illumina.ToolTip = "Dual Illumina"
dual_illumina.TextureId = "http://www.roblox.com/asset/?id=101175663"
dual_illumina.WorldPivot = CFrame.fromMatrix(Vector3.new(-0.0009308457374572754, 2.640882730484009, 0.4832226037979126), Vector3.new(0.03124326840043068, -0.6780741214752197, 0.7343294024467468), Vector3.new(-0.026957040652632713, -0.7349923849105835, -0.6775393486022949), Vector3.new(0.9991483688354492, 0.0013731943909078836, -0.041242435574531555))
dual_illumina.Name = "Dual Illumina"
dual_illumina.Parent = owner.Backpack

local handle = Instance.new("Part")
handle.BottomSurface = Enum.SurfaceType.Smooth
handle.BrickColor = BrickColor.new(0.8980392813682556, 0.8941177129745483, 0.874509871006012)
handle.CFrame = CFrame.fromMatrix(Vector3.new(-58.63051223754883, 36.76424026489258, -78.03129577636719), Vector3.new(0.03124327026307583, -0.6780743598937988, 0.7343294024467468), Vector3.new(-0.026957036927342415, -0.7349923849105835, -0.6775393486022949), Vector3.new(0.9991484880447388, 0.0013731929939240217, -0.04124244302511215))
handle.Color = Color3.new(0.898039, 0.894118, 0.87451)
handle.Locked = true
handle.Orientation = Vector3.new(-0.07999999821186066, 92.36000061035156, -137.30999755859375)
handle.Reflectance = 0.699999988079071
handle.Rotation = Vector3.new(-178.08999633789062, 87.63999938964844, 40.790000915527344)
handle.Size = Vector3.new(1, 0.800000011920929, 4)
handle.TopSurface = Enum.SurfaceType.Smooth
handle.Size = Vector3.new(1, 0.800000011920929, 4)
handle.Name = "Handle"
handle.Parent = dual_illumina

local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "rbxasset://fonts/sword.mesh"
mesh.VertexColor = Vector3.new(1, 1, 0)
mesh.Parent = handle

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

local lunge_sound = Instance.new("Sound")
lunge_sound.SoundId = "rbxasset://sounds//swordlunge.wav"
lunge_sound.Volume = 0.6000000238418579
lunge_sound.Name = "LungeSound"
lunge_sound.Parent = handle

local slashsound = Instance.new("Sound")
slashsound.SoundId = "rbxasset://sounds//swordslash.wav"
slashsound.Volume = 0.699999988079071
slashsound.Name = "SlashSound"
slashsound.Parent = handle

local unsheath_sound = Instance.new("Sound")
unsheath_sound.SoundId = "rbxasset://sounds//unsheath.wav"
unsheath_sound.Volume = 0.6000000238418579
unsheath_sound.Name = "UnsheathSound"
unsheath_sound.Parent = handle

local stormsound = Instance.new("Sound")
stormsound.SoundId = "http://www.roblox.com/asset?id=101173442"
stormsound.Volume = 1
stormsound.Name = "StormSound"
stormsound.Parent = handle

local display_handle = Instance.new("Part")
display_handle.BottomSurface = Enum.SurfaceType.Smooth
display_handle.BrickColor = BrickColor.new(0.8980392813682556, 0.8941177129745483, 0.874509871006012)
display_handle.CFrame = CFrame.fromMatrix(Vector3.new(-2.2070000171661377, 3.740000009536743, 1.5920000076293945), Vector3.new(0.9991719126701355, 0.000840289518237114, -0.0406799241900444), Vector3.new(-0.026966989040374756, -0.7349916696548462, -0.6775397062301636), Vector3.new(-0.030468733981251717, 0.6780756711959839, -0.7343603372573853))
display_handle.Color = Color3.new(0.898039, 0.894118, 0.87451)
display_handle.Locked = true
display_handle.Orientation = Vector3.new(-42.689998626708984, -177.6199951171875, 179.92999267578125)
display_handle.Reflectance = 0.699999988079071
display_handle.Rotation = Vector3.new(-137.27999877929688, -1.75, 1.5499999523162842)
display_handle.Size = Vector3.new(1, 0.800000011920929, 4)
display_handle.TopSurface = Enum.SurfaceType.Smooth
display_handle.Size = Vector3.new(1, 0.800000011920929, 4)
display_handle.Name = "DisplayHandle"
display_handle.Parent = dual_illumina

local Kill = MisL.newScript("script.Parent:Destroy()", "server", display_handle)
Kill.Name = "Kill"

local mesh_2 = Instance.new("SpecialMesh")
mesh_2.MeshType = Enum.MeshType.FileMesh
mesh_2.MeshId = "rbxasset://fonts/sword.mesh"
mesh_2.VertexColor = Vector3.new(1, 1, 0)
mesh_2.Parent = display_handle

local illumina_sparkles_2 = Instance.new("Sparkles")
illumina_sparkles_2.Color = Color3.new(1.77083, 3.4, 1)
illumina_sparkles_2.SparkleColor = Color3.new(1, 0.333333, 1)
illumina_sparkles_2.Name = "IlluminaSparkles"
illumina_sparkles_2.Parent = display_handle

local illumina_light_2 = Instance.new("PointLight")
illumina_light_2.Range = 5
illumina_light_2.Brightness = 5
illumina_light_2.Color = Color3.new(0.564706, 0.0980392, 1)
illumina_light_2.Name = "IlluminaLight"
illumina_light_2.Parent = display_handle

local weld = Instance.new("Weld")
weld.C0 = CFrame.fromMatrix(Vector3.new(84.06132507324219, -27.42835235595703, 55.31187057495117), Vector3.new(0.03124326840043068, -0.026957038789987564, 0.999148428440094), Vector3.new(-0.6780742406845093, -0.7349923849105835, 0.0013731931103393435), Vector3.new(0.7343294024467468, -0.6775393486022949, -0.04124244302511215))
weld.C1 = CFrame.fromMatrix(Vector3.new(2.2667922973632812, 3.767995834350586, -1.4341459274291992), Vector3.new(0.9991719126701355, -0.026966989040374756, -0.030468733981251717), Vector3.new(0.000840289518237114, -0.7349916696548462, 0.6780756711959839), Vector3.new(-0.0406799241900444, -0.6775397062301636, -0.7343603372573853))
weld.Part0 = handle
weld.Part1 = display_handle
weld.Parent = display_handle

local idle = Instance.new("Animation")
idle.AnimationId = "http://www.roblox.com/asset/?id=185824714"
idle.Name = "Idle"
idle.Parent = dual_illumina

local lunge = Instance.new("Animation")
lunge.AnimationId = "http://www.roblox.com/asset/?id=186002834"
lunge.Name = "Lunge"
lunge.Parent = dual_illumina

local slash = Instance.new("Animation")
slash.AnimationId = "http://www.roblox.com/asset/?id=186001341"
slash.Name = "Slash"
slash.Parent = dual_illumina

local spin = Instance.new("Animation")
spin.AnimationId = "http://www.roblox.com/Asset?ID=27763939"
spin.Name = "Spin"
spin.Parent = dual_illumina

local remote_action = Instance.new("RemoteEvent")
remote_action.Name = "RemoteAction"
remote_action.Parent = dual_illumina

local remote_click = Instance.new("RemoteEvent")
remote_click.Name = "RemoteClick"
remote_click.Parent = dual_illumina

local remote_input = Instance.new("RemoteEvent")
remote_input.Name = "RemoteInput"
remote_input.Parent = dual_illumina

local configurations = Instance.new("Configuration")
configurations.Name = "Configurations"
configurations.Parent = dual_illumina

local can_teamkill = Instance.new("BoolValue")
can_teamkill.Name = "CanTeamkill"
can_teamkill.Parent = configurations

local idle_damage = Instance.new("IntValue")
idle_damage.Value = 20
idle_damage.Name = "IdleDamage"
idle_damage.Parent = configurations

local slash_damage = Instance.new("IntValue")
slash_damage.Value = 18
slash_damage.Name = "SlashDamage"
slash_damage.Parent = configurations

local lunge_damage = Instance.new("IntValue")
lunge_damage.Value = 36
lunge_damage.Name = "LungeDamage"
lunge_damage.Parent = configurations

local can_kill_with_force_field = Instance.new("BoolValue")
can_kill_with_force_field.Value = true
can_kill_with_force_field.Name = "CanKillWithForceField"
can_kill_with_force_field.Parent = configurations

local spins_to_whirlwind = Instance.new("IntValue")
spins_to_whirlwind.Value = 3
spins_to_whirlwind.Name = "SpinsToWhirlwind"
spins_to_whirlwind.Parent = configurations

local skull_parts = Instance.new("IntValue")
skull_parts.Value = 200
skull_parts.Name = "SkullParts"
skull_parts.Parent = configurations

local skull_damage = Instance.new("NumberValue")
skull_damage.Value = 25
skull_damage.Name = "SkullDamage"
skull_damage.Parent = configurations

local data = Instance.new("Configuration")
data.Name = "Data"
data.Parent = dual_illumina

local whirlwind_available = Instance.new("BoolValue")
whirlwind_available.Name = "WhirlwindAvailable"
whirlwind_available.Parent = data

local DualDrop = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/DualIllumina/DualDrop.lua", "server", dual_illumina)
DualDrop.Name = "DualDrop"

local Script = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/DualIllumina/Script.lua", "server", dual_illumina)
Script.Name = "Script"

local LocalScript = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/DualIllumina/LocalScript.lua", "local", dual_illumina)
LocalScript.Name = "LocalScript"