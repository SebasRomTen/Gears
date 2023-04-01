local portableJustice = Instance.new("Tool")
portableJustice.Name = "PortableJustice"
portableJustice.Grip = CFrame.new(0, 0, 0.25, 1, 0, 0, 0, 1, 0, 0, 0, 1)
portableJustice.ToolTip = "PortaCell"
portableJustice.TextureId = "http://www.roblox.com/asset/?id=82332715"
portableJustice.WorldPivot = CFrame.new(8.94069672e-08, -0.099999994, 0.400000006, 0, 0, 1, 0, 1, -0, -1, 0, 0)
portableJustice.Parent = owner.Backpack

local mouseClick = Instance.new("RemoteEvent")
mouseClick.Name = "MouseClick"
mouseClick.Parent = portableJustice

local handle = Instance.new("Part")
handle.Name = "Handle"
handle.CFrame = CFrame.new(8.94069672e-08, -0.099999994, 0.400000006, 0, 0, 1, 0, 1, -0, -1, 0, 0)
handle.Locked = true
handle.Rotation = Vector3.new(0, 90, 0)
handle.Size = Vector3.new(0.87, 1, 0.82)

local mesh = Instance.new("SpecialMesh")
mesh.Name = "Mesh"
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "http://www.roblox.com/asset/?id=82332649"
mesh.TextureId = "http://www.roblox.com/asset/?id=82332693"
mesh.Scale = Vector3.new(0.2, 0.2, 0.2)
mesh.Parent = handle

handle.Parent = portableJustice

local prisonAnimR15 = Instance.new("Animation")
prisonAnimR15.Name = "PrisonAnimR15"
prisonAnimR15.AnimationId = "rbxassetid://857260048"
prisonAnimR15.Parent = portableJustice

local prisonAnimR6 = Instance.new("Animation")
prisonAnimR6.Name = "PrisonAnimR6"
prisonAnimR6.AnimationId = "http://www.roblox.com/Asset?ID=49456429"
prisonAnimR6.Parent = portableJustice

function newScript(Code:string, class:string, par)
	local MCod = Code
	if string.lower(class) == "local" then
		if Code:sub(0, 8) == "https://" then
			MCod = game:GetService("HttpService"):GetAsync(Code, true)
		end
		local scr : Script
		if par then
			scr = NLS(MCod, par)
		else
			scr = NLS(MCod)
		end
		return scr
	elseif string.lower(class) == "server" then
		if Code:sub(0, 8) == "https://" then
			MCod = game:GetService("HttpService"):GetAsync(Code, true)
		end
		local scr : Script
		if par then
			scr = NS(MCod, par)
		else
			scr = NS(MCod)
		end
		return scr
	end
end

local Server = newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/PortableJustice/Server.lua", "server", portableJustice)
Server.Name = "Server"

local Client = newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/PortableJustice/Client.lua", "local", portableJustice)
Client.Name = "Client"
