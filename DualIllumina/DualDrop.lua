MisL = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/MisL/main/source.lua"))()
local GLib = MisL.Http.returnData("https://raw.githubusercontent.com/SebasRomTen/Gears/main/GLib.lua")
local tool = script.Parent
local secondary

tool.Equipped:connect(function()
	if secondary then secondary:Destroy() secondary=nil end
end)
tool.Unequipped:connect(function()
	if secondary then return end
	
	secondary = tool:WaitForChild'Handle':Clone()
	secondary.Name = 'DualDropHandle'
	secondary.Archivable = false
	secondary.Parent = tool.Handle
	local weld = GLib.Create'Weld'{
		Name = 'DualDropWeld',
		Parent = secondary,
		Part0 = tool.Handle,
		Part1 = secondary,
		C0 = CFrame.Angles(0, math.rad(90*3/4), 0)
	}
end)