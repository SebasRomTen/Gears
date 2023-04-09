local fakeOwner : Player = owner

MisL = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/MisL/main/source.lua"))()

local dualdarkhearts = Instance.new("Tool")
dualdarkhearts.Grip = CFrame.fromMatrix(Vector3.new(0, 0, -1.5), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1), Vector3.new(1, 0, 0))
dualdarkhearts.GripForward = Vector3.new(-1, -0, -0)
dualdarkhearts.GripPos = Vector3.new(0, 0, -1.5)
dualdarkhearts.GripRight = Vector3.new(0, 1, 0)
dualdarkhearts.GripUp = Vector3.new(0, 0, 1)
dualdarkhearts.ToolTip = "Dual Darkhearts"
dualdarkhearts.TextureId = "http://www.roblox.com/asset/?id=108140478"
dualdarkhearts.WorldPivot = CFrame.fromMatrix(Vector3.new(-64.75420379638672, 14.031005859375, 22.786304473876953), Vector3.new(0.031264714896678925, -0.6780735850334167, 0.7343285083770752), Vector3.new(-0.02696678228676319, -0.734992504119873, -0.6775384545326233), Vector3.new(0.9991472959518433, 0.0013805991038680077, -0.04126482084393501))
dualdarkhearts.Name = "Dual Darkhearts"
dualdarkhearts.Parent = fakeOwner.Backpack

local handle = Instance.new("Part")
handle.BottomSurface = Enum.SurfaceType.Smooth
handle.BrickColor = BrickColor.new(0.06666667014360428, 0.06666667014360428, 0.06666667014360428)
handle.CFrame = CFrame.fromMatrix(Vector3.new(-64.75421142578125, 14.031002044677734, 22.786235809326172), Vector3.new(0.031265124678611755, -0.6780723929405212, 0.7343296408653259), Vector3.new(-0.026966538280248642, -0.7349936366081238, -0.677537202835083), Vector3.new(0.9991472959518433, 0.0013809866504743695, -0.041264958679676056))
handle.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
handle.Locked = true
handle.Orientation = Vector3.new(-0.07999999821186066, 92.36000061035156, -137.30999755859375)
handle.Rotation = Vector3.new(-178.0800018310547, 87.62999725341797, 40.779998779296875)
handle.Size = Vector3.new(1, 0.800000011920929, 4)
handle.TopSurface = Enum.SurfaceType.Smooth
handle.Size = Vector3.new(1, 0.800000011920929, 4)
handle.Name = "Handle"
handle.Parent = dualdarkhearts

local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "rbxasset://fonts/sword.mesh"
mesh.TextureId = "rbxasset://textures/SwordTexture.png"
mesh.Scale = Vector3.new(0.800000011920929, 0.800000011920929, 1)
mesh.VertexColor = Vector3.new(0, 0, 0)
mesh.Parent = handle

local stormsound = Instance.new("Sound")
stormsound.SoundId = "http://www.roblox.com/asset?id=101173442"
stormsound.Volume = 1
stormsound.Name = "StormSound"
stormsound.Parent = handle

local unsheath_sound = Instance.new("Sound")
unsheath_sound.SoundId = "rbxasset://sounds//unsheath.wav"
unsheath_sound.Volume = 0.6000000238418579
unsheath_sound.Name = "UnsheathSound"
unsheath_sound.Parent = handle

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

local staffspin = Instance.new("Animation")
staffspin.AnimationId = "http://www.roblox.com/Asset?ID=27763939"
staffspin.Name = "StaffSpin"
staffspin.Parent = dualdarkhearts

local fake_handle = Instance.new("Part")
fake_handle.BottomSurface = Enum.SurfaceType.Smooth
fake_handle.BrickColor = BrickColor.new(0.06666667014360428, 0.06666667014360428, 0.06666667014360428)
fake_handle.CFrame = CFrame.fromMatrix(Vector3.new(-1.0865325927734375, 9.79568099975586, 28.92452049255371), Vector3.new(0.9991719126701355, 0.0008410423179157078, -0.04068021476268768), Vector3.new(-0.02696654014289379, -0.7349937558174133, -0.6775374412536621), Vector3.new(-0.030469542369246483, 0.6780734062194824, -0.7343624234199524))
fake_handle.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
fake_handle.Locked = true
fake_handle.Orientation = Vector3.new(-42.689998626708984, -177.6199951171875, 179.92999267578125)
fake_handle.Rotation = Vector3.new(-137.27999877929688, -1.75, 1.5499999523162842)
fake_handle.Size = Vector3.new(1, 0.800000011920929, 4)
fake_handle.TopSurface = Enum.SurfaceType.Smooth
fake_handle.Size = Vector3.new(1, 0.800000011920929, 4)
fake_handle.Name = "FakeHandle"
fake_handle.Parent = dualdarkhearts

local Kill = MisL.newScript("script.Parent:Destroy()", "server", fake_handle)
Kill.Name = "Kill"

local mesh_2 = Instance.new("SpecialMesh")
mesh_2.MeshType = Enum.MeshType.FileMesh
mesh_2.MeshId = "rbxasset://fonts/sword.mesh"
mesh_2.TextureId = "rbxasset://textures/SwordTexture.png"
mesh_2.Scale = Vector3.new(0.800000011920929, 0.800000011920929, 1)
mesh_2.VertexColor = Vector3.new(0, 0, 0)
mesh_2.Parent = fake_handle

local weld = Instance.new("Weld")
weld.C0 = CFrame.fromMatrix(Vector3.new(28.641719818115234, -4.163775444030762, 88.11227416992188), Vector3.new(-0.000030468963814200833, 0.9999997615814209, 0.0000610575734754093), Vector3.new(-0.7077125906944275, 0.000021539663066505454, -0.7065002918243408), Vector3.new(-0.7065001726150513, -0.00006478231807705015, 0.707712709903717))
weld.C1 = CFrame.fromMatrix(Vector3.new(24.773366928100586, -1.400894045829773, -19.252037048339844), Vector3.new(0.00006103515625, 1, 0.000030517578125), Vector3.new(-0.707063615322113, 0.000021579184249276295, 0.7071499228477478), Vector3.new(0.7071499228477478, -0.00006473755638580769, 0.707063615322113))
weld.Part0 = handle
weld.Part1 = fake_handle
weld.Parent = fake_handle

local dual_equip = Instance.new("Animation")
dual_equip.AnimationId = "http://www.roblox.com/asset/?id=185824714"
dual_equip.Name = "DualEquip"
dual_equip.Parent = dualdarkhearts

local dual_slash = Instance.new("Animation")
dual_slash.AnimationId = "http://www.roblox.com/asset/?id=186001341"
dual_slash.Name = "DualSlash"
dual_slash.Parent = dualdarkhearts

local dual_lunge = Instance.new("Animation")
dual_lunge.AnimationId = "http://www.roblox.com/asset/?id=186002834"
dual_lunge.Name = "DualLunge"
dual_lunge.Parent = dualdarkhearts

local remote_click = Instance.new("RemoteEvent")
remote_click.Name = "RemoteClick"
remote_click.Parent = dualdarkhearts

local configurations = Instance.new("Configuration")
configurations.Name = "Configurations"
configurations.Parent = dualdarkhearts

local can_teamkill = Instance.new("BoolValue")
can_teamkill.Name = "CanTeamkill"
can_teamkill.Parent = configurations

local idle_damage = Instance.new("IntValue")
idle_damage.Value = 18
idle_damage.Name = "IdleDamage"
idle_damage.Parent = configurations

local slash_damage = Instance.new("IntValue")
slash_damage.Value = 16
slash_damage.Name = "SlashDamage"
slash_damage.Parent = configurations

local lunge_damage = Instance.new("IntValue")
lunge_damage.Value = 30
lunge_damage.Name = "LungeDamage"
lunge_damage.Parent = configurations

local can_kill_with_force_field = Instance.new("BoolValue")
can_kill_with_force_field.Value = true
can_kill_with_force_field.Name = "CanKillWithForceField"
can_kill_with_force_field.Parent = configurations

local dead_guy_color = Instance.new("BrickColorValue")
dead_guy_color.Value = BrickColor.new(0.10588236153125763, 0.16470588743686676, 0.20784315466880798)
dead_guy_color.Name = "DeadGuyColor"
dead_guy_color.Parent = configurations

local spins_to_whirlwind = Instance.new("IntValue")
spins_to_whirlwind.Value = 3
spins_to_whirlwind.Name = "SpinsToWhirlwind"
spins_to_whirlwind.Parent = configurations

local skull_parts = Instance.new("IntValue")
skull_parts.Value = 62
skull_parts.Name = "SkullParts"
skull_parts.Parent = configurations

local skull_damage = Instance.new("NumberValue")
skull_damage.Value = 20
skull_damage.Name = "SkullDamage"
skull_damage.Parent = configurations

local remote_input = Instance.new("RemoteEvent")
remote_input.Name = "RemoteInput"
remote_input.Parent = dualdarkhearts

local data = Instance.new("Configuration")
data.Name = "Data"
data.Parent = dualdarkhearts

local whirlwind_available = Instance.new("BoolValue")
whirlwind_available.Name = "WhirlwindAvailable"
whirlwind_available.Parent = data

local remote_action = Instance.new("RemoteEvent")
remote_action.Name = "RemoteAction"
remote_action.Parent = dualdarkhearts

local DualDrop = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/DualDarkhearts/DualDrop.lua", "server", dualdarkhearts)
DualDrop.Name = "DualDrop"

local SCR = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/DualDarkhearts/Script.lua", "server", dualdarkhearts)
SCR.Name = "Script"

local LocalScript = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/DualDarkhearts/LocalScript.lua", "local", dualdarkhearts)
LocalScript.Name = "LocalScript"