local fakeOwner : Player = owner

if owner then
	owner = owner or fakeOwner
end

MisL = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/MisL/main/source.lua"))()

local grimgold_periastron = Instance.new("Tool")
grimgold_periastron.Grip = CFrame.fromMatrix(Vector3.new(0, 0, -2), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1), Vector3.new(1, 0, 0))
grimgold_periastron.GripForward = Vector3.new(-1, -0, -0)
grimgold_periastron.GripPos = Vector3.new(0, 0, -2)
grimgold_periastron.GripRight = Vector3.new(0, 1, 0)
grimgold_periastron.GripUp = Vector3.new(0, 0, 1)
grimgold_periastron.ToolTip = "SONAR Seeking"
grimgold_periastron.TextureId = "rbxassetid://73819915"
grimgold_periastron.WorldPivot = CFrame.fromMatrix(Vector3.new(-23.600088119506836, 3.7000010013580322, 0), Vector3.new(0.7113149166107178, -0.7028734683990479, 3.072357657174507e-08), Vector3.new(0, -4.371138828673793e-08, -1), Vector3.new(0.7028734683990479, 0.7113149166107178, -3.109256141442529e-08))
grimgold_periastron.Name = "GrimgoldPeriastron"
grimgold_periastron.Parent = fakeOwner.Backpack

local animations = Instance.new("Folder")
animations.Name = "Animations"
animations.Parent = grimgold_periastron

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

local handle = Instance.new("Part")
handle.BottomSurface = Enum.SurfaceType.Smooth
handle.BrickColor = BrickColor.new(0.38823533058166504, 0.37254902720451355, 0.38431376218795776)
handle.CFrame = CFrame.fromMatrix(Vector3.new(-33.413246154785156, 20.604116439819336, -19.00394058227539), Vector3.new(0.7113149166107178, -0.7028734683990479, 3.072357657174507e-08), Vector3.new(0, -4.371138828673793e-08, -1), Vector3.new(0.7028734683990479, 0.7113149166107178, -3.109256141442529e-08))
handle.Color = Color3.new(0.388235, 0.372549, 0.384314)
handle.Locked = true
handle.Orientation = Vector3.new(-45.34000015258789, 90, -90)
handle.Reflectance = 0.4000000059604645
handle.Rotation = Vector3.new(-90, 44.65999984741211, 0)
handle.Size = Vector3.new(1, 0.6000000238418579, 5.19999885559082)
handle.TopSurface = Enum.SurfaceType.Smooth
handle.Size = Vector3.new(1, 0.6000000238418579, 5.19999885559082)
handle.Name = "Handle"
handle.Parent = grimgold_periastron

local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "http://www.roblox.com/asset/?id=80557857"
mesh.TextureId = "rbxassetid://73816926"
mesh.Parent = handle

local sparkles = Instance.new("Sparkles")
sparkles.Color = Color3.new(1.77083, 6.8, 0)
sparkles.SparkleColor = Color3.new(1, 0.666667, 0)
sparkles.Parent = handle

local point_light = Instance.new("PointLight")
point_light.Range = 10
point_light.Brightness = 10
point_light.Color = Color3.new(1, 0.666667, 0)
point_light.Parent = handle

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
trail.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(1, 0.666667, 0)), ColorSequenceKeypoint.new(1, Color3.new(1, 0.666667, 0))})
trail.Lifetime = 1
trail.LightEmission = 1
trail.MinLength = 0
trail.Parent = handle
trail.Enabled = false

local slashsound = Instance.new("Sound")
slashsound.SoundId = "rbxassetid://12222216"
slashsound.Volume = 0.6000000238418579
slashsound.Name = "SlashSound"
slashsound.Parent = handle

local lunge_sound = Instance.new("Sound")
lunge_sound.SoundId = "rbxassetid://701269479"
lunge_sound.Volume = 1
lunge_sound.Name = "LungeSound"
lunge_sound.Parent = handle

local sonarinitiate = Instance.new("Sound")
sonarinitiate.SoundId = "http://www.roblox.com/asset/?id=79102486"
sonarinitiate.Volume = 2
sonarinitiate.Name = "SONARInitiate"
sonarinitiate.Parent = handle

local right_grip_attachment = Instance.new("Attachment")
right_grip_attachment.Axis = Vector3.new(0, 1, 0)
right_grip_attachment.SecondaryAxis = Vector3.new(0, 0, 1)
right_grip_attachment.Visible = false
right_grip_attachment.Name = "RightGripAttachment"
right_grip_attachment.Parent = handle

local mouse_input = Instance.new("RemoteFunction")
mouse_input.Name = "MouseInput"
mouse_input.Parent = grimgold_periastron

local normal_grip = Instance.new("CFrameValue")
normal_grip.Value = CFrame.fromMatrix(Vector3.new(0, 0, -2), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1), Vector3.new(1, 0, 0))
normal_grip.Name = "NormalGrip"
normal_grip.Parent = grimgold_periastron

local Server = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/GrimgoldPeriastron/Server.lua", "server", grimgold_periastron)
Server.Name = "Server"

local Client = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/GrimgoldPeriastron/Client.lua", "local", grimgold_periastron)
Client.Name = "Client"

local MouseIcon = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/GrimgoldPeriastron/MouseIcon.lua", "local", grimgold_periastron)
MouseIcon.Name = "MouseIcon"