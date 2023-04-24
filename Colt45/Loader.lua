local owner : Player = owner

local MisL : "Library" = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/MisL/main/source.lua"))()

local colt45 = Instance.new("Tool")
colt45.Grip = CFrame.fromMatrix(Vector3.new(0.17561760544776917, -0.3076762855052948, 0.514754056930542), Vector3.new(0.8325195908546448, -0.002452649176120758, -0.5539901852607727), Vector3.new(0.05964165925979614, 0.9945751428604126, 0.08522451668977737), Vector3.new(0.5507756471633911, -0.10399197041988373, 0.8281495571136475))
colt45.GripForward = Vector3.new(-0.5507756471633911, 0.10399197041988373, -0.8281495571136475)
colt45.GripPos = Vector3.new(0.17561760544776917, -0.3076762855052948, 0.514754056930542)
colt45.GripRight = Vector3.new(0.8325195908546448, -0.002452649176120758, -0.5539901852607727)
colt45.GripUp = Vector3.new(0.05964165925979614, 0.9945751428604126, 0.08522451668977737)
colt45.ToolTip = "The General's .45"
colt45.TextureId = "http://www.roblox.com/asset/?id=97888232"
colt45.WorldPivot = CFrame.fromMatrix(Vector3.new(28.369478225708008, 10.393280029296875, -2.593027114868164), Vector3.new(-0.6716545224189758, -0.005944904405623674, 0.7408365607261658), Vector3.new(-0.21649134159088135, 0.9578986167907715, -0.188583642244339), Vector3.new(-0.7085291147232056, -0.2870485186576843, -0.6446608901023865))
colt45.Name = "Colt 45"
colt45.Parent = owner.Backpack

local handle = Instance.new("Part")
handle.BrickColor = BrickColor.new(0, 0.5607843399047852, 0.6117647290229797)
handle.CFrame = CFrame.fromMatrix(Vector3.new(28.369478225708008, 10.393280029296875, -2.593027114868164), Vector3.new(-0.6716545224189758, -0.005944904405623674, 0.7408365607261658), Vector3.new(-0.21649134159088135, 0.9578986167907715, -0.188583642244339), Vector3.new(-0.7085291147232056, -0.2870485186576843, -0.6446608901023865))
handle.Color = Color3.new(0, 0.560784, 0.611765)
handle.Locked = true
handle.Material = Enum.Material.Metal
handle.Orientation = Vector3.new(16.68000030517578, -132.3000030517578, -0.36000001430511475)
handle.Rotation = Vector3.new(156, -45.119998931884766, 162.1300048828125)
handle.Size = Vector3.new(0.510000467300415, 1.1800024509429932, 1.3499970436096191)
handle.Size = Vector3.new(0.510000467300415, 1.1800024509429932, 1.3499970436096191)
handle.Name = "Handle"
handle.Parent = colt45

local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "http://www.roblox.com/asset/?id=97886770"
mesh.TextureId = "http://www.roblox.com/asset/?id=97888197"
mesh.Scale = Vector3.new(1.7999999523162842, 1.7999999523162842, 1.7999999523162842)
mesh.Parent = handle

local fire = Instance.new("Sound")
fire.PlaybackSpeed = 0.8211691379547119
fire.SoundId = "http://www.roblox.com/asset/?id=97848313"
fire.Volume = 1
fire.Name = "Fire"
fire.Parent = handle

local reload = Instance.new("Sound")
reload.SoundId = "http://www.roblox.com/asset/?id=97848255"
reload.Volume = 1
reload.Name = "Reload"
reload.Parent = handle

local aim = Instance.new("Vector3Value")
aim.Value = Vector3.new(7370.474609375, -428.25225830078125, -6819.599609375)
aim.Name = "Aim"
aim.Parent = colt45

local ammo = Instance.new("IntValue")
ammo.Value = 25
ammo.Name = "Ammo"
ammo.Parent = colt45

local down = Instance.new("BoolValue")
down.Name = "Down"
down.Parent = colt45

local no_clips = Instance.new("IntValue")
no_clips.Name = "NoClips"
no_clips.Parent = colt45

local reloading = Instance.new("BoolValue")
reloading.Name = "Reloading"
reloading.Parent = colt45

local fire_ani = Instance.new("Animation")
fire_ani.AnimationId = "http://www.roblox.com/Asset?ID=97884303"
fire_ani.Name = "FireAni"
fire_ani.Parent = colt45

local do_fire_ani = Instance.new("BoolValue")
do_fire_ani.Name = "DoFireAni"
do_fire_ani.Parent = colt45

local idle = Instance.new("Animation")
idle.AnimationId = "http://www.roblox.com/Asset?ID=97884040"
idle.Name = "idle"
idle.Parent = colt45

local reload_2 = Instance.new("Animation")
reload_2.AnimationId = "http://www.roblox.com/Asset?ID=97885754"
reload_2.Name = "Reload"
reload_2.Parent = colt45

local bullet_mesh = Instance.new("SpecialMesh")
bullet_mesh.MeshType = Enum.MeshType.FileMesh
bullet_mesh.MeshId = "http://www.roblox.com/asset/?id=95387759"
bullet_mesh.TextureId = "http://www.roblox.com/asset/?id=95387789"
bullet_mesh.Scale = Vector3.new(3, 3, 3)
bullet_mesh.Name = "BulletMesh"
bullet_mesh.Parent = colt45

local ammo_hud = Instance.new("ScreenGui")
ammo_hud.IgnoreGuiInset = false
ammo_hud.ResetOnSpawn = true
ammo_hud.ZIndexBehavior = Enum.ZIndexBehavior.Global
ammo_hud.Name = "AmmoHud"
ammo_hud.Parent = colt45

local bar = Instance.new("Frame")
bar.BackgroundTransparency = 1
bar.ClipsDescendants = true
bar.Position = UDim2.new(1, -175, 1, -170)
bar.Size = UDim2.new(0, 175, 0, 60)
bar.Visible = true
bar.Name = "Bar"
bar.Parent = ammo_hud

local ammo_left = Instance.new("Frame")
ammo_left.BackgroundTransparency = 1
ammo_left.Position = UDim2.new(0, 10, 0, 5)
ammo_left.Size = UDim2.new(0, 65, 0, 50)
ammo_left.Visible = true
ammo_left.Name = "AmmoLeft"
ammo_left.Parent = bar

local _1 = Instance.new("Frame")
_1.BackgroundTransparency = 1
_1.Size = UDim2.new(0, 30, 0, 40)
_1.Visible = true
_1.Name = "1"
_1.Parent = ammo_left

local image_label = Instance.new("ImageLabel")
image_label.Image = "http://www.roblox.com/asset/?id=94130434"
image_label.BackgroundTransparency = 1
image_label.Size = UDim2.new(1, 0, 1, 0)
image_label.Visible = true
image_label.ZIndex = 2
image_label.Parent = _1

local digit = Instance.new("ImageLabel")
digit.Image = "http://www.roblox.com/asset/?id=94099941"
digit.BackgroundTransparency = 1
digit.Position = UDim2.new(0.0500000007, 0, 0.0500000007, 0)
digit.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
digit.Visible = true
digit.ZIndex = 2
digit.Name = "digit"
digit.Parent = _1

local _2 = Instance.new("Frame")
_2.BackgroundTransparency = 1
_2.Position = UDim2.new(1, -30, 0, 0)
_2.Size = UDim2.new(0, 30, 0, 40)
_2.Visible = true
_2.Name = "2"
_2.Parent = ammo_left

local image_label_2 = Instance.new("ImageLabel")
image_label_2.Image = "http://www.roblox.com/asset/?id=94130434"
image_label_2.BackgroundTransparency = 1
image_label_2.Size = UDim2.new(1, 0, 1, 0)
image_label_2.Visible = true
image_label_2.ZIndex = 2
image_label_2.Parent = _2

local digit_2 = Instance.new("ImageLabel")
digit_2.Image = "http://www.roblox.com/asset/?id=94099941"
digit_2.BackgroundTransparency = 1
digit_2.Position = UDim2.new(0.0500000007, 0, 0.0500000007, 0)
digit_2.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
digit_2.Visible = true
digit_2.ZIndex = 2
digit_2.Name = "digit"
digit_2.Parent = _2

local slash = Instance.new("ImageLabel")
slash.Image = "http://www.roblox.com/asset/?id=94100300"
slash.BackgroundTransparency = 1
slash.Position = UDim2.new(0.5, -13, 0, 5)
slash.Size = UDim2.new(0, 30, 0, 40)
slash.Visible = true
slash.ZIndex = 2
slash.Name = "slash"
slash.Parent = bar

local total_ammo = Instance.new("Frame")
total_ammo.BackgroundTransparency = 1
total_ammo.Position = UDim2.new(0.5, 20, 0, 5)
total_ammo.Size = UDim2.new(0, 65, 0, 50)
total_ammo.Visible = true
total_ammo.Name = "TotalAmmo"
total_ammo.Parent = bar

local _1_2 = Instance.new("Frame")
_1_2.BackgroundTransparency = 1
_1_2.ClipsDescendants = true
_1_2.Size = UDim2.new(0, 30, 0, 40)
_1_2.Visible = true
_1_2.Name = "1"
_1_2.Parent = total_ammo

local image_label_3 = Instance.new("ImageLabel")
image_label_3.Image = "http://www.roblox.com/asset/?id=94130434"
image_label_3.BackgroundTransparency = 1
image_label_3.Size = UDim2.new(1, 0, 1, 0)
image_label_3.Visible = true
image_label_3.ZIndex = 2
image_label_3.Parent = _1_2

local digit_3 = Instance.new("ImageLabel")
digit_3.Image = "http://www.roblox.com/asset/?id=94099941"
digit_3.BackgroundTransparency = 1
digit_3.Position = UDim2.new(0.0500000007, 0, 0.0500000007, 0)
digit_3.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
digit_3.Visible = true
digit_3.ZIndex = 2
digit_3.Name = "digit"
digit_3.Parent = _1_2

local _2_2 = Instance.new("Frame")
_2_2.BackgroundTransparency = 1
_2_2.Position = UDim2.new(1, -30, 0, 0)
_2_2.Size = UDim2.new(0, 30, 0, 40)
_2_2.Visible = true
_2_2.Name = "2"
_2_2.Parent = total_ammo

local image_label_4 = Instance.new("ImageLabel")
image_label_4.Image = "http://www.roblox.com/asset/?id=94130434"
image_label_4.BackgroundTransparency = 1
image_label_4.Size = UDim2.new(1, 0, 1, 0)
image_label_4.Visible = true
image_label_4.ZIndex = 2
image_label_4.Parent = _2_2

local digit_4 = Instance.new("ImageLabel")
digit_4.Image = "http://www.roblox.com/asset/?id=94099941"
digit_4.BackgroundTransparency = 1
digit_4.Position = UDim2.new(0.0500000007, 0, 0.0500000007, 0)
digit_4.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
digit_4.Visible = true
digit_4.ZIndex = 2
digit_4.Name = "digit"
digit_4.Parent = _2_2

local image_label_5 = Instance.new("ImageLabel")
image_label_5.Image = "http://www.roblox.com/asset/?id=97850218"
image_label_5.Size = UDim2.new(1, 0, 1, 0)
image_label_5.Visible = true
image_label_5.Parent = bar

local input = Instance.new("RemoteEvent")
input.Name = "Input"
input.Parent = colt45

local set_icon = Instance.new("RemoteEvent")
set_icon.Name = "SetIcon"
set_icon.Parent = colt45

local LScript = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/Colt45/LocalScript.lua", "local", colt45)
LScript.Name = "LocalScript"

local SScript = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/Colt45/Script.lua", "server", colt45)
SScript.Name = "Script"

local Firescript = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/Colt45/Firescript.lua", "server", colt45)
Firescript.Name = "Firescript"