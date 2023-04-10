local owner : Player = owner

MisL = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/MisL/main/source.lua"))()

local dual_venomshanks = Instance.new("Tool")
dual_venomshanks.Grip = CFrame.fromMatrix(Vector3.new(0, 0, -2), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1), Vector3.new(1, 0, 0))
dual_venomshanks.GripForward = Vector3.new(-1, -0, -0)
dual_venomshanks.GripPos = Vector3.new(0, 0, -2)
dual_venomshanks.GripRight = Vector3.new(0, 1, 0)
dual_venomshanks.GripUp = Vector3.new(0, 0, 1)
dual_venomshanks.ToolTip = "Dual Venomshanks"
dual_venomshanks.TextureId = "http://www.roblox.com/asset?id= 158070595 "
dual_venomshanks.WorldPivot = CFrame.fromMatrix(Vector3.new(1.0982558727264404, 1.7415683269500732, 0.2626173496246338), Vector3.new(0.03124326840043068, -0.678074061870575, 0.734329342842102), Vector3.new(-0.026957042515277863, -0.7349923849105835, -0.6775393486022949), Vector3.new(0.9991483092308044, 0.0013731957878917456, -0.04124243184924126))
dual_venomshanks.Name = "Dual Venomshanks"
dual_venomshanks.Parent = owner.Backpack

local handle = Instance.new("Part")
handle.BottomSurface = Enum.SurfaceType.Smooth
handle.CFrame = CFrame.fromMatrix(Vector3.new(-79.87849426269531, 14.129484176635742, -16.32939910888672), Vector3.new(0.03124326840043068, -0.6780742406845093, 0.7343294024467468), Vector3.new(-0.026957038789987564, -0.7349923849105835, -0.6775393486022949), Vector3.new(0.999148428440094, 0.0013731931103393435, -0.04124244302511215))
handle.Locked = true
handle.Material = Enum.Material.Metal
handle.Orientation = Vector3.new(-0.07999999821186066, 92.36000061035156, -137.30999755859375)
handle.Rotation = Vector3.new(-178.08999633789062, 87.63999938964844, 40.790000915527344)
handle.Size = Vector3.new(1, 0.800000011920929, 6)
handle.TopSurface = Enum.SurfaceType.Smooth
handle.Size = Vector3.new(1, 0.800000011920929, 6)
handle.Name = "Handle"
handle.Parent = dual_venomshanks

local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "rbxasset://fonts/sword.mesh"
mesh.TextureId = "rbxasset://textures/SwordTexture.png"
mesh.Scale = Vector3.new(1.5, 1.5, 1.5)
mesh.VertexColor = Vector3.new(0.30000001192092896, 1, 0.30000001192092896)
mesh.Parent = handle

local acid_hit = Instance.new("Sound")
acid_hit.SoundId = "http://www.roblox.com/asset/?id=141649183"
acid_hit.Volume = 0.6000000238418579
acid_hit.Name = "AcidHit"
acid_hit.Parent = handle

local acid_rain = Instance.new("Sound")
acid_rain.Looped = true
acid_rain.SoundId = "http://www.roblox.com/asset/?id=111816866"
acid_rain.Volume = 1
acid_rain.Name = "AcidRain"
acid_rain.Parent = handle

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

local display_handle = Instance.new("Part")
display_handle.BottomSurface = Enum.SurfaceType.Smooth
display_handle.CFrame = CFrame.fromMatrix(Vector3.new(-1.6069998741149902, 2.8399999141693115, 1.3920000791549683), Vector3.new(0.9991719126701355, 0.000840289518237114, -0.0406799241900444), Vector3.new(-0.026966989040374756, -0.7349916696548462, -0.6775397062301636), Vector3.new(-0.030468733981251717, 0.6780756711959839, -0.7343603372573853))
display_handle.Locked = true
display_handle.Material = Enum.Material.Metal
display_handle.Orientation = Vector3.new(-42.689998626708984, -177.6199951171875, 179.92999267578125)
display_handle.Rotation = Vector3.new(-137.27999877929688, -1.75, 1.5499999523162842)
display_handle.Size = Vector3.new(1, 0.800000011920929, 6)
display_handle.TopSurface = Enum.SurfaceType.Smooth
display_handle.Size = Vector3.new(1, 0.800000011920929, 6)
display_handle.Name = "DisplayHandle"
display_handle.Parent = dual_venomshanks

local Kill = MisL.newScript("script.Parent:Destroy()", "server", display_handle)
Kill.Name =  "Kill"

local mesh_2 = Instance.new("SpecialMesh")
mesh_2.MeshType = Enum.MeshType.FileMesh
mesh_2.MeshId = "rbxasset://fonts/sword.mesh"
mesh_2.TextureId = "rbxasset://textures/SwordTexture.png"
mesh_2.Scale = Vector3.new(1.5, 1.5, 1.5)
mesh_2.VertexColor = Vector3.new(0.30000001192092896, 1, 0.30000001192092896)
mesh_2.Parent = display_handle

local script = Instance.new("Script")
script.Parent = display_handle

local weld = Instance.new("Weld")
weld.C0 = CFrame.fromMatrix(Vector3.new(25.948768615722656, -4.560567855834961, 82.81533813476562), Vector3.new(0.03124326840043068, -0.026957040652632713, 0.9991483688354492), Vector3.new(-0.6780741214752197, -0.7349923849105835, 0.0013731943909078836), Vector3.new(0.7343294024467468, -0.6775393486022949, -0.041242435574531555))
weld.C1 = CFrame.fromMatrix(Vector3.new(5.359130859375, 1.2586058378219604, -2.830714702606201), Vector3.new(0.9991719126701355, -0.026966989040374756, -0.030468733981251717), Vector3.new(0.000840289518237114, -0.7349916696548462, 0.6780756711959839), Vector3.new(-0.0406799241900444, -0.6775397062301636, -0.7343603372573853))
weld.Part0 = handle
weld.Part1 = display_handle
weld.Parent = display_handle

local idle = Instance.new("Animation")
idle.AnimationId = "http://www.roblox.com/asset/?id=185824714"
idle.Name = "Idle"
idle.Parent = dual_venomshanks

local lunge = Instance.new("Animation")
lunge.AnimationId = "http://www.roblox.com/asset/?id=186002834"
lunge.Name = "Lunge"
lunge.Parent = dual_venomshanks

local slash = Instance.new("Animation")
slash.AnimationId = "http://www.roblox.com/asset/?id=186001341"
slash.Name = "Slash"
slash.Parent = dual_venomshanks

local spin = Instance.new("Animation")
spin.AnimationId = "http://www.roblox.com/Asset?ID=157568994"
spin.Name = "Spin"
spin.Parent = dual_venomshanks

local remote_action = Instance.new("RemoteEvent")
remote_action.Name = "RemoteAction"
remote_action.Parent = dual_venomshanks

local remote_click = Instance.new("RemoteEvent")
remote_click.Name = "RemoteClick"
remote_click.Parent = dual_venomshanks

local remote_input = Instance.new("RemoteEvent")
remote_input.Name = "RemoteInput"
remote_input.Parent = dual_venomshanks

local configurations = Instance.new("Configuration")
configurations.Name = "Configurations"
configurations.Parent = dual_venomshanks

local can_teamkill = Instance.new("BoolValue")
can_teamkill.Name = "CanTeamkill"
can_teamkill.Parent = configurations

local idle_damage = Instance.new("IntValue")
idle_damage.Value = 5
idle_damage.Name = "IdleDamage"
idle_damage.Parent = configurations

local slash_damage = Instance.new("IntValue")
slash_damage.Value = 10
slash_damage.Name = "SlashDamage"
slash_damage.Parent = configurations

local lunge_damage = Instance.new("IntValue")
lunge_damage.Value = 20
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

local poison_blocked_by_force_field = Instance.new("BoolValue")
poison_blocked_by_force_field.Name = "PoisonBlockedByForceField"
poison_blocked_by_force_field.Parent = configurations

local poison_color = Instance.new("BrickColorValue")
poison_color.Value = BrickColor.new(0.6431372761726379, 0.7411764860153198, 0.27843138575553894)
poison_color.Name = "PoisonColor"
poison_color.Parent = configurations

local poison_damage_ratio = Instance.new("NumberValue")
poison_damage_ratio.Value = 0.125
poison_damage_ratio.Name = "PoisonDamageRatio"
poison_damage_ratio.Parent = configurations

local poison_duration = Instance.new("NumberValue")
poison_duration.Value = 10
poison_duration.Name = "PoisonDuration"
poison_duration.Parent = configurations

local poison_rate = Instance.new("NumberValue")
poison_rate.Value = 2
poison_rate.Name = "PoisonRate"
poison_rate.Parent = configurations

local puddle_radius = Instance.new("NumberValue")
puddle_radius.Value = 15
puddle_radius.Name = "PuddleRadius"
puddle_radius.Parent = configurations

local puddle_spawn_radius = Instance.new("NumberValue")
puddle_spawn_radius.Value = 50
puddle_spawn_radius.Name = "PuddleSpawnRadius"
puddle_spawn_radius.Parent = configurations

local puddle_lifetime = Instance.new("NumberValue")
puddle_lifetime.Value = 30
puddle_lifetime.Name = "PuddleLifetime"
puddle_lifetime.Parent = configurations

local acid_damage = Instance.new("NumberValue")
acid_damage.Value = 1.25
acid_damage.Name = "AcidDamage"
acid_damage.Parent = configurations

local data = Instance.new("Configuration")
data.Name = "Data"
data.Parent = dual_venomshanks

local whirlwind_available = Instance.new("BoolValue")
whirlwind_available.Name = "WhirlwindAvailable"
whirlwind_available.Parent = data

local DualDrop:Script = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/DualVenomshanks/DualDrop.lua", "server", dual_venomshanks)
DualDrop.Name = "DualDrop"

local Script:Script = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/DualVenomshanks/FixedScript.lua", "server", dual_venomshanks)
Script.Name = "Script"

local LocalScript:LocalScript = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/DualVenomshanks/LocalScript.lua", "local", dual_venomshanks)
LocalScript.Name = "LocalScript"