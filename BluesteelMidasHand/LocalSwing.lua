Tool = script.Parent
Swing = Tool:WaitForChild("Swing")
ReloadTime = 2

local Players = game:GetService'Players'

function GetHumanoid(obj)
	if obj then
		for i, child in next, obj:GetChildren() do
			if child:IsA'Humanoid' then
				return child
			end
		end
	else
		return nil
	end
end

function GCFP(part)
	local current = part
	local character = nil
	local humanoid = nil
	local player = nil
	while true do
		for i, child in next, current:GetChildren() do
			if child:IsA'Humanoid' then
				character = current
				humanoid = child
				break
			end
		end
		if current:IsA'Player' then
			character = current.Character
			humanoid = character and GetHumanoid(character)
			player = current
			break
		end

		if character then
			break
		else
			current = current.Parent

			if not current or current == game then
				break
			end
		end
	end

	return character, player or (character and Players:GetPlayerFromCharacter(character)), humanoid
end

function Activated()
	local Character, Player, Humanoid = GCFP(Tool)
	local Torso = Humanoid.Torso
	
	if Tool.Enabled and Player and Humanoid and Humanoid.Health > 0 and Torso then
		Tool.Enabled = false
		SwingAnim = Humanoid:LoadAnimation(Swing)
		if SwingAnim then
			SwingAnim:Play()
		end
		Tool.ActivatedRemote:FireServer()
		wait(0.4)
		if SwingAnim then
			SwingAnim:Stop()
		end
		wait(ReloadTime)
		Tool.Enabled = true
	end
end
function Unequipped()
	if SwingAnim then
		SwingAnim:Stop()
	end
end

Tool.Activated:connect(Activated)
Tool.Unequipped:connect(Unequipped)
