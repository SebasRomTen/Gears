local MisL : "Library" = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/MisL/main/source.lua"))()

local Minion : Model = MisL.Chars.new()
Minion.Name = "Overseer Minion"

print(Minion:FindFirstChild("HumanoidRootPart"), Minion:FindFirstChild("HumanoidRootPart"):FindFirstChild("RootJoint"))

local animate = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/Character-Animator/main/animator.lua"))()
animate(Minion)

local overseer_left_arm = Instance.new("CharacterMesh")
overseer_left_arm.BodyPart = Enum.BodyPart.LeftArm
overseer_left_arm.MeshId = 74653352
overseer_left_arm.OverlayTextureId = 74653324
overseer_left_arm.Name = "Overseer Left Arm"
overseer_left_arm.Parent = Minion

local overseer_left_leg = Instance.new("CharacterMesh")
overseer_left_leg.BodyPart = Enum.BodyPart.LeftLeg
overseer_left_leg.MeshId = 74653371
overseer_left_leg.OverlayTextureId = 74653324
overseer_left_leg.Name = "Overseer Left Leg"
overseer_left_leg.Parent = Minion

local overseer_right_arm = Instance.new("CharacterMesh")
overseer_right_arm.BodyPart = Enum.BodyPart.RightArm
overseer_right_arm.MeshId = 74653388
overseer_right_arm.OverlayTextureId = 74653324
overseer_right_arm.Name = "Overseer Right Arm"
overseer_right_arm.Parent = Minion

local overseer_right_leg = Instance.new("CharacterMesh")
overseer_right_leg.BodyPart = Enum.BodyPart.RightLeg
overseer_right_leg.MeshId = 74653410
overseer_right_leg.OverlayTextureId = 74653324
overseer_right_leg.Name = "Overseer Right Leg"
overseer_right_leg.Parent = Minion

local overseer_torso = Instance.new("CharacterMesh")
overseer_torso.BodyPart = Enum.BodyPart.Torso
overseer_torso.MeshId = 74653419
overseer_torso.OverlayTextureId = 74653324
overseer_torso.Name = "Overseer Torso"
overseer_torso.Parent = Minion

local Health = MisL.newScript([[

--Responsible for regening a player's humanoid's health

-- declarations
local Figure = script.Parent
local Head = Figure:WaitForChild("Head")
local Humanoid = Figure:WaitForChild("Humanoid")
local regening = false

-- regeneration
function regenHealth()
	if regening then return end
	regening = true
	
	while Humanoid.Health < Humanoid.MaxHealth do
		local s = wait(1)
		local health = Humanoid.Health
		if health > 0 and health < Humanoid.MaxHealth then
			local newHealthDelta = 0.01 * s * Humanoid.MaxHealth
			health = health + newHealthDelta
			Humanoid.Health = math.min(health,Humanoid.MaxHealth)
		end
	end
	
	if Humanoid.Health > Humanoid.MaxHealth then
		Humanoid.Health = Humanoid.MaxHealth
	end
	
	regening = false
end

Humanoid.HealthChanged:connect(regenHealth)
  

]], "server", Minion)
Health.Name = "Health"

local OVScript = MisL.newScript([[

--Made by Luckymaxer
local eerie_warrior = Instance.new("Accessory")
eerie_warrior.AttachmentPoint = CFrame.fromMatrix(Vector3.new(0, -0.20000000298023224, 0), Vector3.new(1, 0, 0), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1))
eerie_warrior.AttachmentPos = Vector3.new(0, -0.20000000298023224, 0)
eerie_warrior.Name = "EerieWarrior"

local handle = Instance.new("Part")
handle.BottomSurface = Enum.SurfaceType.Smooth
handle.CFrame = CFrame.fromMatrix(Vector3.new(22.80000114440918, 1.600006103515625, 2.1000266075134277), Vector3.new(1, 0, 0), Vector3.new(0, 1.0000001192092896, -4.470348358154297e-08), Vector3.new(0, 4.470348358154297e-08, 1.0000001192092896))
handle.Locked = true
handle.Size = Vector3.new(1.999999761581421, 2.4000003337860107, 1.3999998569488525)
handle.TopSurface = Enum.SurfaceType.Smooth
handle.Name = "Handle"
handle.Parent = eerie_warrior

local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "http://www.roblox.com/asset/?id=63993884"
mesh.TextureId = "http://www.roblox.com/asset/?id=63993910"
mesh.Scale = Vector3.new(1.0499999523162842, 1, 1)
mesh.Parent = handle

local hat_attachment = Instance.new("Attachment")
hat_attachment.Axis = Vector3.new(1, -7.871375551360416e-09, 0)
hat_attachment.CFrame = CFrame.fromMatrix(Vector3.new(8.658389560878277e-09, -0.09999990463256836, -0.0002722442150115967), Vector3.new(1, -7.871375551360416e-09, 0), Vector3.new(7.871375551360416e-09, 1, 4.1444220966321485e-16), Vector3.new(-3.2622303411172315e-24, -4.1444220966321485e-16, 1))
hat_attachment.Orientation = Vector3.new(2.3745789405962836e-14, -1.8691202130724443e-22, -4.5099656631464313e-07)
hat_attachment.Position = Vector3.new(8.658389560878277e-09, -0.09999990463256836, -0.0002722442150115967)
hat_attachment.SecondaryAxis = Vector3.new(7.871375551360416e-09, 1, 4.1444220966321485e-16)
hat_attachment.Visible = false
hat_attachment.Name = "HatAttachment"
hat_attachment.Parent = handle

local overseer_helm = Instance.new("Accessory")
overseer_helm.AttachmentPoint = CFrame.fromMatrix(Vector3.new(0, 0.18000000715255737, 0.12999999523162842), Vector3.new(1, 0, 0), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1))
overseer_helm.AttachmentPos = Vector3.new(0, 0.18000000715255737, 0.12999999523162842)
overseer_helm.Name = "OverseerHelm"

local handle = Instance.new("Part")
handle.BottomSurface = Enum.SurfaceType.Smooth
handle.CFrame = CFrame.fromMatrix(Vector3.new(-0.10000000149011612, 17.30000114440918, 30.399999618530273), Vector3.new(1, 0, 0), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1))
handle.Locked = true
handle.Size = Vector3.new(1, 1, 1.5999999046325684)
handle.TopSurface = Enum.SurfaceType.Smooth
handle.Name = "Handle"
handle.Parent = overseer_helm

local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "http://www.roblox.com/asset/?id=127484492 "
mesh.TextureId = "http://www.roblox.com/asset/?id=127517746 "
mesh.Scale = Vector3.new(1.2000000476837158, 1.2000000476837158, 1.2000000476837158)
mesh.Parent = handle

local hat_attachment = Instance.new("Attachment")
hat_attachment.Axis = Vector3.new(1, -7.871375551360416e-09, 0)
hat_attachment.CFrame = CFrame.fromMatrix(Vector3.new(8.657480066176504e-09, 0.2799997329711914, 0.12972775101661682), Vector3.new(1, -7.871375551360416e-09, 0), Vector3.new(7.871375551360416e-09, 1, 4.1444220966321485e-16), Vector3.new(-3.2622303411172315e-24, -4.1444220966321485e-16, 1))
hat_attachment.Orientation = Vector3.new(2.3745789405962836e-14, -1.8691202130724443e-22, -4.5099656631464313e-07)
hat_attachment.SecondaryAxis = Vector3.new(7.871375551360416e-09, 1, 4.1444220966321485e-16)
hat_attachment.Visible = false
hat_attachment.Name = "HatAttachment"
hat_attachment.Parent = handle

local overseer_helmet = Instance.new("Accessory")
overseer_helmet.AttachmentPoint = CFrame.fromMatrix(Vector3.new(0, 0.25, 0.10000000149011612), Vector3.new(1, 0, 0), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1))
overseer_helmet.AttachmentPos = Vector3.new(0, 0.25, 0.10000000149011612)
overseer_helmet.Name = "OverseerHelmet"

local handle = Instance.new("Part")
handle.BottomSurface = Enum.SurfaceType.Smooth
handle.CFrame = CFrame.fromMatrix(Vector3.new(37.90003204345703, 1.0999975204467773, 31.69999122619629), Vector3.new(0.9999998807907104, 0, 0), Vector3.new(0, 1, 0), Vector3.new(0, 0, 0.9999998807907104))
handle.Locked = true
handle.Size = Vector3.new(1.399999737739563, 1.4000003337860107, 1.8000001907348633)
handle.TopSurface = Enum.SurfaceType.Smooth
handle.Size = Vector3.new(1.399999737739563, 1.4000003337860107, 1.8000001907348633)
handle.Name = "Handle"
handle.Parent = overseer_helmet

local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "http://www.roblox.com/asset/?id=87260540"
mesh.TextureId = "http://www.roblox.com/asset/?id=87260551"
mesh.Parent = handle

local hat_attachment = Instance.new("Attachment")
hat_attachment.Axis = Vector3.new(1, -7.871375551360416e-09, 0)
hat_attachment.CFrame = CFrame.fromMatrix(Vector3.new(8.658389560878277e-09, 0.34999990463256836, 0.09972775727510452), Vector3.new(1, -7.871375551360416e-09, 0), Vector3.new(7.871375551360416e-09, 1, 4.1444220966321485e-16), Vector3.new(-3.2622303411172315e-24, -4.1444220966321485e-16, 1))
hat_attachment.Orientation = Vector3.new(2.3745789405962836e-14, -1.8691202130724443e-22, -4.5099656631464313e-07)
hat_attachment.Position = Vector3.new(8.658389560878277e-09, 0.34999990463256836, 0.09972775727510452)
hat_attachment.SecondaryAxis = Vector3.new(7.871375551360416e-09, 1, 4.1444220966321485e-16)
hat_attachment.Visible = false
hat_attachment.Name = "HatAttachment"
hat_attachment.Parent = handle

local overseer_helmet2 = Instance.new("Accessory")
overseer_helmet2.AttachmentPoint = CFrame.fromMatrix(Vector3.new(0, -0.15000000596046448, -0.03999999910593033), Vector3.new(1, 0, 0), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1))
overseer_helmet2.AttachmentPos = Vector3.new(0, -0.15000000596046448, -0.03999999910593033)
overseer_helmet2.Name = "OverseerHelmet2"

local handle = Instance.new("Part")
handle.BottomSurface = Enum.SurfaceType.Smooth
handle.CFrame = CFrame.fromMatrix(Vector3.new(-0.30000001192092896, 17.399999618530273, 21.80000114440918), Vector3.new(1, 0, 0), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1))
handle.Locked = true
handle.Size = Vector3.new(1, 2, 2)
handle.TopSurface = Enum.SurfaceType.Smooth
handle.Size = Vector3.new(1, 2, 2)
handle.Name = "Handle"
handle.Parent = overseer_helmet2

local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "http://www.roblox.com/asset/?id=153557871 "
mesh.TextureId = "http://www.roblox.com/asset/?id=153454996 "
mesh.Scale = Vector3.new(1.0499999523162842, 1.0499999523162842, 1.0499999523162842)
mesh.Parent = handle

local hat_attachment = Instance.new("Attachment")
hat_attachment.Axis = Vector3.new(1, -7.871375551360416e-09, 0)
hat_attachment.CFrame = CFrame.fromMatrix(Vector3.new(8.658389560878277e-09, -0.05000019073486328, -0.040272243320941925), Vector3.new(1, -7.871375551360416e-09, 0), Vector3.new(7.871375551360416e-09, 1, 4.1444220966321485e-16), Vector3.new(-3.2622303411172315e-24, -4.1444220966321485e-16, 1))
hat_attachment.Orientation = Vector3.new(2.3745789405962836e-14, -1.8691202130724443e-22, -4.5099656631464313e-07)
hat_attachment.Position = Vector3.new(8.658389560878277e-09, -0.05000019073486328, -0.040272243320941925)
hat_attachment.SecondaryAxis = Vector3.new(7.871375551360416e-09, 1, 4.1444220966321485e-16)
hat_attachment.Visible = false
hat_attachment.Name = "HatAttachment"
hat_attachment.Parent = handle

local overseers_eye = Instance.new("Accessory")
overseers_eye.AttachmentPoint = CFrame.fromMatrix(Vector3.new(0, 0.10000000149011612, 0), Vector3.new(1, 0, 0), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1))
overseers_eye.AttachmentPos = Vector3.new(0, 0.10000000149011612, 0)
overseers_eye.Name = "OverseersEye"
overseers_eye.Parent = workspace

local handle = Instance.new("Part")
handle.BottomSurface = Enum.SurfaceType.Smooth
handle.CFrame = CFrame.fromMatrix(Vector3.new(-0.8799800276756287, 17.279998779296875, 24.76999282836914), Vector3.new(-0.728853166103363, 0, -0.6846701502799988), Vector3.new(0, 1, 0), Vector3.new(0.6846701502799988, 0, -0.728853166103363))
handle.Locked = true
handle.Orientation = Vector3.new(0, 136.7899932861328, 0)
handle.Rotation = Vector3.new(-180, 43.209999084472656, -180)
handle.Size = Vector3.new(2, 2, 2)
handle.TopSurface = Enum.SurfaceType.Smooth
handle.Name = "Handle"
handle.Parent = overseers_eye

local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "http://www.roblox.com/asset/?id=82326541"
mesh.TextureId = "http://www.roblox.com/asset/?id=82327419"
mesh.Scale = Vector3.new(3.200000047683716, 3.200000047683716, 3.200000047683716)
mesh.Parent = handle

local hat_attachment = Instance.new("Attachment")
hat_attachment.Axis = Vector3.new(1, -7.871375551360416e-09, 0)
hat_attachment.CFrame = CFrame.fromMatrix(Vector3.new(8.658389560878277e-09, 0.19999980926513672, -0.0002722442150115967), Vector3.new(1, -7.871375551360416e-09, 0), Vector3.new(7.871375551360416e-09, 1, 4.1444220966321485e-16), Vector3.new(-3.2622303411172315e-24, -4.1444220966321485e-16, 1))
hat_attachment.Orientation = Vector3.new(2.3745789405962836e-14, -1.8691202130724443e-22, -4.5099656631464313e-07)
hat_attachment.Position = Vector3.new(8.658389560878277e-09, 0.19999980926513672, -0.0002722442150115967)
hat_attachment.SecondaryAxis = Vector3.new(7.871375551360416e-09, 1, 4.1444220966321485e-16)
hat_attachment.Visible = false
hat_attachment.Name = "HatAttachment"
hat_attachment.Parent = handle

Figure = script.Parent
Humanoid = Figure:WaitForChild("Humanoid")
Torso = Figure:FindFirstChild("Torso")

Creator = Figure:FindFirstChild("Creator")

Players = game:GetService("Players")
Debris = game:GetService("Debris")

Hats = {eerie_warrior, overseer_helm, overseer_helmet, overseer_helmet2, overseers_eye}

WalkRadius = 10
MaxFollowDistance = 30

Figure.Name = "Overseer Minion"

Humanoid.Health = Humanoid.MaxHealth

Hat = Hats[math.random(1, #Hats)]
HatModel = Hat:Clone()
Hat = HatModel

for i, v in pairs(Figure:GetChildren()) do
	if v:IsA("Hat") or v:IsA("BodyColors") or v:IsA("Clothing") then
		v:Destroy()
	end
end

Hat.Parent = Figure

function RayCast(Position, Direction, MaxDistance, IgnoreList)
	return game:GetService("Workspace"):FindPartOnRayWithIgnoreList(Ray.new(Position, Direction.unit * (MaxDistance or 999.999)), IgnoreList) 
end

function TagHumanoid(humanoid, player)
	local Creator_Tag = Instance.new("ObjectValue")
	Creator_Tag.Name = "creator"
	Creator_Tag.Value = player
	Debris:AddItem(Creator_Tag, 2)
	Creator_Tag.Parent = humanoid
end

function UntagHumanoid(humanoid)
	for i, v in pairs(humanoid:GetChildren()) do
		if v:IsA("ObjectValue") and v.Name == "creator" then
			v:Destroy()
		end
	end
end

function Wander()
	Humanoid:MoveTo(Vector3.new(Torso.Position.X + math.random(-WalkRadius, WalkRadius), Torso.Position.Y, Torso.Position.Z + math.random(-WalkRadius, WalkRadius)))
end

function FollowTarget(TargetHumanoid, TargetTorso)
	if not TargetHumanoid or not TargetHumanoid.Parent or TargetHumanoid.Health == 0 or not TargetTorso or not TargetTorso.Parent then
		return
	end
	Humanoid:MoveTo(Vector3.new(TargetTorso.Position.X, Torso.Position.Y, TargetTorso.Position.Z))
end

function FindTarget()
	local ClosestCharacter
	local ClosestHumanoid = nil
	local ClosestTorso = nil
	local ClosestTorsoDistance = MaxFollowDistance
	for i, v in pairs(Players:GetChildren()) do
		if v:IsA("Player") and (not Creator or (Creator and v ~= Creator.Value)) and v.Character then
			local character = v.Character
			local humanoid = character:FindFirstChild("Humanoid")
			local torso = character:FindFirstChild("Torso")
			local TorsoDistance = (torso.Position - Torso.Position).magnitude
			if humanoid and humanoid.Health > 0 and torso and TorsoDistance <= ClosestTorsoDistance then
				ClosestCharacter = character
				ClosestHumanoid = humanoid
				ClosestTorso = torso
				ClosestTorsoDistance = TorsoDistance
			end
		end
	end
	return ClosestCharacter, ClosestHumanoid, ClosestTorso
end

for i, v in pairs(Figure:GetChildren()) do
	if v:IsA("BasePart") then
		v.Touched:connect(function(Hit)
			if Hit and Hit.Parent and Hit.Parent ~= Figure and Hit.Parent.Name ~= Figure.Name then
				local Player = Players:GetPlayerFromCharacter(Hit.Parent)
				local humanoid = Hit.Parent:FindFirstChild("Humanoid")
				if humanoid and humanoid.Health > 0 and (not Player or (Player and (not Creator or (Creator and Player ~= Creator.Value)))) and Humanoid.Health > 0 then
					UntagHumanoid(humanoid)
					TagHumanoid(humanoid, ((Creator and Creator.Value) or nil))
					humanoid:TakeDamage(8)
				end
			end
		end)
	end
end

while true do
	local character, humanoid, torso = FindTarget()
	if character and character.Parent and humanoid and humanoid.Parent and torso and torso.Parent then
		FollowTarget(humanoid, torso)
	else
		Wander()
	end
	local Hit, EndPosition = RayCast(Torso.Position, Torso.CFrame.lookVector, (Torso.Size.Z * 2.5), {Figure})
	if Hit and Hit.Parent and Hit.Parent ~= character then
		Humanoid.Jump = true
	end
	wait(0.5)
end

]], "server", Minion)
OVScript.Name = "OverseerScript"

local Sound = MisL.newScript([[

-- util

function waitForChild(parent, childName)
	local child = parent:findFirstChild(childName)
	if child then return child end
	while true do
		child = parent.ChildAdded:wait()
		if child.Name==childName then return child end
	end
end

function newSound(id)
	local sound = Instance.new("Sound")
	sound.SoundId = id
	sound.archivable = false
	sound.Parent = script.Parent.Head
	return sound
end

-- declarations

local sDied = newSound("rbxasset://sounds/uuhhh.wav")
local sFallingDown = newSound("rbxasset://sounds/splat.wav")
local sFreeFalling = newSound("rbxasset://sounds/swoosh.wav")
local sGettingUp = newSound("rbxasset://sounds/hit.wav")
local sJumping = newSound("rbxasset://sounds/button.wav")
local sRunning = newSound("rbxasset://sounds/bfsl-minifigfoots1.mp3")
sRunning.Looped = true

local Figure = script.Parent
local Head = waitForChild(Figure, "Head")
local Humanoid = waitForChild(Figure, "Humanoid")

-- functions

function onDied()
	sDied:Play()
end

function onState(state, sound)
	if state then
		sound:Play()
	else
		sound:Pause()
	end
end

function onRunning(speed)
	if speed>0 then
		sRunning:Play()
	else
		sRunning:Pause()
	end
end

-- connect up

Humanoid.Died:connect(onDied)
Humanoid.Running:connect(onRunning)
Humanoid.Jumping:connect(function(state) onState(state, sJumping) end)
Humanoid.GettingUp:connect(function(state) onState(state, sGettingUp) end)
Humanoid.FreeFalling:connect(function(state) onState(state, sFreeFalling) end)
Humanoid.FallingDown:connect(function(state) onState(state, sFallingDown) end)


]], "server", Minion)
Sound.Name = "Sound"
return Minion