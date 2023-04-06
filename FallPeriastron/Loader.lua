local fakeOwner : Player = owner

if owner then
	owner = owner or fakeOwner
end

MisL = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/MisL/main/source.lua"))()

local fall_periastron = Instance.new("Tool")
fall_periastron.Grip = CFrame.fromMatrix(Vector3.new(4.769951544858486e-09, -2, 7.771234535295811e-16), Vector3.new(1, 1.1924880638503055e-08, 1.6292067073209182e-07), Vector3.new(-1.1924880638503055e-08, 1, -1.942809401447561e-15), Vector3.new(-1.6292067073209182e-07, 0, 1))
fall_periastron.GripForward = Vector3.new(1.6292067073209182e-07, -0, -1)
fall_periastron.GripPos = Vector3.new(4.769951544858486e-09, -2, 7.771234535295811e-16)
fall_periastron.GripRight = Vector3.new(1, 1.1924880638503055e-08, 1.6292067073209182e-07)
fall_periastron.GripUp = Vector3.new(-1.1924880638503055e-08, 1, -1.942809401447561e-15)
fall_periastron.ToolTip = "There seems to be a breeze today huh?"
fall_periastron.TextureId = "rbxassetid://1145496089"
fall_periastron.WorldPivot = CFrame.fromMatrix(Vector3.new(19.5, 14.400001525878906, 36), Vector3.new(0, 0, 1), Vector3.new(0.7028737664222717, 0.7113147377967834, 0), Vector3.new(-0.7113147377967834, 0.7028737664222717, 0))
fall_periastron.Name = "FallPeriastron"
fall_periastron.Parent = fakeOwner.Backpack

local handle = Instance.new("Part")
handle.BottomSurface = Enum.SurfaceType.Smooth
handle.BrickColor = BrickColor.new(0.38823533058166504, 0.37254902720451355, 0.38431376218795776)
handle.CFrame = CFrame.fromMatrix(Vector3.new(-32.811614990234375, 24.89215850830078, 26.549028396606445), Vector3.new(0, 0, 1), Vector3.new(0.7028737664222717, 0.7113147377967834, 0), Vector3.new(-0.7113147377967834, 0.7028737664222717, 0))
handle.Color = Color3.new(0.388235, 0.372549, 0.384314)
handle.Orientation = Vector3.new(-44.65999984741211, -90, 0)
handle.Reflectance = 0.4000000059604645
handle.Rotation = Vector3.new(-90, -45.34000015258789, -90)
handle.Size = Vector3.new(0.6000000238418579, 5.199999809265137, 1)
handle.TopSurface = Enum.SurfaceType.Smooth
handle.Size = Vector3.new(0.6000000238418579, 5.199999809265137, 1)
handle.Name = "Handle"
handle.Parent = fall_periastron

local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "rbxassetid://1145495335"
mesh.TextureId = "rbxassetid://1145495888"
mesh.Parent = handle

local point_light = Instance.new("PointLight")
point_light.Range = 10
point_light.Brightness = 10
point_light.Color = Color3.new(1, 0.333333, 0)
point_light.Shadows = true
point_light.Parent = handle

local particle = Instance.new("Attachment")
particle.Visible = false
particle.Name = "Particle"
particle.Parent = handle

local leaf = Instance.new("ParticleEmitter")
leaf.Acceleration = Vector3.new(0, -3, 0)
leaf.Lifetime = NumberRange.new(1, 2)
leaf.LightEmission = 0.5
leaf.Rate = 5
leaf.RotSpeed = NumberRange.new(-100, 100)
leaf.Rotation = NumberRange.new(-180, 180)
leaf.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.5), NumberSequenceKeypoint.new(1, 0.5)})
leaf.Speed = NumberRange.new(1, 3)
leaf.SpreadAngle = Vector2.new(-180, 180)
leaf.Texture = "rbxassetid://279223281"
leaf.Name = "Leaf"
leaf.Parent = particle

local rustle = Instance.new("Sound")
rustle.Looped = true
rustle.SoundId = "rbxassetid://144309123"
rustle.Volume = 2
rustle.Name = "Rustle"
rustle.Parent = handle

local heavy_wind = Instance.new("Sound")
heavy_wind.SoundId = "rbxassetid://2190287438"
heavy_wind.Name = "HeavyWind"
heavy_wind.Parent = handle

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
right_grip_attachment.Axis = Vector3.new(1, 1.1924880638503055e-08, 1.629206565212371e-07)
right_grip_attachment.SecondaryAxis = Vector3.new(-1.1924880638503055e-08, 1, -3.552713678800501e-15)
right_grip_attachment.Visible = false
right_grip_attachment.Name = "RightGripAttachment"
right_grip_attachment.Parent = handle

local remote = Instance.new("RemoteEvent")
remote.Name = "Remote"
remote.Parent = fall_periastron

local mouse_input = Instance.new("RemoteFunction")
mouse_input.Name = "MouseInput"
mouse_input.Parent = fall_periastron

local r6 = Instance.new("Folder")
r6.Name = "R6"
r6.Parent = fall_periastron

local right_slash = Instance.new("Animation")
right_slash.AnimationId = "http://www.roblox.com/Asset?ID=54584713"
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

local spin = Instance.new("Animation")
spin.AnimationId = "http://www.roblox.com/asset/?id=235542946"
spin.Name = "Spin"
spin.Parent = r6

local r15 = Instance.new("Folder")
r15.Name = "R15"
r15.Parent = fall_periastron

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

local spin_2 = Instance.new("Animation")
spin_2.AnimationId = "rbxassetid://2516930867"
spin_2.Name = "Spin"
spin_2.Parent = r15

local Server = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/FallPeriastron/Server.lua", "server", fall_periastron)
Server.Name = "Server"

local Client = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/FallPeriastron/Client.lua", "local", fall_periastron)
Client.Name = "Client"

local MouseIcon = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/FallPeriastron/MouseIcon.lua", "local", fall_periastron)
MouseIcon.Name = "MouseIcon"