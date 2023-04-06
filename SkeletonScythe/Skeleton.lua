MisL = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/MisL/main/source.lua"))()

local skull = Instance.new("Hat")
skull.AttachmentPoint = CFrame.fromMatrix(Vector3.new(0, 0.5, 0.10000000149011612), Vector3.new(1, 0, 0), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1))
skull.AttachmentPos = Vector3.new(0, 0.5, 0.10000000149011612)
skull.Name = "Skull"

local handle = Instance.new("Part")
handle.BottomSurface = Enum.SurfaceType.Smooth
handle.Locked = true
handle.Orientation = Vector3.new(0, 180, 0)
handle.Rotation = Vector3.new(-180, 0, -180)
handle.Size = Vector3.new(2, 2, 2)
handle.TopSurface = Enum.SurfaceType.Smooth
handle.Name = "Handle"
handle.Parent = skull

local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "http://www.roblox.com/asset/?id=36869983"
mesh.TextureId = "http://www.roblox.com/asset/?id=36869975"
mesh.Scale = Vector3.new(0.949999988079071, 0.8999999761581421, 0.949999988079071)
mesh.Parent = handle

local SkeletonBody = MisL.Chars.new({
	HeadColor = Color3.new(0, 0, 0)
})
SkeletonBody.Name = "Skeleton"

local HealthRegen = MisL.newScript([[

-- Renegeration Script for the bot
-- Renegerates about 1% of max hp per second until it reaches max health
bot = script.Parent
Humanoid = bot:FindFirstChild("Humanoid")

local regen = false

function regenerate() 
	if regen then return end
	-- Lock this function until the regeneration to max health is complete by using a boolean toggle
	regen = true
	while Humanoid.Health < Humanoid.MaxHealth do
		local delta = wait(1)
		local health = Humanoid.Health
		if health > 0 and health < Humanoid.MaxHealth then 
			-- This delta is for regenerating 1% of max hp per second instead of 1 hp per second
			delta = 0.01 * delta * Humanoid.MaxHealth
			health = health + delta
			Humanoid.Health = math.min(health, Humanoid.MaxHealth)			
		end
	end	
	-- release the lock, since the health is at max now, and if the character loses health again
	-- it needs to start regenerating 
	regen = false
end	

if Humanoid then 
	-- Better than a while true do loop since it only fires when the health actually changes
	Humanoid.HealthChanged:connect(regenerate)	
end



]], "server", SkeletonBody)
HealthRegen.Name = "HealthRegenerationScript"

MisL.Chars.animate(SkeletonBody)

local skeleton_left_arm = Instance.new("CharacterMesh")
skeleton_left_arm.BodyPart = Enum.BodyPart.LeftArm
skeleton_left_arm.MeshId = 36780032
skeleton_left_arm.OverlayTextureId = 36780292
skeleton_left_arm.Name = "Skeleton Left Arm"
skeleton_left_arm.Parent = SkeletonBody

local skeleton_left_leg = Instance.new("CharacterMesh")
skeleton_left_leg.BaseTextureId = 36780292
skeleton_left_leg.BodyPart = Enum.BodyPart.LeftLeg
skeleton_left_leg.MeshId = 36780079
skeleton_left_leg.OverlayTextureId = 36780292
skeleton_left_leg.Name = "Skeleton Left Leg"
skeleton_left_leg.Parent = SkeletonBody

local skeleton_right_arm = Instance.new("CharacterMesh")
skeleton_right_arm.BodyPart = Enum.BodyPart.RightArm
skeleton_right_arm.MeshId = 36780156
skeleton_right_arm.OverlayTextureId = 36780292
skeleton_right_arm.Name = "Skeleton Right Arm"
skeleton_right_arm.Parent = SkeletonBody

local skeleton_right_leg = Instance.new("CharacterMesh")
skeleton_right_leg.BodyPart = Enum.BodyPart.RightLeg
skeleton_right_leg.MeshId = 36780195
skeleton_right_leg.OverlayTextureId = 36780292
skeleton_right_leg.Name = "Skeleton Right Leg"
skeleton_right_leg.Parent = SkeletonBody

local skeleton_torso = Instance.new("CharacterMesh")
skeleton_torso.BodyPart = Enum.BodyPart.Torso
skeleton_torso.MeshId = 36780113
skeleton_torso.OverlayTextureId = 36780292
skeleton_torso.Name = "Skeleton Torso"
skeleton_torso.Parent = SkeletonBody

skull.Parent = SkeletonBody
return SkeletonBody