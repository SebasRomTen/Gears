if owner then
	owner = owner
end

local Azure_Periastron = Instance.new("Tool")
Azure_Periastron.Grip = CFrame.fromMatrix(Vector3.new(0, 0, -2), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1), Vector3.new(1, 0, 0))
Azure_Periastron.GripForward = Vector3.new(-1, -0, -0)
Azure_Periastron.GripPos = Vector3.new(0, 0, -2)
Azure_Periastron.GripRight = Vector3.new(0, 1, 0)
Azure_Periastron.GripUp = Vector3.new(0, 0, 1)
Azure_Periastron.ToolTip = "Parry with this Peri (get it?)"
Azure_Periastron.TextureId = "rbxassetid://69464495"
Azure_Periastron.WorldPivot = CFrame.fromMatrix(Vector3.new(-29.237085342407227, 6.317093849182129, -58.41712951660156), Vector3.new(0.7113149166107178, -0.7028734683990479, 3.072357657174507e-08), Vector3.new(0, -4.371138828673793e-08, -1), Vector3.new(0.7028734683990479, 0.7113149166107178, -3.109256141442529e-08))
Azure_Periastron.Name = "AzurePeriastron"
Azure_Periastron.Parent = owner.Backpack

MisL = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/MisL/main/source.lua"))()

local animations = Instance.new("Folder")
animations.Name = "Animations"
animations.Parent = Azure_Periastron

local r6 = Instance.new("Folder")
r6.Name = "R6"
r6.Parent = animations

local right_slash = Instance.new("Animation")
right_slash.AnimationId = "http://www.roblox.com/Asset?ID=54611484"
right_slash.Name = "RightSlash"
right_slash.Parent = r6

local slash = Instance.new("Animation")
slash.AnimationId = "http://www.roblox.com/Asset?ID=54432537"
slash.Name = "Slash"
slash.Parent = r6

local slash_anim = Instance.new("Animation")
slash_anim.AnimationId = "http://www.roblox.com/Asset?ID=63718551"
slash_anim.Name = "SlashAnim"
slash_anim.Parent = r6

local counter_attack = Instance.new("Animation")
counter_attack.AnimationId = "rbxassetid://186934658"
counter_attack.Name = "CounterAttack"
counter_attack.Parent = r6

local sword_holster_anim = Instance.new("Animation")
sword_holster_anim.AnimationId = "rbxassetid://71409978"
sword_holster_anim.Name = "SwordHolsterAnim"
sword_holster_anim.Parent = r6

local r15 = Instance.new("Folder")
r15.Name = "R15"
r15.Parent = animations

local right_slash_2 = Instance.new("Animation")
right_slash_2.AnimationId = "rbxassetid://2410679501"
right_slash_2.Name = "RightSlash"
right_slash_2.Parent = r15

local slash_2 = Instance.new("Animation")
slash_2.AnimationId = "rbxassetid://2441858691"
slash_2.Name = "Slash"
slash_2.Parent = r15

local slash_anim_2 = Instance.new("Animation")
slash_anim_2.AnimationId = "rbxassetid://2443689022"
slash_anim_2.Name = "SlashAnim"
slash_anim_2.Parent = r15

local counter_attack_2 = Instance.new("Animation")
counter_attack_2.AnimationId = "rbxassetid://2524287767"
counter_attack_2.Name = "CounterAttack"
counter_attack_2.Parent = r15

local sword_holster_anim_2 = Instance.new("Animation")
sword_holster_anim_2.AnimationId = "rbxassetid://2524329075"
sword_holster_anim_2.Name = "SwordHolsterAnim"
sword_holster_anim_2.Parent = r15

local back_grip = Instance.new("CFrameValue")
back_grip.Value = CFrame.fromMatrix(Vector3.new(0.7272091507911682, -0.7834882736206055, 0.9272100329399109), Vector3.new(0.7071066498756409, -5.212530113724229e-16, -0.70710688829422), Vector3.new(-5.4788113601489385e-08, -0.9999998807907104, -5.478809939063467e-08), Vector3.new(-0.70710688829422, 7.748207053737133e-08, -0.7071066498756409))
back_grip.Name = "BackGrip"
back_grip.Parent = Azure_Periastron

local normal_grip = Instance.new("CFrameValue")
normal_grip.Value = CFrame.fromMatrix(Vector3.new(0, 0, -2), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1), Vector3.new(1, 0, 0))
normal_grip.Name = "NormalGrip"
normal_grip.Parent = Azure_Periastron

local variables = Instance.new("Configuration")
variables.Name = "Variables"
variables.Parent = Azure_Periastron

local tool_anim = Instance.new("BoolValue")
tool_anim.Value = true
tool_anim.Name = "ToolAnim"
tool_anim.Parent = variables

local invincible_visuals = Instance.new("Folder")
invincible_visuals.Name = "InvincibleVisuals"
invincible_visuals.Parent = Azure_Periastron

local tint = Instance.new("ParticleEmitter")
tint.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(0, 0.666667, 1)), ColorSequenceKeypoint.new(1, Color3.new(0, 0.333333, 1))})
tint.Lifetime = NumberRange.new(0.10000000149011612, 0.10000000149011612)
tint.LightEmission = 1
tint.LockedToPart = true
tint.Rate = 60
tint.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 10), NumberSequenceKeypoint.new(1, 10)})
tint.Speed = NumberRange.new(1, 1)
tint.SpreadAngle = Vector2.new(0, 360)
tint.Texture = "rbxassetid://214269134"
tint.Name = "Tint"
tint.Parent = invincible_visuals
tint.Enabled = false

local ray = Instance.new("ParticleEmitter")
ray.Lifetime = NumberRange.new(0.20000000298023224, 0.20000000298023224)
ray.LightEmission = 1
ray.LockedToPart = true
ray.Rate = 100
ray.Rotation = NumberRange.new(0, 360)
ray.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 3), NumberSequenceKeypoint.new(1, 10)})
ray.Speed = NumberRange.new(0, 0)
ray.Texture = "rbxassetid://243660364"
ray.VelocityInheritance = 1
ray.Name = "Ray"
ray.Parent = invincible_visuals
ray.Enabled = false

local sparkle = Instance.new("ParticleEmitter")
sparkle.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(0, 0.666667, 1)), ColorSequenceKeypoint.new(1, Color3.new(0, 0.333333, 1))})
sparkle.Lifetime = NumberRange.new(0.10000000149011612, 0.10000000149011612)
sparkle.LightEmission = 1
sparkle.LockedToPart = true
sparkle.Rate = 60
sparkle.Rotation = NumberRange.new(0, 360)
sparkle.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 10), NumberSequenceKeypoint.new(1, 10)})
sparkle.Speed = NumberRange.new(1, 1)
sparkle.SpreadAngle = Vector2.new(0, 360)
sparkle.Texture = "rbxassetid://243728166"
sparkle.Name = "Sparkle"
sparkle.Parent = invincible_visuals
sparkle.Enabled = false

local handle = Instance.new("Part")
handle.BottomSurface = Enum.SurfaceType.Smooth
handle.BrickColor = BrickColor.new(0.38823533058166504, 0.37254902720451355, 0.38431376218795776)
handle.CFrame = CFrame.fromMatrix(Vector3.new(-29.237085342407227, 6.317093849182129, -58.41712951660156), Vector3.new(0.7113149166107178, -0.7028734683990479, 3.072357657174507e-08), Vector3.new(0, -4.371138828673793e-08, -1), Vector3.new(0.7028734683990479, 0.7113149166107178, -3.109256141442529e-08))
handle.Color = Color3.new(0.388235, 0.372549, 0.384314)
handle.Locked = true
handle.Orientation = Vector3.new(-45.34000015258789, 90, -90)
handle.Reflectance = 0.4000000059604645
handle.Rotation = Vector3.new(-90, 44.65999984741211, 0)
handle.Size = Vector3.new(1, 0.6000000238418579, 5.19999885559082)
handle.TopSurface = Enum.SurfaceType.Smooth
handle.Size = Vector3.new(1, 0.6000000238418579, 5.19999885559082)
handle.Name = "Handle"
handle.Parent = Azure_Periastron

local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "http://www.roblox.com/asset/?id=80557857"
mesh.TextureId = "rbxassetid://69464238"
mesh.Parent = handle

local sparkles = Instance.new("Sparkles")
sparkles.Color = Color3.new(0, 3.4, 1)
sparkles.SparkleColor = Color3.new(0, 0.333333, 1)
sparkles.Parent = handle

local point_light = Instance.new("PointLight")
point_light.Range = 10
point_light.Brightness = 10
point_light.Color = Color3.new(0, 0.333333, 1)
point_light.Parent = handle

local toptrail = Instance.new("Attachment")
toptrail.Visible = false
toptrail.Name = "TopTrail"
toptrail.Parent = handle

local bottom_trail = Instance.new("Attachment")
bottom_trail.Visible = false
bottom_trail.Name = "BottomTrail"
bottom_trail.Parent = handle

local flash_circle = Instance.new("ParticleEmitter")
flash_circle.Lifetime = NumberRange.new(0.4000000059604645, 0.4000000059604645)
flash_circle.LightEmission = 1
flash_circle.LockedToPart = true
flash_circle.Rate = 1
flash_circle.Rotation = NumberRange.new(0, 135)
flash_circle.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 2), NumberSequenceKeypoint.new(1, 3)})
flash_circle.Speed = NumberRange.new(0, 0)
flash_circle.SpreadAngle = Vector2.new(0, 360)
flash_circle.Texture = "rbxassetid://483229625"
flash_circle.VelocityInheritance = 1
flash_circle.Name = "FlashCircle"
flash_circle.Parent = bottom_trail
flash_circle.Enabled = false

local star_flash = Instance.new("ParticleEmitter")
star_flash.Lifetime = NumberRange.new(0.4000000059604645, 0.4000000059604645)
star_flash.LightEmission = 1
star_flash.LockedToPart = true
star_flash.Rate = 1
star_flash.RotSpeed = NumberRange.new(360, 360)
star_flash.Rotation = NumberRange.new(-180, 180)
star_flash.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 3.5), NumberSequenceKeypoint.new(0.5, 10), NumberSequenceKeypoint.new(1, 3)})
star_flash.Speed = NumberRange.new(0, 0)
star_flash.SpreadAngle = Vector2.new(0, 360)
star_flash.Texture = "rbxassetid://1141830599"
star_flash.VelocityInheritance = 1
star_flash.Name = "StarFlash"
star_flash.Parent = bottom_trail
star_flash.Enabled = false

local heart_rate_line = Instance.new("ParticleEmitter")
heart_rate_line.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(0, 0.666667, 1)), ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))})
heart_rate_line.Lifetime = NumberRange.new(1, 1)
heart_rate_line.LightEmission = 1
heart_rate_line.LightInfluence = 1
heart_rate_line.Rate = 1
heart_rate_line.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.10000000149011612, 10), NumberSequenceKeypoint.new(0.20000000298023224, 0), NumberSequenceKeypoint.new(1, 0)})
heart_rate_line.Speed = NumberRange.new(0, 0)
heart_rate_line.Texture = "rbxassetid://878492795"
heart_rate_line.Name = "HeartRateLine"
heart_rate_line.Parent = bottom_trail
heart_rate_line.Enabled = false

local trail = Instance.new("Trail")
trail.Attachment0 = toptrail
trail.Attachment1 = bottom_trail
trail.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(0, 0.333333, 1)), ColorSequenceKeypoint.new(1, Color3.new(0, 0.333333, 1))})
trail.Lifetime = 1
trail.LightEmission = 1
trail.MinLength = 0
trail.Parent = handle

local counter_ready = Instance.new("Sound")
counter_ready.SoundId = "rbxassetid://54516144"
counter_ready.Volume = 1
counter_ready.Name = "CounterReady"
counter_ready.Parent = handle

local counterclash = Instance.new("Sound")
counterclash.SoundId = "rbxassetid://878211907"
counterclash.Volume = 2
counterclash.Name = "CounterClash"
counterclash.Parent = handle

local counter_slash = Instance.new("Sound")
counter_slash.SoundId = "rbxassetid://990415387"
counter_slash.TimePosition = 0.1
counter_slash.Volume = 3
counter_slash.Name = "CounterSlash"
counter_slash.Parent = handle

local lunge_sound = Instance.new("Sound")
lunge_sound.SoundId = "rbxassetid://701269479"
lunge_sound.Volume = 1
lunge_sound.Name = "LungeSound"
lunge_sound.Parent = handle

local slashsound = Instance.new("Sound")
slashsound.SoundId = "rbxassetid://12222216"
slashsound.Volume = 0.6000000238418579
slashsound.Name = "SlashSound"
slashsound.Parent = handle

local right_grip_attachment = Instance.new("Attachment")
right_grip_attachment.Axis = Vector3.new(0, 1, 0)
right_grip_attachment.SecondaryAxis = Vector3.new(0, 0, 1)
right_grip_attachment.Visible = false
right_grip_attachment.Name = "RightGripAttachment"
right_grip_attachment.Parent = handle

local mouse_input = Instance.new("RemoteFunction")
mouse_input.Name = "MouseInput"
mouse_input.Parent = Azure_Periastron

local Server = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/AzurePeriastron/Server.lua", "server", Azure_Periastron)
Server.Name = "Server"

local Client = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/AzurePeriastron/Client.lua", "local", Azure_Periastron)
Client.Name = "Client"

local MouseIcon = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/AzurePeriastron/MouseIcon.lua", "local", Azure_Periastron)
MouseIcon.Name = "MouseIcon"
