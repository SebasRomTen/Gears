if owner then
	owner = owner
end

local bluesteel_midas_hand = Instance.new("Tool")
bluesteel_midas_hand.Grip = CFrame.fromMatrix(Vector3.new(0, 0, -1.5), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1), Vector3.new(1, 0, 0))
bluesteel_midas_hand.GripForward = Vector3.new(-1, -0, -0)
bluesteel_midas_hand.GripPos = Vector3.new(0, 0, -1.5)
bluesteel_midas_hand.GripRight = Vector3.new(0, 1, 0)
bluesteel_midas_hand.GripUp = Vector3.new(0, 0, 1)
bluesteel_midas_hand.ToolTip = "Bluesteel Midas Hand"
bluesteel_midas_hand.TextureId = "http://www.roblox.com/asset/?id=161119323 "
bluesteel_midas_hand.WorldPivot = CFrame.fromMatrix(Vector3.new(0.0082780160009861, 2.570046901702881, 0.040445998311042786), Vector3.new(-0.6265315413475037, 0.483845055103302, 0.6110245585441589), Vector3.new(0.049319300800561905, -0.7577895522117615, 0.6506330966949463), Vector3.new(0.7778337001800537, 0.43777790665626526, 0.45091816782951355))
bluesteel_midas_hand.Name = "Bluesteel Midas Hand"
bluesteel_midas_hand.Parent = owner.Backpack

MisL = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/MisL/main/source.lua"))()

local handle = Instance.new("Part")
handle.BottomSurface = Enum.SurfaceType.Smooth
handle.BrickColor = BrickColor.new(0.38823533058166504, 0.37254902720451355, 0.38431376218795776)
handle.CFrame = CFrame.fromMatrix(Vector3.new(6.070328235626221, 5.348183631896973, 59.68743133544922), Vector3.new(-0.6265315413475037, 0.483845055103302, 0.6110245585441589), Vector3.new(0.049319300800561905, -0.7577895522117615, 0.6506330966949463), Vector3.new(0.7778337001800537, 0.43777790665626526, 0.45091816782951355))
handle.Color = Color3.new(0.388235, 0.372549, 0.384314)
handle.Locked = true
handle.Material = Enum.Material.Slate
handle.Orientation = Vector3.new(-25.959999084472656, 59.900001525878906, 147.44000244140625)
handle.Rotation = Vector3.new(-44.150001525878906, 51.060001373291016, -175.5)
handle.Size = Vector3.new(1, 0.800000011920929, 5)
handle.TopSurface = Enum.SurfaceType.Smooth
handle.Name = "Handle"
handle.Parent = bluesteel_midas_hand

local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "http://www.roblox.com/asset/?id=17384164"
mesh.TextureId = "http://www.roblox.com/asset/?id=161119143 "
mesh.Parent = handle

local midas1 = Instance.new("Sound")
midas1.SoundId = "http://www.roblox.com/asset/?id=17385513"
midas1.Volume = 1
midas1.Name = "Midas1"
midas1.Parent = handle

local midas2 = Instance.new("Sound")
midas2.SoundId = "http://www.roblox.com/asset/?id=17385522"
midas2.Volume = 1
midas2.Name = "Midas2"
midas2.Parent = handle

local midas3 = Instance.new("Sound")
midas3.SoundId = "http://www.roblox.com/asset/?id=17385529"
midas3.Volume = 1
midas3.Name = "Midas3"
midas3.Parent = handle

local swing = Instance.new("Animation")
swing.AnimationId = "http://www.roblox.com/asset?id=162787112"
swing.Name = "Swing"
swing.Parent = bluesteel_midas_hand

local activated_remote = Instance.new("RemoteEvent")
activated_remote.Name = "ActivatedRemote"
activated_remote.Parent = bluesteel_midas_hand

local Script = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/BluesteelMidasHand/Scrip.lua", "server")
Script.Parent = bluesteel_midas_hand
Script.Name = "Script"

local LocalSwing = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/BluesteelMidasHand/LocalSwing.lua", "local")
LocalSwing.Parent = bluesteel_midas_hand
LocalSwing.Name = "LocalSwing"

local MouseIcon = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/BluesteelMidasHand/MouseIcon.lua", "local")
MouseIcon.Parent = bluesteel_midas_hand
MouseIcon.Name = "MouseIcon"
