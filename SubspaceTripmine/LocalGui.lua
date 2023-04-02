script.Name = "LocalGui"
local Tool = script.Parent;
	
	local enabled = true
	local function onButton1Down(mouse)
		if not enabled then
			return
		end
	
		enabled = false
		mouse.Icon = "rbxasset://textures\\ArrowFarCursor.png"
	
		wait(3)
		mouse.Icon = "rbxasset://textures\\ArrowCursor.png"
		enabled = true
	
	end
	
	local function onEquippedLocal(mouse)
	
		if mouse == nil then
			print("Mouse not found")
			return 
		end
	
		mouse.Icon = "rbxasset://textures\\ArrowCursor.png"
		mouse.Button1Down:connect(function() onButton1Down(mouse) end)
	end
	
	Tool.Equipped:connect(onEquippedLocal)
