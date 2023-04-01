function Create(ty)
	return function(data)
		local obj = Instance.new(ty)
		for k, v in pairs(data) do
			if type(k) == 'number' then
				v.Parent = obj
			else
				obj[k] = v
			end
		end
		return obj
	end
end

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

local Tool = script.Parent

local Handle = Tool:WaitForChild("Handle",10)

local MouseClick = Tool:WaitForChild("MouseClick",10)

local Players = (game:FindService("Players") or game:GetService("Players"))
local Debris = (game:FindService("Debris") or game:GetService("Debris"))

local Services = {
	Players = (game:FindService("Players") or game:GetService("Players")),
	Debris = (game:FindService("Debris") or game:GetService("Debris")),
	ServerScriptService = (game:FindService("ServerScriptService") or game:GetService("ServerScriptService"))
}

local function IsJailed(Hum) -- Quick check to see if they're not jailed
	local Children = Services.ServerScriptService:GetChildren()
	for i=1, #Children do
		if Children[i]:IsA("Script") and Children[i].Name == "CellScript" and Children[i]:FindFirstChild("Target") and Children[i]:FindFirstChild("Target").Value == Hum.Parent then
			return true
		end
	end
	return false
end


MouseClick.OnServerEvent:Connect(function(Player,SelectedTargetCharacter)
	--print("Activated")
	if not Player or not SelectedTargetCharacter then return end
	local Torso = (SelectedTargetCharacter:FindFirstChild("HumanoidRootPart") or SelectedTargetCharacter:FindFirstChild("Torso"))
	local Humanoid,FF = SelectedTargetCharacter:FindFirstChildOfClass("Humanoid"),SelectedTargetCharacter:FindFirstChildOfClass("ForceField")
	local UserTorso = (Player.Character:FindFirstChild("HumanoidRootPart") or Player.Character:FindFirstChild("Torso"))
	
	if not UserTorso or FF then return end
	
	local Distance = (Torso.CFrame.p-UserTorso.CFrame.p).magnitude -- Make sure it's legit
	
	if Distance > 15 then return end
	
	if Torso and Humanoid and not SelectedTargetCharacter:FindFirstChild("CellScript") and not IsJailed(Humanoid) then
		local pScript = newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/PortableJustice/CellScript.lua", "server", Services.ServerScriptService)
		Create("ObjectValue"){
			Name = "Target",
			Value = SelectedTargetCharacter,
			Parent = pScript,
		}
	end
end)
