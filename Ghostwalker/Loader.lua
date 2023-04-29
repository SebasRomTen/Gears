local MisL : "Library" = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/MisL/main/source.lua"))()

local owner : Player = owner

local ghostwalker = Instance.new("Tool")
ghostwalker.Grip = CFrame.fromMatrix(Vector3.new(0, 0, -1.5), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1), Vector3.new(1, 0, 0))
ghostwalker.GripForward = Vector3.new(-1, -0, -0)
ghostwalker.GripPos = Vector3.new(0, 0, -1.5)
ghostwalker.GripRight = Vector3.new(0, 1, 0)
ghostwalker.GripUp = Vector3.new(0, 0, 1)
ghostwalker.TextureId = "http://www.roblox.com/asset/?id=89722223"
ghostwalker.WorldPivot = CFrame.fromMatrix(Vector3.new(1.5000020265579224, 5.600008010864258, -1.4999979734420776), Vector3.new(0, 0.707106351852417, 0.7071073651313782), Vector3.new(1, 0, 0), Vector3.new(0, 0.7071073651313782, -0.707106351852417))
ghostwalker.Name = "Ghostwalker"
ghostwalker.Parent = owner.Backpack

local handle = Instance.new("Part")
handle.BottomSurface = Enum.SurfaceType.Smooth
handle.BrickColor = BrickColor.new(0.9490196704864502, 0.9529412388801575, 0.9529412388801575)
handle.CFrame = CFrame.fromMatrix(Vector3.new(-110.98753356933594, 13.317455291748047, -53.87846374511719), Vector3.new(0, 0.707106351852417, 0.7071073651313782), Vector3.new(1, 0, 0), Vector3.new(0, 0.7071073651313782, -0.707106351852417))
handle.Color = Color3.new(0.94902, 0.952941, 0.952941)
handle.Locked = true
handle.Orientation = Vector3.new(-45, 180, 90)
handle.Rotation = Vector3.new(-135, 0, -90)
handle.Size = Vector3.new(1, 0.800000011920929, 4)
handle.TopSurface = Enum.SurfaceType.Smooth
handle.Size = Vector3.new(1, 0.800000011920929, 4)
handle.Name = "Handle"
handle.Parent = ghostwalker

local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "rbxasset://fonts/sword.mesh"
mesh.TextureId = "http://www.roblox.com/asset?id=64857463"
mesh.Parent = handle

local ghost_fire = Instance.new("Fire")
ghost_fire.Color = Color3.new(0.2, 0.8, 1)
ghost_fire.Heat = 25
ghost_fire.SecondaryColor = Color3.new(0, 0, 0.6)
ghost_fire.Size = 8
ghost_fire.Name = "GhostFire"
ghost_fire.Parent = handle
ghost_fire.TimeScale = 1
ghost_fire.Enabled = false

local lunge = Instance.new("Sound")
lunge.SoundId = "http://www.roblox.com/asset/?id=12222208"
lunge.Volume = 0.6000000238418579
lunge.Name = "Lunge"
lunge.Parent = handle

local slash = Instance.new("Sound")
slash.SoundId = "http://www.roblox.com/asset/?id=12222216"
slash.Volume = 0.699999988079071
slash.Name = "Slash"
slash.Parent = handle

local unsheath = Instance.new("Sound")
unsheath.SoundId = "http://www.roblox.com/asset/?id=12222225"
unsheath.Volume = 1
unsheath.Name = "Unsheath"
unsheath.Parent = handle

local ghost = Instance.new("Sound")
ghost.SoundId = "http://www.roblox.com/asset/?id=12229501"
ghost.Name = "Ghost"
ghost.Parent = handle

local right_grip_attachment = Instance.new("Attachment")
right_grip_attachment.Axis = Vector3.new(-6.310887241768095e-30, 1, 0)
right_grip_attachment.Orientation = Vector3.new(-3.615871840828815e-28, 90, 90)
right_grip_attachment.SecondaryAxis = Vector3.new(0, 0, 1)
right_grip_attachment.Visible = false
right_grip_attachment.Name = "RightGripAttachment"
right_grip_attachment.Parent = handle

local kills = Instance.new("IntConstrainedValue")
kills.MaxValue = 9
kills.Name = "Kills"
kills.Parent = ghostwalker

local PreloadBackpackcons = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/Ghostwalker/PreloadBackpackIcons.lua", "local", ghostwalker)
PreloadBackpackcons.Name = "PreloadBackpackIcons"

local MouseIcon = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/Ghostwalker/MouseIcon.lua", "local", ghostwalker)
MouseIcon.Name = "MouseIcon"

local SwordScript = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/Ghostwalker/SwordScript.lua", "server", ghostwalker)
SwordScript.Name = "SwordScript"