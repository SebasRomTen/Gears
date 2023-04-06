local fakeOwner : Player = owner

if owner then
	owner = owner or fakeOwner
end

MisL = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/MisL/main/source.lua"))()

local rainbow_periastron = Instance.new("Tool")
rainbow_periastron.Grip = CFrame.fromMatrix(Vector3.new(0, 0, -2), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1), Vector3.new(1, 0, 0))
rainbow_periastron.GripForward = Vector3.new(-1, -0, -0)
rainbow_periastron.GripPos = Vector3.new(0, 0, -2)
rainbow_periastron.GripRight = Vector3.new(0, 1, 0)
rainbow_periastron.GripUp = Vector3.new(0, 0, 1)
rainbow_periastron.ToolTip = "Rainbow Maelstrom"
rainbow_periastron.TextureId = "rbxassetid://1288064434"
rainbow_periastron.WorldPivot = CFrame.fromMatrix(Vector3.new(-0.00008800000068731606, 17.330001831054688, 20.421812057495117), Vector3.new(0.7113149166107178, -0.7028734683990479, 3.072357657174507e-08), Vector3.new(0, -4.371138828673793e-08, -1), Vector3.new(0.7028734683990479, 0.7113149166107178, -3.109256141442529e-08))
rainbow_periastron.Name = "RainbowPeriastron"
rainbow_periastron.Parent = fakeOwner.Backpack

local handle = Instance.new("Part")
handle.BottomSurface = Enum.SurfaceType.Smooth
handle.BrickColor = BrickColor.new(0.38823533058166504, 0.37254902720451355, 0.38431376218795776)
handle.CFrame = CFrame.fromMatrix(Vector3.new(-16.044593811035156, 11.43959903717041, -15.3446683883667), Vector3.new(0.7113149166107178, -0.7028734683990479, 3.072357657174507e-08), Vector3.new(0, -4.371138828673793e-08, -1), Vector3.new(0.7028734683990479, 0.7113149166107178, -3.109256141442529e-08))
handle.Color = Color3.new(0.388235, 0.372549, 0.384314)
handle.Orientation = Vector3.new(-45.34000015258789, 90, -90)
handle.Reflectance = 0.4000000059604645
handle.Rotation = Vector3.new(-90, 44.65999984741211, 0)
handle.Size = Vector3.new(1, 0.6000000238418579, 5.19999885559082)
handle.TopSurface = Enum.SurfaceType.Smooth
handle.Size = Vector3.new(1, 0.6000000238418579, 5.19999885559082)
handle.Name = "Handle"
handle.Parent = rainbow_periastron

local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "http://www.roblox.com/asset/?id=80557857"
mesh.TextureId = "rbxassetid://157345185"
mesh.Parent = handle

local sparkles = Instance.new("Sparkles")
sparkles.Color = Color3.new(1.77083, 10.2, 1)
sparkles.SparkleColor = Color3.new(1, 1, 1)
sparkles.Parent = handle

local light_fade = MisL.newScript([[

local Light = script.Parent
local TweenService = (game:FindService("TweenService") or game:GetService("TweenService"))
local LightFade = TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.In,0,false,.5)
local ColorCycle = {}
ColorCycle[#ColorCycle+1] = Color3.fromRGB(0,0,0)
ColorCycle[#ColorCycle+1] = Color3.fromRGB(255,255,255)
ColorCycle[#ColorCycle+1] = Color3.fromRGB(255,0,0)
ColorCycle[#ColorCycle+1] = Color3.fromRGB(255,176,0)
ColorCycle[#ColorCycle+1] = Color3.fromRGB(0,255,0)
ColorCycle[#ColorCycle+1] = Color3.fromRGB(0,0,255)
ColorCycle[#ColorCycle+1] = Color3.fromRGB(102, 51, 0)
ColorCycle[#ColorCycle+1] = Color3.fromRGB(170,0,170)
ColorCycle[#ColorCycle+1] = Color3.fromRGB(255, 85, 255)

while Light do
	for _,Colors in pairs(ColorCycle) do
		local Tween = TweenService:Create(Light,LightFade,{Color = Colors})
		Tween:Play()
		Tween.Completed:Wait()
	end
end

]], "server", sparkles)
light_fade.Name = "LightFade"

local point_light = Instance.new("PointLight")
point_light.Range = 10
point_light.Brightness = 10
point_light.Color = Color3.new(0.384314, 0.145098, 0.819608)
point_light.Parent = handle

local light_fade_2 = MisL.newScript([[

local Light = script.Parent
local TweenService = (game:FindService("TweenService") or game:GetService("TweenService"))
local LightFade = TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.In,0,false,.5)
local ColorCycle = {}
ColorCycle[#ColorCycle+1] = Color3.fromRGB(0,0,0)
ColorCycle[#ColorCycle+1] = Color3.fromRGB(255,255,255)
ColorCycle[#ColorCycle+1] = Color3.fromRGB(255,0,0)
ColorCycle[#ColorCycle+1] = Color3.fromRGB(255,176,0)
ColorCycle[#ColorCycle+1] = Color3.fromRGB(0,255,0)
ColorCycle[#ColorCycle+1] = Color3.fromRGB(0,0,255)
ColorCycle[#ColorCycle+1] = Color3.fromRGB(102, 51, 0)
ColorCycle[#ColorCycle+1] = Color3.fromRGB(170,0,170)
ColorCycle[#ColorCycle+1] = Color3.fromRGB(255, 85, 255)

while Light do
	for _,Colors in pairs(ColorCycle) do
		local Tween = TweenService:Create(Light,LightFade,{Color = Colors})
		Tween:Play()
		Tween.Completed:Wait()
	end
end

]], "server", sparkles, point_light)
light_fade_2.Name = "LightFade"


local bottom_trail = Instance.new("Attachment")
bottom_trail.CFrame = bottom_trail.CFrame * CFrame.new(0, 0, -.7)
bottom_trail.Visible = false
bottom_trail.Name = "BottomTrail"
bottom_trail.Parent = handle

local flare = Instance.new("ParticleEmitter")
flare.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(1, 0, 0)), ColorSequenceKeypoint.new(0.16666699945926666, Color3.new(1, 0.333333, 0)), ColorSequenceKeypoint.new(0.33333298563957214, Color3.new(1, 1, 0)), ColorSequenceKeypoint.new(0.5, Color3.new(0, 1, 0)), ColorSequenceKeypoint.new(0.6666669845581055, Color3.new(0, 0.333333, 1)), ColorSequenceKeypoint.new(0.8333330154418945, Color3.new(0, 0, 1)), ColorSequenceKeypoint.new(1, Color3.new(0.666667, 0, 1))})
flare.EmissionDirection = Enum.NormalId.Back
flare.Lifetime = NumberRange.new(1, 1)
flare.LightEmission = 1
flare.LockedToPart = true
flare.Rate = 35
flare.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.5), NumberSequenceKeypoint.new(0.10000000149011612, 0.5), NumberSequenceKeypoint.new(0.20000000298023224, 0.5), NumberSequenceKeypoint.new(0.30000001192092896, 0.5), NumberSequenceKeypoint.new(0.4000000059604645, 0.5), NumberSequenceKeypoint.new(0.5, 0.5), NumberSequenceKeypoint.new(0.6000000238418579, 0.5), NumberSequenceKeypoint.new(0.699999988079071, 0.5), NumberSequenceKeypoint.new(0.800000011920929, 0.5), NumberSequenceKeypoint.new(0.8999999761581421, 0.5), NumberSequenceKeypoint.new(1, 0.5)})
flare.Speed = NumberRange.new(3, 3)
flare.Texture = "rbxassetid://284205403"
flare.ZOffset = -1
flare.Name = "Flare"
flare.Parent = bottom_trail

local right_grip_attachment = Instance.new("Attachment")
right_grip_attachment.Axis = Vector3.new(0, 1, 0)
right_grip_attachment.SecondaryAxis = Vector3.new(0, 0, 1)
right_grip_attachment.Visible = false
right_grip_attachment.Name = "RightGripAttachment"
right_grip_attachment.Parent = handle

local toptrail = Instance.new("Attachment")
toptrail.CFrame = toptrail.CFrame * CFrame.new(0, 0, 2.5)
toptrail.Visible = false
toptrail.Name = "TopTrail"
toptrail.Parent = handle

local trail = Instance.new("Trail")
trail.Attachment0 = toptrail
trail.Attachment1 = bottom_trail
trail.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(1, 0, 0)), ColorSequenceKeypoint.new(0.16666699945926666, Color3.new(1, 0.333333, 0)), ColorSequenceKeypoint.new(0.33333298563957214, Color3.new(1, 1, 0)), ColorSequenceKeypoint.new(0.5, Color3.new(0, 1, 0)), ColorSequenceKeypoint.new(0.6666669845581055, Color3.new(0, 0.333333, 1)), ColorSequenceKeypoint.new(0.8333330154418945, Color3.new(0, 0, 1)), ColorSequenceKeypoint.new(1, Color3.new(0.666667, 0, 1))})
trail.Lifetime = 1
trail.LightEmission = 1
trail.MinLength = 0
trail.TextureMode = Enum.TextureMode.Wrap
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

local animations = Instance.new("Folder")
animations.Name = "Animations"
animations.Parent = rainbow_periastron

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

local normal_grip = Instance.new("CFrameValue")
normal_grip.Value = CFrame.fromMatrix(Vector3.new(0, 0, -2), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1), Vector3.new(1, 0, 0))
normal_grip.Name = "NormalGrip"
normal_grip.Parent = rainbow_periastron

local mouse_input = Instance.new("RemoteFunction")
mouse_input.Name = "MouseInput"
mouse_input.Parent = rainbow_periastron

local Server = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/RainbowPeriastronOmega/ServerScript.lua", "server", rainbow_periastron)
Server.Name = "Server"

local Client = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/RainbowPeriastronOmega/Client.lua", "local", rainbow_periastron)
Client.Name = "Client"

local MouseIcon = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/RainbowPeriastronOmega/MouseIcon.lua", "local", rainbow_periastron)
MouseIcon.Name = "MouseIcon"