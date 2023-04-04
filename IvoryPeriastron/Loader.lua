if owner then
	owner = owner
end

MisL = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/MisL/main/source.lua"))()

local ivory_periastron = Instance.new("Tool")
ivory_periastron.Grip = CFrame.fromMatrix(Vector3.new(0, 0, -2), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1), Vector3.new(1, 0, 0))
ivory_periastron.GripForward = Vector3.new(-1, -0, -0)
ivory_periastron.GripPos = Vector3.new(0, 0, -2)
ivory_periastron.GripRight = Vector3.new(0, 1, 0)
ivory_periastron.GripUp = Vector3.new(0, 0, 1)
ivory_periastron.ToolTip = "Supernova"
ivory_periastron.TextureId = "rbxassetid://108137249"
ivory_periastron.WorldPivot = CFrame.fromMatrix(Vector3.new(-3.810089111328125, 2.8200008869171143, 17.100000381469727), Vector3.new(0.7113149166107178, -0.7028734683990479, 3.072357657174507e-08), Vector3.new(0, -4.371138828673793e-08, -1), Vector3.new(0.7028734683990479, 0.7113149166107178, -3.109256141442529e-08))
ivory_periastron.Name = "IvoryPeriastron"
ivory_periastron.Parent = owner.Backpack

local animations = Instance.new("Folder")
animations.Name = "Animations"
animations.Parent = ivory_periastron

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

local throw = Instance.new("Animation")
throw.AnimationId = "rbxassetid://2459110596"
throw.Name = "Throw"
throw.Parent = r6

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

local throw_2 = Instance.new("Animation")
throw_2.AnimationId = "rbxassetid://2459124514"
throw_2.Name = "Throw"
throw_2.Parent = r15

local handle = Instance.new("Part")
handle.BottomSurface = Enum.SurfaceType.Smooth
handle.BrickColor = BrickColor.new(0.38823533058166504, 0.37254902720451355, 0.38431376218795776)
handle.CFrame = CFrame.fromMatrix(Vector3.new(-43.57436752319336, 23.5749568939209, -50.346004486083984), Vector3.new(0.7113149166107178, -0.7028734683990479, 3.072357657174507e-08), Vector3.new(0, -4.371138828673793e-08, -1), Vector3.new(0.7028734683990479, 0.7113149166107178, -3.109256141442529e-08))
handle.Color = Color3.new(0.388235, 0.372549, 0.384314)
handle.Locked = true
handle.Orientation = Vector3.new(-45.34000015258789, 90, -90)
handle.Reflectance = 0.4000000059604645
handle.Rotation = Vector3.new(-90, 44.65999984741211, 0)
handle.Size = Vector3.new(1, 0.6000000238418579, 5.19999885559082)
handle.TopSurface = Enum.SurfaceType.Smooth
handle.Size = Vector3.new(1, 0.6000000238418579, 5.19999885559082)
handle.Name = "Handle"
handle.Parent = ivory_periastron

local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "http://www.roblox.com/asset/?id=80557857"
mesh.TextureId = "rbxassetid://108134401"
mesh.Parent = handle

local sparkles = Instance.new("Sparkles")
sparkles.Color = Color3.new(1.77083, 10.2, 1)
sparkles.SparkleColor = Color3.new(1, 1, 1)
sparkles.Parent = handle

local point_light = Instance.new("PointLight")
point_light.Range = 10
point_light.Brightness = 10
point_light.Parent = handle

local toptrail = Instance.new("Attachment")
toptrail.Visible = false
toptrail.Name = "TopTrail"
toptrail.Parent = handle

local bottom_trail = Instance.new("Attachment")
bottom_trail.Visible = false
bottom_trail.Name = "BottomTrail"
bottom_trail.Parent = handle

local trail = Instance.new("Trail")
trail.Attachment0 = toptrail
trail.Attachment1 = bottom_trail
trail.Lifetime = 1
trail.LightEmission = 1
trail.MinLength = 0
trail.Parent = handle

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

local shockwave = Instance.new("Sound")
shockwave.SoundId = "rbxassetid://416295853"
shockwave.Volume = 0.6000000238418579
shockwave.Name = "Shockwave"
shockwave.Parent = handle

local phase_in = Instance.new("Sound")
phase_in.SoundId = "rbxassetid://97272128"
phase_in.Volume = 0.6000000238418579
phase_in.Name = "PhaseIn"
phase_in.Parent = handle

local right_grip_attachment = Instance.new("Attachment")
right_grip_attachment.Axis = Vector3.new(0, 1, 0)
right_grip_attachment.SecondaryAxis = Vector3.new(0, 0, 1)
right_grip_attachment.Visible = false
right_grip_attachment.Name = "RightGripAttachment"
right_grip_attachment.Parent = handle

local mouse_input = Instance.new("RemoteFunction")
mouse_input.Name = "MouseInput"
mouse_input.Parent = ivory_periastron

local normal_grip = Instance.new("CFrameValue")
normal_grip.Value = CFrame.fromMatrix(Vector3.new(0, 0, -2), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1), Vector3.new(1, 0, 0))
normal_grip.Name = "NormalGrip"
normal_grip.Parent = ivory_periastron

local Server = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/IvoryPeriastron/Server.lua", "server", ivory_periastron)
Server.Name = "Server"

local Client = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/IvoryPeriastron/Client.lua", "local", ivory_periastron)
Client.Name = "Client"

local MouseIcon = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/IvoryPeriastron/MouseIcon.lua", "local", ivory_periastron)
MouseIcon.Name = "MouseIcon"