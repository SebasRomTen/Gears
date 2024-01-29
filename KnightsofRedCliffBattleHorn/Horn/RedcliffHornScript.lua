local MisL : "Library" = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/MisL/main/source.lua"))()

function WaitForChild(parent, child)
	while not parent:FindFirstChild(child) do parent.ChildAdded:wait() end
	return parent[child]
end

local PlayersService = game:GetService('Players')

local Tool = script.Parent
local birdPrototypeContainer = MisL.Http.returnData("https://raw.githubusercontent.com/SebasRomTen/Gears/main/KnightsofRedCliffBattleHorn/EagleM/Eagle.lua")
local birdPrototype = birdPrototypeContainer

local MAX_NUM_BIRDS = 5
local birds = {}
local numBirds = 0
local myCharacter
local myTorso

local Handle = WaitForChild(Tool, "Handle")
local SmallHorn = WaitForChild(Handle, "SmallHorn")
local BigHorn = WaitForChild(Handle, "BigHorn")




function removeDeadBirds()
	for birdRef, bird in pairs(birds) do
		if not bird or not bird.Parent then
			birds[birdRef] = nil
			birdRef.Parent = nil
			numBirds = numBirds - 1
		end
	end
end

function spawnBird(torsoPosition)
	local newBird = birdPrototype:Clone()

	local newBirdTorso = WaitForChild(newBird, "Torso")
	local ownerRef = WaitForChild(newBird, "PlayerOwner")
	ownerRef.Value = PlayersService:GetPlayerFromCharacter(myCharacter)

	local newBirdTag = Instance.new("ObjectValue")
	newBirdTag.Name = "BirdRefObject"
	newBirdTag.Value = newBird
	birds[newBirdTag] = newBird
	newBirdTag.Parent = myCharacter

	local angle = math.pi * 2 * numBirds / (MAX_NUM_BIRDS + 1)
	local spawnPosition = torsoPosition + 200*(Vector3.new(math.sin(angle), 1, math.cos(angle)))
	newBird:TranslateBy(spawnPosition - newBird:GetModelCFrame().p)

	newBird.Parent = workspace
	numBirds = numBirds + 1
end

local debounce = false
function onActivated()
	if not myTorso or debounce then return end
	debounce = true
	Tool.Enabled = false
	removeDeadBirds()
	print("activated")
	local addedBird = false

	--if numBirds < MAX_NUM_BIRDS then BigHorn.Volume = 1 SmallHorn.Volume = 0 else SmallHorn.Volume = 1 BigHorn.Volume = 0 end

	while numBirds < MAX_NUM_BIRDS do
		spawnBird(myTorso.CFrame.p)
		wait(1)
		addedBird = true
	end

	local myHumanoid = nil
	if myCharacter then myHumanoid = myCharacter:FindFirstChild("Humanoid") end

	if not myHumanoid or addedBird then debounce = false Tool.Enabled = true return end
	wait(.5)
	for birdRef, bird in pairs(birds) do
		local birdTorso = bird:FindFirstChild("Torso")
		if birdTorso then
			local birdTarget = birdTorso:FindFirstChild("TargetPoint")
			if birdTarget then birdTarget.Value = myHumanoid.TargetPoint end
		end
	end

	wait(1.5)
	Tool.Enabled = true
	debounce = false
end

function onEquipped()
	myCharacter = Tool.Parent
	if not myCharacter or not myCharacter.Parent then
		myTorso = nil
		return
	end

	myTorso = myCharacter:FindFirstChild("Torso") or myCharacter:FindFirstChild("HumanoidRootPart")
end

Tool.Activated:connect(onActivated)
Tool.Equipped:connect(onEquipped)