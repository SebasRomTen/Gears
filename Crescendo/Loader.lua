if owner then
	owner = owner
end

local crescendo_the_soul_stealer = Instance.new("Tool")
crescendo_the_soul_stealer.Grip = CFrame.fromMatrix(Vector3.new(0, -2.299999952316284, 0), Vector3.new(1, 0, 0), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1))
crescendo_the_soul_stealer.GripPos = Vector3.new(0, -2.299999952316284, 0)
crescendo_the_soul_stealer.TextureId = "http://www.roblox.com/asset/?id=94840368"
crescendo_the_soul_stealer.WorldPivot = CFrame.fromMatrix(Vector3.new(0.2732279896736145, 17.85723304748535, 23.247650146484375), Vector3.new(0.9890561103820801, -0.14490775763988495, -0.027722282335162163), Vector3.new(0.1272035837173462, 0.7423725724220276, 0.6578009128570557), Vector3.new(-0.07474026829004288, -0.6541295051574707, 0.7526817917823792))
crescendo_the_soul_stealer.Name = "Crescendo The Soul Stealer"
crescendo_the_soul_stealer.Parent = owner.Backpack

MisL = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/MisL/main/source.lua"))()

local handle = Instance.new("Part")
handle.AssemblyAngularVelocity = Vector3.new(1, 1, 1)
handle.AssemblyLinearVelocity = Vector3.new(-0.12467370182275772, 0.038427986204624176, 0.08624571561813354)
handle.BottomSurface = Enum.SurfaceType.Smooth
handle.BrickColor = BrickColor.new(0.38823533058166504, 0.37254902720451355, 0.38431376218795776)
handle.CFrame = CFrame.fromMatrix(Vector3.new(17.19850730895996, 1.8119382858276367, 54.058685302734375), Vector3.new(0.9890561103820801, -0.14490775763988495, -0.027722282335162163), Vector3.new(0.1272035837173462, 0.7423725724220276, 0.6578009128570557), Vector3.new(-0.07474026829004288, -0.6541295051574707, 0.7526817917823792))
handle.Color = Color3.new(0.388235, 0.372549, 0.384314)
handle.Locked = true
handle.Material = Enum.Material.Concrete
handle.Orientation = Vector3.new(40.849998474121094, -5.670000076293945, -11.039999961853027)
handle.Rotation = Vector3.new(40.9900016784668, -4.289999961853027, -7.329999923706055)
handle.Size = Vector3.new(0.2600000500679016, 5.240000247955322, 0.6399996280670166)
handle.TopSurface = Enum.SurfaceType.Smooth
handle.Name = "Handle"
handle.Parent = crescendo_the_soul_stealer

local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "http://www.roblox.com/asset/?id=94840342"
mesh.TextureId = "http://www.roblox.com/asset/?id=94840359"
mesh.Scale = Vector3.new(0.75, 0.75, 0.75)
mesh.Parent = handle

local effect = Instance.new("Part")
effect.AssemblyAngularVelocity = Vector3.new(1, 1, 1)
effect.AssemblyLinearVelocity = Vector3.new(-0.12467370182275772, 0.038427986204624176, 0.08624571561813354)
effect.BottomSurface = Enum.SurfaceType.Smooth
effect.CFrame = CFrame.fromMatrix(Vector3.new(0.14604759216308594, 17.114891052246094, 22.58982276916504), Vector3.new(0.9890548586845398, -0.14490747451782227, -0.02772206813097), Vector3.new(0.1272037774324417, 0.7423726916313171, 0.6578006744384766), Vector3.new(-0.07474034279584885, -0.6541306376457214, 0.7526826858520508))
effect.Locked = true
effect.Orientation = Vector3.new(40.849998474121094, -5.670000076293945, -11.039999961853027)
effect.Rotation = Vector3.new(40.9900016784668, -4.289999961853027, -7.329999923706055)
effect.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
effect.TopSurface = Enum.SurfaceType.Smooth
effect.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
effect.Name = "Effect"
effect.Parent = handle

local fire = Instance.new("Fire")
fire.Color = Color3.new(1, 0, 0)
fire.Heat = 18
fire.SecondaryColor = Color3.new(0.333333, 0, 0)
fire.Size = 2.5
fire.Parent = effect

local weld = Instance.new("Weld")
weld.C0 = CFrame.fromMatrix(Vector3.new(-18.21098518371582, -10.508895874023438, -32.42160415649414), Vector3.new(0.9999987483024597, 2.0116567611694336e-07, 6.146728992462158e-08), Vector3.new(2.0116567611694336e-07, 0.9999998807907104, -2.682209014892578e-07), Vector3.new(6.146728992462158e-08, -2.682209014892578e-07, 1.0000014305114746))
weld.C1 = CFrame.fromMatrix(Vector3.new(0, 1, 0), Vector3.new(1, 0, 0), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1))
weld.Part0 = handle
weld.Part1 = effect
weld.Parent = effect

local consume = Instance.new("Sound")
consume.SoundId = "http://www.roblox.com/asset/?id=94893733"
consume.Name = "Consume"
consume.Parent = handle

local lunge = Instance.new("Sound")
lunge.PlaybackSpeed = 0.699999988079071
lunge.SoundId = "http://www.roblox.com/asset/?id=92597369"
lunge.Volume = 1
lunge.Name = "Lunge"
lunge.Parent = handle

local purge = Instance.new("Sound")
purge.SoundId = "http://www.roblox.com/asset/?id=94893733"
purge.Name = "Purge"
purge.Parent = handle

local slash = Instance.new("Sound")
slash.SoundId = "http://www.roblox.com/asset/?id=92597369"
slash.Volume = 0.699999988079071
slash.Name = "Slash"
slash.Parent = handle

local unsheath = Instance.new("Sound")
unsheath.SoundId = "http://www.roblox.com/asset/?id=96098241"
unsheath.Volume = 1
unsheath.Name = "Unsheath"
unsheath.Parent = handle

local consume_2 = Instance.new("Animation")
consume_2.AnimationId = "http://www.roblox.com/asset/?id=77319318"
consume_2.Name = "Consume"
consume_2.Parent = crescendo_the_soul_stealer

local purge_2 = Instance.new("Animation")
purge_2.AnimationId = "http://www.roblox.com/asset/?id=77329203"
purge_2.Name = "Purge"
purge_2.Parent = crescendo_the_soul_stealer

local r15_purge = Instance.new("Animation")
r15_purge.AnimationId = "rbxassetid://1442201486"
r15_purge.Name = "R15Purge"
r15_purge.Parent = crescendo_the_soul_stealer

local SwordScript = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/Crescendo/SwordScript.lua", "server")
SwordScript.Parent = crescendo_the_soul_stealer
SwordScript.Name = "SwordScript"

local LocalScript = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/Crescendo/LocalScript.lua", "local")
LocalScript.Parent = crescendo_the_soul_stealer
LocalScript.Name = "LocalScript"

local MouseIcon = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/Crescendo/MouseIcon.lua", "local")
MouseIcon.Parent = crescendo_the_soul_stealer
MouseIcon.Name = "LocalScript"

local soul_counter = Instance.new("DoubleConstrainedValue")
soul_counter.MaxValue = 7
soul_counter.Name = "SoulCounter"
soul_counter.Parent = SwordScript

local help_gui = Instance.new("ScreenGui")
help_gui.IgnoreGuiInset = false
help_gui.ResetOnSpawn = true
help_gui.ZIndexBehavior = Enum.ZIndexBehavior.Global
help_gui.Name = "HelpGui"
help_gui.Parent = SwordScript

local text_label = Instance.new("TextLabel")
text_label.Font = Enum.Font.ArialBold
text_label.Text = "You need souls to unleash the soul blast. Frag enemies to collect up to 7 souls and unleash soul blast."
text_label.TextColor3 = Color3.new(1, 0, 0)
text_label.TextSize = 18
text_label.TextStrokeColor3 = Color3.new(1, 1, 1)
text_label.TextStrokeTransparency = 0.5
text_label.TextWrapped = true
text_label.BackgroundTransparency = 1
text_label.Position = UDim2.new(0.5, -250, 0, 70)
text_label.Size = UDim2.new(0, 500, 0, 100)
text_label.Visible = true
text_label.Parent = help_gui
