local owner : Player = owner

local MisL : "Library" = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/MisL/main/source.lua"))()

local korblox_war_trumpet = Instance.new("Tool")
korblox_war_trumpet.Grip = CFrame.fromMatrix(Vector3.new(0, 0, 1), Vector3.new(-1.4210854715202004e-14, 0.70710688829422, -0.7071066498756409), Vector3.new(-0.70710688829422, 0.4999998211860657, 0.49999991059303284), Vector3.new(0.7071066498756409, 0.5, 0.5000000596046448))
korblox_war_trumpet.GripForward = Vector3.new(-0.7071066498756409, -0.5, -0.5000000596046448)
korblox_war_trumpet.GripPos = Vector3.new(0, 0, 1)
korblox_war_trumpet.GripRight = Vector3.new(-1.4210854715202004e-14, 0.70710688829422, -0.7071066498756409)
korblox_war_trumpet.GripUp = Vector3.new(-0.70710688829422, 0.4999998211860657, 0.49999991059303284)
korblox_war_trumpet.TextureId = "http://www.roblox.com/asset/?id=101707797"
korblox_war_trumpet.WorldPivot = CFrame.fromMatrix(Vector3.new(46.25950622558594, 7.505685806274414, 0.5), Vector3.new(1, 0, 0), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1))
korblox_war_trumpet.Name = "KorbloxWarTrumpet"
korblox_war_trumpet.Parent = owner.Backpack

local handle = Instance.new("Part")
handle.BottomSurface = Enum.SurfaceType.Smooth
handle.BrickColor = BrickColor.new(0.38823533058166504, 0.37254902720451355, 0.38431376218795776)
handle.CFrame = CFrame.fromMatrix(Vector3.new(46.25950622558594, 7.505685806274414, 0.5), Vector3.new(1, 0, 0), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1))
handle.Color = Color3.new(0.388235, 0.372549, 0.384314)
handle.Locked = true
handle.Reflectance = 0.699999988079071
handle.Size = Vector3.new(0.7000004649162292, 0.8800003528594971, 3)
handle.TopSurface = Enum.SurfaceType.Smooth
handle.Size = Vector3.new(0.7000004649162292, 0.8800003528594971, 3)
handle.Name = "Handle"
handle.Parent = korblox_war_trumpet

local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "http://www.roblox.com/asset/?id=101707862"
mesh.TextureId = "http://www.roblox.com/asset/?id=101707658"
mesh.Scale = Vector3.new(0.4000000059604645, 0.4000000059604645, 0.5)
mesh.Parent = handle

local big_horn = Instance.new("Sound")
big_horn.SoundId = "http://www.roblox.com/asset/?id=101725853"
big_horn.Name = "BigHorn"
big_horn.Parent = handle

local small_horn = Instance.new("Sound")
small_horn.SoundId = "http://www.roblox.com/asset/?id=101725785"
small_horn.Name = "SmallHorn"
small_horn.Parent = handle

local blow_animation = Instance.new("Animation")
blow_animation.AnimationId = "http://www.roblox.com/asset/?id=70439232"
blow_animation.Name = "BlowAnimation"
blow_animation.Parent = korblox_war_trumpet

local hold_animation = Instance.new("Animation")
hold_animation.AnimationId = "http://www.roblox.com/asset/?id=70439247"
hold_animation.Name = "HoldAnimation"
hold_animation.Parent = korblox_war_trumpet

local SScript = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/KorbloxWarTrumpet/Script.lua", "server", korblox_war_trumpet)
SScript.Name = "Script"

local LGui = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/KorbloxWarTrumpet/LocalGui.lua", "local", korblox_war_trumpet)
LGui.Name = "Local Gui"

local HornAnimate = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/KorbloxWarTrumpet/HornAnimate.lua", "local", korblox_war_trumpet)
HornAnimate.Name = "HornAnimate"

local MotorizeRightGrip = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/KorbloxWarTrumpet/MotorizeRightGrip.lua", "server", HornAnimate)
MotorizeRightGrip.Name = "MotorizeRightGrip"