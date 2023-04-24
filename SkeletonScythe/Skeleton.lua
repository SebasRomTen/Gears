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

local SkeletonScript = MisL.newScript([[
	--Made by Stickmasterluke

	--Zombie artificial stupidity script
	--(Modified for skeletons)
	print("Skeleton Script")
	sp=script.Parent
	lastattack=0
	nextrandom=0
	--nextsound=0
	nextjump=0
	chasing=false
	
	variance=4
	
	damage=11
	attackrange=4.5
	sightrange=60
	runspeed=18
	wonderspeed=8
	healthregen=false
	colors={"Sand red","Dusty Rose","Medium blue","Sand blue","Lavender","Earth green","Brown","Medium stone grey","Brick yellow"}
	
	function raycast(spos,vec,currentdist)
		local hit2,pos2=game.Workspace:FindPartOnRay(Ray.new(spos+(vec*.01),vec*currentdist),sp)
		if hit2 and pos2 then
			if hit2.Transparency>=.8 or hit2.Name=="Handle" or string.sub(hit2.Name,1,6)=="Effect" then
				local currentdist=currentdist-(pos2-spos).magnitude
				return raycast(pos2,vec,currentdist)
			end
		end
		return hit2,pos2
	end
	
	function waitForChild(parent,childName)
		local child=parent:findFirstChild(childName)
		if child then return child end
		while true do
			child=parent.ChildAdded:wait()
			if child.Name==childName then return child end
		end
	end
	
	-- ANIMATION
	
	-- declarations
	
	local Torso=waitForChild(sp,"Torso")
	local Head=waitForChild(sp,"Head")
	local RightShoulder=waitForChild(Torso,"Right Shoulder")
	local LeftShoulder=waitForChild(Torso,"Left Shoulder")
	local RightHip=waitForChild(Torso,"Right Hip")
	local LeftHip=waitForChild(Torso,"Left Hip")
	local Neck=waitForChild(Torso,"Neck")
	local Humanoid=waitForChild(sp,"Humanoid")
	local BodyColors=waitForChild(sp,"Body Colors")
	local pose="Standing"
	--local hitsound=waitForChild(Torso,"HitSound")
	if healthregen then
		local regenscript=waitForChild(sp,"HealthRegenerationScript")
		regenscript.Disabled=false
	end
	Humanoid.WalkSpeed=wonderspeed
	
	local toolAnim="None"
	local toolAnimTime=0
	
	BodyColors.HeadColor=BrickColor.new("Grime")
	local randomcolor1=colors[math.random(1,#colors)]
	BodyColors.TorsoColor=BrickColor.new(randomcolor1)
	BodyColors.LeftArmColor=BrickColor.new(randomcolor1)
	BodyColors.RightArmColor=BrickColor.new(randomcolor1)
	local randomcolor2=colors[math.random(1,#colors)]
	BodyColors.LeftLegColor=BrickColor.new(randomcolor2)
	BodyColors.RightLegColor=BrickColor.new(randomcolor2)
	
	function IsTeamMate(Player1, Player2)
		return (Player1 and Player2 and not Player1.Neutral and not Player2.Neutral and Player1.TeamColor == Player2.TeamColor)
	end
	
	function IsInTable(Table,Value)
		for _,v in pairs(Table) do
			if v == Value then
				return true
			end
		end
		return false
	end
	
	function onRunning(speed)
		if speed>0 then
			pose="Running"
		else
			pose="Standing"
		end
	end
	function onDied()
		pose="Dead"
	end
	function onJumping()
		pose="Jumping"
	end
	function onClimbing()
		pose="Climbing"
	end
	function onGettingUp()
		pose = "GettingUp"
	end
	function onFreeFall()
		pose = "FreeFall"
	end
	function onFallingDown()
		pose = "FallingDown"
	end
	function onSeated()
		pose = "Seated"
	end
	function onPlatformStanding()
		pose = "PlatformStanding"
	end
	
	function moveJump()
		RightShoulder.MaxVelocity = 0.5
		LeftShoulder.MaxVelocity = 0.5
	  RightShoulder.DesiredAngle=3.14
		LeftShoulder.DesiredAngle=-3.14
		RightHip.DesiredAngle=0
		LeftHip.DesiredAngle=0
	end
	
	function moveFreeFall()
		RightShoulder.MaxVelocity = 0.5
		LeftShoulder.MaxVelocity =0.5
		RightShoulder.DesiredAngle=3.14
		LeftShoulder.DesiredAngle=-3.14
		RightHip.DesiredAngle=0
		LeftHip.DesiredAngle=0
	end
	
	function moveSit()
		RightShoulder.MaxVelocity = 0.15
		LeftShoulder.MaxVelocity = 0.15
		RightShoulder.DesiredAngle=3.14 /2
		LeftShoulder.DesiredAngle=-3.14 /2
		RightHip.DesiredAngle=3.14 /2
		LeftHip.DesiredAngle=-3.14 /2
	end
	
	function animate(time)
		local amplitude
		local frequency
		if (pose == "Jumping") then
			moveJump()
			return
		end
		if (pose == "FreeFall") then
			moveFreeFall()
			return
		end
		if (pose == "Seated") then
			moveSit()
			return
		end
		local climbFudge = 0
		if (pose == "Running") then
			RightShoulder.MaxVelocity = 0.15
			LeftShoulder.MaxVelocity = 0.15
			amplitude = 1
			frequency = 9
		elseif (pose == "Climbing") then
			RightShoulder.MaxVelocity = 0.5 
			LeftShoulder.MaxVelocity = 0.5
			amplitude = 1
			frequency = 9
			climbFudge = 3.14
		else
			amplitude = 0.1
			frequency = 1
		end
		local desiredAngle = amplitude * math.sin(time*frequency)
		if not chasing and frequency==9 then
			frequency=4
		end
		if chasing then
			RightShoulder.DesiredAngle=math.pi/2
			LeftShoulder.DesiredAngle=-math.pi/2
			RightHip.DesiredAngle=-desiredAngle*2
			LeftHip.DesiredAngle=-desiredAngle*2
		else
			RightShoulder.DesiredAngle=desiredAngle + climbFudge
			LeftShoulder.DesiredAngle=desiredAngle - climbFudge
			RightHip.DesiredAngle=-desiredAngle
			LeftHip.DesiredAngle=-desiredAngle
		end
	end
	
	
	function attack(time,attackpos)
		if time-lastattack>=1 then
			local hit,pos=raycast(Torso.Position,(attackpos-Torso.Position).unit,attackrange)
			if hit and hit.Parent and hit.Parent.Name~=sp.Name then
				local h=hit.Parent:FindFirstChildOfClass("Humanoid")
				if h then
					local creator=sp:FindFirstChild("creator")
					if creator then
						if creator.Value then
							if creator.Value~=game.Players:GetPlayerFromCharacter(h.Parent) then
								for i,oldtag in ipairs(h:GetChildren()) do
									if oldtag.Name=="creator" then
										oldtag:Destroy()
									end
								end
								creator:Clone().Parent=h
							else
								return
							end
						end
					end
					h:TakeDamage(damage)
					if RightShoulder and LeftShoulder then
						RightShoulder.CurrentAngle=0
						LeftShoulder.CurrentAngle=0
					end
				end
			end
			lastattack=time
		end
	end
	
	
	Humanoid.Died:Connect(onDied)
	Humanoid.Running:Connect(onRunning)
	Humanoid.Jumping:Connect(onJumping)
	Humanoid.Climbing:Connect(onClimbing)
	Humanoid.GettingUp:Connect(onGettingUp)
	Humanoid.FreeFalling:Connect(onFreeFall)
	Humanoid.FallingDown:Connect(onFallingDown)
	Humanoid.Seated:Connect(onSeated)
	Humanoid.PlatformStanding:Connect(onPlatformStanding)
	
	local DetectionRange = 200
	
	function populatehumanoids()
		local Pos = Torso.CFrame.p + Vector3.new(1,1,1) * DetectionRange
		local Neg = Torso.CFrame.p - Vector3.new(1,1,1) * DetectionRange
		local Region = Region3.new(Neg,Pos)
		local Parts = workspace:FindPartsInRegion3WithIgnoreList(Region,{sp,sp:WaitForChild("creator").Value.Character},math.huge)
		for _,parts in pairs(Parts) do
			if parts and parts.Parent then
				local Hum,FF = parts.Parent:FindFirstChildOfClass("Humanoid"),parts.Parent:FindFirstChildOfClass("ForceField")
				if Hum and Hum.Health ~= 0 and not FF and not IsTeamMate(sp:WaitForChild("creator").Value,game:GetService("Players"):GetPlayerFromCharacter(Hum.Parent)) and not IsInTable(humanoids,Hum) then
					table.insert(humanoids,Hum)
				end
			end
		end
	end
	while sp.Parent and Humanoid and Humanoid.Parent and Humanoid.Health>0 and Torso and Head and Torso and Torso.Parent do
		for _,parts in pairs(sp:GetDescendants()) do
			if parts:IsA("BasePart") and parts:CanSetNetworkOwnership() then
				parts:SetNetworkOwner(nil)
			end
		end
		
		local _,time=wait(1/3)
		humanoids={}
		populatehumanoids()
		closesttarget=nil
		closestdist=sightrange
		local creator=sp:FindFirstChild("creator")
		for i,h in ipairs(humanoids) do
			if h and h.Parent then
				if h.Health>0 and h.Parent.Name~=sp.Name and h.Parent~=sp then
					local plr=game.Players:GetPlayerFromCharacter(h.Parent)
					if not creator or not plr or creator.Value~=plr then
						local t=h.Parent:FindFirstChild("Torso") or h.Parent:FindFirstChild("UpperTorso")
						if t then
							local dist=(t.Position-Torso.Position).magnitude
							if dist<closestdist then
								closestdist=dist
								closesttarget=t
							end
						end
					end
				end
			end
		end
		if closesttarget then
			if not chasing then
				--playsound(time)
				chasing=true
				Humanoid.WalkSpeed=runspeed
			end
			Humanoid:MoveTo(closesttarget.Position+(Vector3.new(1,1,1)*(variance*((math.random()*2)-1))),closesttarget)
			if math.random()<.5 then
				attack(time,closesttarget.Position)
			end
		else
			if chasing then
				chasing=false
				Humanoid.WalkSpeed=wonderspeed
			end
			if time>nextrandom then
				nextrandom=time+3+(math.random()*5)
				local randompos=Torso.Position+((Vector3.new(1,1,1)*math.random()-Vector3.new(.5,.5,.5))*40)
				Humanoid:MoveTo(randompos,game.Workspace.Terrain)
			end
		end
		if time>nextjump then
			nextjump=time+7+(math.random()*5)
			Humanoid.Jump=true
		end
		animate(time)
	end
	
	wait(4)
	sp:Destroy() --Rest In Pizza
	
]])

return SkeletonBody