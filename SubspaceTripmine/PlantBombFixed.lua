script.Name = "PlantBomb"
Tool = script.Parent

MisL = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/MisL/main/source.lua"))()

function plant(pos)
	
   
	local vCharacter = Tool.Parent
	local vPlayer = game.Players:playerFromCharacter(vCharacter)

	local spawnPos = vCharacter.PrimaryPart.Position


	local bomb = Tool.Handle:Clone()
	bomb.CanCollide = true
	bomb.Transparency = 0
	bomb.Position = pos
	bomb.Size = Vector3.new(2,2,2)
	bomb.Name = "SubspaceTripmine"
	bomb.Locked = true


	local creator_tag = Instance.new("ObjectValue")
	creator_tag.Value = vPlayer
	creator_tag.Name = "creator"
	creator_tag.Parent = bomb

	bomb.Parent = game.Workspace
	local new_script = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/SubspaceTripmine/SubspaceMine.lua", "server", bomb)
end


--Tool.Enabled = true
function onActivated()

	--if not Tool.Enabled then
	--	return
--	end

	--Tool.Enabled = false

	local character = Tool.Parent;
	local humanoid = character.Humanoid
	if humanoid == nil then
		print("Humanoid not found")
		return 
	end

	local targetPos = humanoid.TargetPoint

	Tool.Handle.Transparency = 1
	plant(Tool.Handle.Position)
	wait(3)
	Tool.Handle.Transparency = 0

	--Tool.Enabled = true
end


script.Parent.Activated:connect(onActivated)
