if owner then
	owner = owner
end

MisL = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/MisL/main/source.lua"))()

local noir_periastron = Instance.new("Tool")
noir_periastron.Grip = CFrame.fromMatrix(Vector3.new(0, 0, -2), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1), Vector3.new(1, 0, 0))
noir_periastron.GripForward = Vector3.new(-1, -0, -0)
noir_periastron.GripPos = Vector3.new(0, 0, -2)
noir_periastron.GripRight = Vector3.new(0, 1, 0)
noir_periastron.GripUp = Vector3.new(0, 0, 1)
noir_periastron.ToolTip = "Nocturne Noir"
noir_periastron.TextureId = "http://www.roblox.com/asset?id=120527983"
noir_periastron.WorldPivot = CFrame.fromMatrix(Vector3.new(-3.980088949203491, 2.590001106262207, 9.859999656677246), Vector3.new(0.7113149166107178, -0.7028734683990479, 3.072357657174507e-08), Vector3.new(0, -4.371138828673793e-08, -1), Vector3.new(0.7028734683990479, 0.7113149166107178, -3.109256141442529e-08))
noir_periastron.Name = "NoirPeriastron"
noir_periastron.Parent = owner.Backpack

local handle = Instance.new("Part")
handle.CFrame = CFrame.fromMatrix(Vector3.new(-22.18857192993164, 17.601654052734375, -62.234405517578125), Vector3.new(0.7113149166107178, -0.7028734683990479, 3.072357657174507e-08), Vector3.new(0, -4.371138828673793e-08, -1), Vector3.new(0.7028734683990479, 0.7113149166107178, -3.109256141442529e-08))
handle.Orientation = Vector3.new(-45.34000015258789, 90, -90)
handle.Rotation = Vector3.new(-90, 44.65999984741211, 0)
handle.Size = Vector3.new(0.7800007462501526, 0.5199999809265137, 5.160000324249268)
handle.Size = Vector3.new(0.7800007462501526, 0.5199999809265137, 5.160000324249268)
handle.Name = "Handle"
handle.Parent = noir_periastron

local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "http://www.roblox.com/asset?id=69464145"
mesh.TextureId = "http://www.roblox.com/asset/?id=119889819"
mesh.Parent = handle

local sparkles = Instance.new("Sparkles")
sparkles.Color = Color3.new(0, 0, 0)
sparkles.SparkleColor = Color3.new(0, 0, 0)
sparkles.Parent = handle

local point_light = Instance.new("PointLight")
point_light.Range = 10
point_light.Brightness = 10
point_light.Color = Color3.new(0.313726, 0.313726, 0.313726)
point_light.Parent = handle

local LightningChange = MisL.newScript([[

local Handle = script.Parent

local Light = Handle:WaitForChild("PointLight",10)

local Sparkles = Handle:WaitForChild("Sparkles",10)

Sparkles.Changed:Connect(function(property)
	Light.Enabled = Sparkles.Enabled
end)

]], "server", handle)
LightningChange.Name = "LightningChange"

local toptrail = Instance.new("Attachment")
toptrail.CFrame = toptrail.CFrame * CFrame.new(0, 0, 2.5)
toptrail.Visible = false
toptrail.Name = "TopTrail"
toptrail.Parent = handle

local bottom_trail = Instance.new("Attachment")
bottom_trail.CFrame = bottom_trail.CFrame * CFrame.new(0, 0, -.7)
bottom_trail.Visible = false
bottom_trail.Name = "BottomTrail"
bottom_trail.Parent = handle

local trail = Instance.new("Trail")
trail.Attachment0 = toptrail
trail.Attachment1 = bottom_trail
trail.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)), ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0))})
trail.Lifetime = 1
trail.MinLength = 0
trail.Parent = handle
trail.Enabled = false

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

local lights_out_sound = Instance.new("Sound")
lights_out_sound.SoundId = "http://www.roblox.com/asset/?id=120550472"
lights_out_sound.Volume = 1
lights_out_sound.Name = "LightsOutSound"
lights_out_sound.Parent = noir_periastron

local input = Instance.new("RemoteEvent")
input.Name = "Input"
input.Parent = noir_periastron

local animations = Instance.new("Folder")
animations.Name = "Animations"
animations.Parent = noir_periastron

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

local mouse_input = Instance.new("RemoteFunction")
mouse_input.Name = "MouseInput"
mouse_input.Parent = noir_periastron

local Script = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/NoirPeriastron/Script.lua", "server", noir_periastron)
Script.Name = "Script"

local SwordScript = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/NoirPeriastron/SwordScript.lua", "server", noir_periastron)
SwordScript.Name = "SwordScript"

local InputScript = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/NoirPeriastron/InputScript.lua", "local", noir_periastron)
InputScript.Name = "InputScript"

local LocalGui = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/NoirPeriastron/LocalGui.lua", "local", noir_periastron)
LocalGui.Name = "LocalGui"