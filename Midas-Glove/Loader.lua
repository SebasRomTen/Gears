if owner then
	owner = owner
end

local Midas_Glove = Instance.new("Tool")
Midas_Glove.Grip = CFrame.fromMatrix(Vector3.new(0, 0, -1.5), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1), Vector3.new(1, 0, 0))
Midas_Glove.GripForward = Vector3.new(-1, -0, -0)
Midas_Glove.GripPos = Vector3.new(0, 0, -1.5)
Midas_Glove.GripRight = Vector3.new(0, 1, 0)
Midas_Glove.GripUp = Vector3.new(0, 0, 1)
Midas_Glove.TextureId = "http://www.roblox.com/asset/?id=17386312"
Midas_Glove.WorldPivot = CFrame.fromMatrix(Vector3.new(-187.79013061523438, 0.5066438317298889, 130.3225860595703), Vector3.new(0.0017975149676203728, -0.9999968409538269, -0.001768070855177939), Vector3.new(-0.6891791224479675, -0.0025199383962899446, 0.7245866656303406), Vector3.new(-0.7245888113975525, -0.00008393791358685121, -0.6891814470291138))
Midas_Glove.Name = "Midas Glove"
Midas_Glove.Parent = owner.Backpack

MisL = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/MisL/main/source.lua"))()

local handle = Instance.new("Part")
handle.BottomSurface = Enum.SurfaceType.Smooth
handle.BrickColor = BrickColor.new(0.38823533058166504, 0.37254902720451355, 0.38431376218795776)
handle.CFrame = CFrame.fromMatrix(Vector3.new(-38.06999969482422, 0.501220703125, -22.558792114257812), Vector3.new(0.0017975149676203728, -0.9999968409538269, -0.001768070855177939), Vector3.new(-0.6891791224479675, -0.0025199383962899446, 0.7245866656303406), Vector3.new(-0.7245888113975525, -0.00008393791358685121, -0.6891814470291138))
handle.Color = Color3.new(0.388235, 0.372549, 0.384314)
handle.Orientation = Vector3.new(0, -133.57000732421875, -90.13999938964844)
handle.Rotation = Vector3.new(179.99000549316406, -46.43000030517578, 89.8499984741211)
handle.Size = Vector3.new(1, 0.800000011920929, 5)
handle.TopSurface = Enum.SurfaceType.Smooth
handle.Size = Vector3.new(1, 0.800000011920929, 5)
handle.Name = "Handle"
handle.Parent = Midas_Glove

local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "http://www.roblox.com/asset/?id=17384164"
mesh.TextureId = "http://www.roblox.com/asset/?id=17384123"
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

local MidasTouch = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/Midas-Glove/MidasTouch.lua", "server", Midas_Glove)
MidasTouch.Name = "MidasTouch"

local Local_Gui = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/Midas-Glove/LocalGui.lua", "local", Midas_Glove)
Local_Gui.Name = "Local Gui"
