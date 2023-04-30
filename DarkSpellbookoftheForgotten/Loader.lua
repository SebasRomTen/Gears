local MisL : "Library" = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/MisL/main/source.lua"))()

local owner : Player = owner

local dark_spellbookofthe_forgotten = Instance.new("Tool")
dark_spellbookofthe_forgotten.TextureId = "http://www.roblox.com/asset/?id=56344334 "
dark_spellbookofthe_forgotten.WorldPivot = CFrame.fromMatrix(Vector3.new(-9.699999809265137, 5.087504863739014, 10.797506332397461), Vector3.new(1, 0, 0), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1))
dark_spellbookofthe_forgotten.Name = "Dark Spellbook of the Forgotten"
dark_spellbookofthe_forgotten.Parent = owner.Backpack

local handle = Instance.new("Part")
handle.CFrame = CFrame.fromMatrix(Vector3.new(-30.265790939331055, 6.20592737197876, 10.433175086975098), Vector3.new(1, 0, 0), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1))
handle.Size = Vector3.new(0.8000003099441528, 1.320000171661377, 0.4900045394897461)
handle.Size = Vector3.new(0.8000003099441528, 1.320000171661377, 0.4900045394897461)
handle.Name = "Handle"
handle.Parent = dark_spellbookofthe_forgotten

local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "http://www.roblox.com/asset/?id=56343504 "
mesh.TextureId = "http://www.roblox.com/asset/?id=56344296 "
mesh.Scale = Vector3.new(1.5, 1.5, 1.5)
mesh.Parent = handle

local right_grip_attachment = Instance.new("Attachment")
right_grip_attachment.Name = "RightGripAttachment"
right_grip_attachment.Parent = handle

local smoke = Instance.new("ParticleEmitter")
smoke.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(0.666667, 0, 1)), ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))})
smoke.Lifetime = NumberRange.new(2, 2)
smoke.LightEmission = 0.5
smoke.Rate = 50
smoke.RotSpeed = NumberRange.new(-360, 360)
smoke.Rotation = NumberRange.new(-360, 360)
smoke.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 2.5), NumberSequenceKeypoint.new(1, 0)})
smoke.Speed = NumberRange.new(0.5, 0.5)
smoke.SpreadAngle = Vector2.new(720, 720)
smoke.Brightness = 1
smoke.Lifetime = NumberRange.new(2)
smoke.Orientation = Enum.ParticleOrientation.FacingCamera
smoke.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.1, 0), NumberSequenceKeypoint.new(1, 1)})
smoke.EmissionDirection = "Top"
smoke.Shape = Enum.ParticleEmitterShape.Box
smoke.ShapeInOut = "Outward"
smoke.ShapeStyle = "Volume"
smoke.TimeScale = 1
smoke.Texture = "rbxasset://textures/particles/smoke_main.dds"
smoke.Enabled = false
smoke.Name = "Smoke"
smoke.Parent = handle

local book_sound = Instance.new("Sound")
book_sound.SoundId = "http://www.roblox.com/asset/?id=49459858 "
book_sound.Volume = 1
book_sound.Name = "BookSound"
book_sound.Parent = handle

local point_light = Instance.new("PointLight")
point_light.Range = 7
point_light.Brightness = 10
point_light.Color = Color3.new(0.666667, 0, 1)
point_light.Parent = handle
point_light.Enabled = true
point_light.Shadows = false

local effects = Instance.new("Folder")
effects.Name = "Effects"
effects.Parent = dark_spellbookofthe_forgotten

local smoke_2 = Instance.new("ParticleEmitter")
smoke_2.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(0.666667, 0, 1)), ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))})
smoke_2.Lifetime = NumberRange.new(2, 2)
smoke_2.LightEmission = 0.5
smoke_2.Rate = 100
smoke_2.RotSpeed = NumberRange.new(-360, 360)
smoke_2.Rotation = NumberRange.new(-360, 360)
smoke_2.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 2.5), NumberSequenceKeypoint.new(1, 0)})
smoke_2.Speed = NumberRange.new(0.5, 0.5)
smoke_2.SpreadAngle = Vector2.new(720, 720)
smoke_2.Brightness = 1
smoke_2.Lifetime = NumberRange.new(2)
smoke_2.Orientation = Enum.ParticleOrientation.FacingCamera
smoke_2.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.1, 0), NumberSequenceKeypoint.new(1, 1)})
smoke_2.EmissionDirection = "Top"
smoke_2.Shape = Enum.ParticleEmitterShape.Box
smoke_2.ShapeInOut = "Outward"
smoke_2.ShapeStyle = "Volume"
smoke_2.TimeScale = 1
smoke_2.Texture = "rbxasset://textures/particles/smoke_main.dds"
smoke_2.Name = "Smoke"
smoke_2.Enabled = false
smoke_2.Parent = effects

local client_input = Instance.new("RemoteEvent")
client_input.Name = "ClientInput"
client_input.Parent = dark_spellbookofthe_forgotten

local mouse_loc = Instance.new("RemoteFunction")
mouse_loc.Name = "MouseLoc"
mouse_loc.Parent = dark_spellbookofthe_forgotten

local spell_gui = Instance.new("ScreenGui")
spell_gui.IgnoreGuiInset = false
spell_gui.ResetOnSpawn = true
spell_gui.ZIndexBehavior = Enum.ZIndexBehavior.Global
spell_gui.Name = "SpellGui"
spell_gui.Parent = dark_spellbookofthe_forgotten

local spell_gui_frame = Instance.new("Frame")
spell_gui_frame.BackgroundTransparency = 1
spell_gui_frame.Position = UDim2.new(0, 0, 0.349999994, 0)
spell_gui_frame.Size = UDim2.new(0, 70, 0, 210)
spell_gui_frame.Visible = true
spell_gui_frame.Name = "SpellGuiFrame"
spell_gui_frame.Parent = spell_gui

local orb = Instance.new("ImageButton")
orb.Image = "rbxassetid://56465749"
orb.BorderSizePixel = 0
orb.Size = UDim2.new(0, 64, 0, 64)
orb.Visible = true
orb.Name = "Orb"
orb.Parent = spell_gui_frame

local flavor = Instance.new("TextLabel")
flavor.Font = Enum.Font.SourceSans
flavor.Text = "Onica Orb"
flavor.TextColor3 = Color3.new(0, 0, 0)
flavor.TextScaled = true
flavor.TextSize = 14
flavor.TextWrapped = true
flavor.AnchorPoint = Vector2.new(0, 0.5)
flavor.BackgroundColor3 = Color3.new(0.666667, 0.333333, 1)
flavor.BorderSizePixel = 0
flavor.Position = UDim2.new(1, 0, 0.5, 0)
flavor.Size = UDim2.new(2, 0, 0.5, 0)
flavor.Visible = false
flavor.Name = "Flavor"
flavor.Parent = orb

local overlay = Instance.new("TextLabel")
overlay.Font = Enum.Font.Arial
overlay.Text = "Q"
overlay.TextColor3 = Color3.new(1, 1, 1)
overlay.TextScaled = true
overlay.TextSize = 14
overlay.TextTransparency = 0.5
overlay.TextWrapped = true
overlay.AnchorPoint = Vector2.new(0.5, 0.5)
overlay.BackgroundTransparency = 1
overlay.Position = UDim2.new(0.5, 0, 0.5, 0)
overlay.Size = UDim2.new(0.5, 0, 0.5, 0)
overlay.Visible = true
overlay.ZIndex = 3
overlay.Name = "Overlay"
overlay.Parent = orb

local root = Instance.new("ImageButton")
root.Image = "rbxassetid://56465796"
root.BorderSizePixel = 0
root.Position = UDim2.new(0, 0, 0, 70)
root.Size = UDim2.new(0, 64, 0, 64)
root.Visible = true
root.Name = "Root"
root.Parent = spell_gui_frame

local flavor_2 = Instance.new("TextLabel")
flavor_2.Font = Enum.Font.SourceSans
flavor_2.Text = "Speicla Spikes"
flavor_2.TextColor3 = Color3.new(0, 0, 0)
flavor_2.TextScaled = true
flavor_2.TextSize = 14
flavor_2.TextWrapped = true
flavor_2.AnchorPoint = Vector2.new(0, 0.5)
flavor_2.BackgroundColor3 = Color3.new(0.666667, 0.333333, 1)
flavor_2.BorderSizePixel = 0
flavor_2.Position = UDim2.new(1, 0, 0.5, 0)
flavor_2.Size = UDim2.new(2, 0, 0.5, 0)
flavor_2.Visible = false
flavor_2.Name = "Flavor"
flavor_2.Parent = root

local overlay_2 = Instance.new("TextLabel")
overlay_2.Font = Enum.Font.Arial
overlay_2.Text = "E"
overlay_2.TextColor3 = Color3.new(1, 1, 1)
overlay_2.TextScaled = true
overlay_2.TextSize = 14
overlay_2.TextTransparency = 0.5
overlay_2.TextWrapped = true
overlay_2.AnchorPoint = Vector2.new(0.5, 0.5)
overlay_2.BackgroundTransparency = 1
overlay_2.Position = UDim2.new(0.5, 0, 0.5, 0)
overlay_2.Size = UDim2.new(0.5, 0, 0.5, 0)
overlay_2.Visible = true
overlay_2.ZIndex = 3
overlay_2.Name = "Overlay"
overlay_2.Parent = root

local stun = Instance.new("ImageButton")
stun.Image = "rbxassetid://56465831"
stun.BorderSizePixel = 0
stun.Position = UDim2.new(0, 0, 0, 140)
stun.Size = UDim2.new(0, 64, 0, 64)
stun.Visible = true
stun.Name = "Stun"
stun.Parent = spell_gui_frame

local flavor_3 = Instance.new("TextLabel")
flavor_3.Font = Enum.Font.SourceSans
flavor_3.Text = "Fontican Freeze"
flavor_3.TextColor3 = Color3.new(0, 0, 0)
flavor_3.TextScaled = true
flavor_3.TextSize = 14
flavor_3.TextWrapped = true
flavor_3.AnchorPoint = Vector2.new(0, 0.5)
flavor_3.BackgroundColor3 = Color3.new(0.666667, 0.333333, 1)
flavor_3.BorderSizePixel = 0
flavor_3.Position = UDim2.new(1, 0, 0.5, 0)
flavor_3.Size = UDim2.new(2, 0, 0.5, 0)
flavor_3.Visible = false
flavor_3.Name = "Flavor"
flavor_3.Parent = stun

local overlay_3 = Instance.new("TextLabel")
overlay_3.Font = Enum.Font.Arial
overlay_3.Text = "R"
overlay_3.TextColor3 = Color3.new(1, 1, 1)
overlay_3.TextScaled = true
overlay_3.TextSize = 14
overlay_3.TextTransparency = 0.5
overlay_3.TextWrapped = true
overlay_3.AnchorPoint = Vector2.new(0.5, 0.5)
overlay_3.BackgroundTransparency = 1
overlay_3.Position = UDim2.new(0.5, 0, 0.5, 0)
overlay_3.Size = UDim2.new(0.5, 0, 0.5, 0)
overlay_3.Visible = true
overlay_3.ZIndex = 3
overlay_3.Name = "Overlay"
overlay_3.Parent = stun

local book_anim_r6 = Instance.new("Animation")
book_anim_r6.AnimationId = "http://www.roblox.com/Asset?ID=49456429"
book_anim_r6.Name = "BookAnimR6"
book_anim_r6.Parent = dark_spellbookofthe_forgotten

local book_anim_r15 = Instance.new("Animation")
book_anim_r15.AnimationId = "rbxassetid://857260048"
book_anim_r15.Name = "BookAnimR15"
book_anim_r15.Parent = dark_spellbookofthe_forgotten

local Server = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/DarkSpellbookoftheForgotten/Server.lua", "server", dark_spellbookofthe_forgotten)
Server.Name = "Server"

local Client = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/DarkSpellbookoftheForgotten/Client.lua", "local", dark_spellbookofthe_forgotten)
Client.Name = "Client"

local MouseIcon = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/DarkSpellbookoftheForgotten/MouseIcon.lua", "local", dark_spellbookofthe_forgotten)
MouseIcon.Name = "MouseIcon"