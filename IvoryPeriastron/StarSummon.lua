MisL = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/MisL/main/source.lua"))()

local Services = {
	Players = (game:FindService("Players") or game:GetService("Players")),
	TweenService = (game:FindService("TweenService") or game:GetService("TweenService")),
	RunService = (game:FindService("RunService") or game:GetService("RunService")),
	Debris = (game:FindService("Debris") or game:GetService("Debris"))
}


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

function IsTeamMate(Player1, Player2)
	return (Player1 and Player2 and not Player1.Neutral and not Player2.Neutral and Player1.TeamColor == Player2.TeamColor)
end

function TagHumanoid(humanoid, player)
	local Creator_Tag = Instance.new("ObjectValue")
	Creator_Tag.Name = "creator"
	Creator_Tag.Value = player
	Services.Debris:AddItem(Creator_Tag, 2)
	Creator_Tag.Parent = humanoid
end

function UntagHumanoid(humanoid)
	for i, v in pairs(humanoid:GetChildren()) do
		if v:IsA("ObjectValue") and v.Name == "creator" then
			v:Destroy()
		end
	end
end

local BaseUrl = "http://www.roblox.com/asset/?id="

local Star = script.Parent

local Creator = script:WaitForChild("Creator",10).Value

function Damage(hit,TotalDamage)
	if not hit or not hit.Parent then return end
	local Hum = hit.Parent:FindFirstChildOfClass("Humanoid")
	local ForceField = hit.Parent:FindFirstChildOfClass("ForceField")
	if not Hum or Hum.Health <=0 or Hum == Creator.Character:FindFirstChildOfClass("Humanoid") or ForceField then return end
	
	if IsTeamMate(Creator,Services.Players:GetPlayerFromCharacter(Hum.Parent)) then return end
	if not Hum.Parent:FindFirstChild("Stardust") then
		
		local stardust = Instance.new("ParticleEmitter")
		stardust.Drag = 2.75
		stardust.Lifetime = NumberRange.new(0.5, 1)
		stardust.LightEmission = 1
		stardust.Rate = 50
		stardust.Rotation = NumberRange.new(20, 20)
		stardust.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.05000000074505806, 0), NumberSequenceKeypoint.new(0.10000000149011612, 1), NumberSequenceKeypoint.new(0.15000000596046448, 0), NumberSequenceKeypoint.new(0.20000000298023224, 1), NumberSequenceKeypoint.new(0.25, 0), NumberSequenceKeypoint.new(0.30000001192092896, 1), NumberSequenceKeypoint.new(0.3499999940395355, 0), NumberSequenceKeypoint.new(0.4000000059604645, 1), NumberSequenceKeypoint.new(0.44999998807907104, 0), NumberSequenceKeypoint.new(0.5, 1), NumberSequenceKeypoint.new(0.550000011920929, 0), NumberSequenceKeypoint.new(0.6000000238418579, 1), NumberSequenceKeypoint.new(0.6499999761581421, 0), NumberSequenceKeypoint.new(0.699999988079071, 1), NumberSequenceKeypoint.new(0.75, 0), NumberSequenceKeypoint.new(0.800000011920929, 1), NumberSequenceKeypoint.new(0.8500000238418579, 0), NumberSequenceKeypoint.new(0.8999999761581421, 1), NumberSequenceKeypoint.new(1, 0)})
		stardust.Speed = NumberRange.new(5, 10)
		stardust.SpreadAngle = Vector2.new(-180, 180)
		stardust.Texture = "rbxassetid://1141830599"
		stardust.Name = "Stardust"
		stardust.Enabled =  false
		
		local StardustScript = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/IvoryPeriastron/StarDust.lua", "server")
		StardustScript.Name = "Stardust"
		stardust.Parent = stardust
		
		StardustScript.Parent = Hum.Parent
	end
	spawn(function()
		UntagHumanoid(Hum)
		TagHumanoid(Hum,Creator)
		Hum:TakeDamage(TotalDamage)

		--wait(.5)
	end)
end


local function Wait(para) -- bypasses the latency
	local Initial = tick()
	repeat
		Services.RunService.Heartbeat:Wait()
	until tick()-Initial >= para
end


local Seed = Random.new(tick())

local Sounds = {
	Twinkle = script:WaitForChild("Twinkle",10),
	Sparkle = script:WaitForChild("Sparkle",10),
}


local SpawnPos = Star.CFrame

local TwinkleSound = Sounds.Twinkle:Clone()
	TwinkleSound.Parent = Star
	TwinkleSound.TimePosition = 0.1
	TwinkleSound:Play()
	for i=1,60,1 do
		Star.Size = Vector3.new(1,1,1)*(i/60)*75
		Star.CFrame = SpawnPos:lerp(SpawnPos+Vector3.new(0,200,0),i/60)
		Star.Transparency = (1-(i/60))
		Services.RunService.Heartbeat:Wait()
	end
	local StarParticles = script:WaitForChild("StarParticles",10):GetChildren()
	for _,particle in pairs(StarParticles) do
		if particle:IsA("ParticleEmitter") then
			local Clone = particle:Clone()
			Clone.Parent = Star:WaitForChild("Attachment",10)
			
			local property = Clone.Size.Keypoints
			for step,value in pairs(property) do
				--print(property[step].Time,property[step].Value)
				property[step] = NumberSequenceKeypoint.new(property[step].Time,property[step].Value*Star.Size.X,property[step].Envelope)
				--print(times,value,property[times])
			end
			Clone.Size = NumberSequence.new(property)
			Clone.Enabled = true
		end
	end
	
	
	local Touch
	
	Touch = Star.Touched:Connect(function(hit)
		Damage(hit,math.huge)
	end)
	
	local StarFall = true
	local ShardContent = script:WaitForChild("ShardContent",10):GetChildren()
	
	spawn(function()
		local Shard = Create("Part"){
				Material = Enum.Material.Neon,
				Size = Vector3.new(1,1,1)*5,
				Anchored = false,
				CanCollide = false,
				Name = "StarShard",
				Locked = true,
				Transparency = 0,
				Shape = Enum.PartType.Ball,
				CFrame = Star.CFrame,
		}
		local TopAttachment = Create("Attachment"){
			Position = Vector3.new(0,Shard.Size.y/2,0),
			Name = "TopAttachment",
			Parent = Shard
		}
		local BottomAttachment = Create("Attachment"){
			Position = Vector3.new(0,-Shard.Size.y/2,0),
			Name = "BottomAttachment",
			Parent = Shard
		}
		for _,stuff in pairs(ShardContent) do
			if stuff:IsA("ParticleEmitter") then
				local particle = stuff:Clone()
				particle.Parent = Shard
			elseif stuff:IsA("Trail") then
				local trail = stuff:Clone()
				trail.Attachment0 = TopAttachment;
				trail.Attachment1 = BottomAttachment;
				trail.Parent = Shard
				trail.Enabled = true
			end
		end
		repeat
			--wait(Seed:NextNumber(.1,.5))
			local Proj = Shard:Clone()
			for _,v in pairs(Proj:GetChildren()) do
				if v:IsA("ParticleEmitter") then
					v.Enabled = true
				end
			end
			local SparkleClone = Sounds.Sparkle:Clone()
			SparkleClone.Parent = Proj
		SparkleClone:Play()
		
		local creator = Instance.new("ObjectValue")
		creator.Name = "Creator"

		local blind = Instance.new("ScreenGui")
		blind.IgnoreGuiInset = false
		blind.ResetOnSpawn = true
		blind.ZIndexBehavior = Enum.ZIndexBehavior.Global
		blind.Name = "Blind"

		local frame = Instance.new("Frame")
		frame.AnchorPoint = Vector2.new(0.5, 0.5)
		frame.BackgroundColor3 = Color3.new(1, 1, 1)
		frame.BorderSizePixel = 0
		frame.Position = UDim2.new(0.5, 0, 0.5, 0)
		frame.Size = UDim2.new(1, 0, 1, 0)
		frame.Visible = true
		frame.Parent = blind
		
		local ShardScript = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/IvoryPeriastron/StarShard.lua", "server")
		ShardScript.Name = "StarShard"
		ShardScript.Parent = Proj creator.Value = Creator or owner
		creator.Parent = ShardScript
		blind.Parent = ShardScript
			--Services.Debris:AddItem(Proj,7)
			Proj.CFrame = Star.CFrame
			Proj.Parent = workspace
			Proj:SetNetworkOwner(nil)
			Proj.Velocity = (Star.CFrame*CFrame.Angles(0,math.rad(Seed:NextInteger(0,360)),0)).lookVector*Seed:NextNumber(10,100)
			Wait(1/10)
			--Services.RunService.Heartbeat:Wait()
		until not Star or not Star.Parent or not StarFall
		--print("Supernova")
		
		local Attachment = Star:FindFirstChildOfClass("Attachment")
		for _,particles in pairs(Attachment:GetChildren()) do
			if particles:IsA("ParticleEmitter") then
				particles.Enabled = false
			end
		end
		
		wait(2)
		if Attachment then
			local Wave = Create("Part"){
				Name = "Wave",
				Size = Vector3.new(1,1,1)*0,
				Locked = true,
				Anchored = true,
				CanCollide = false,
				Material = Enum.Material.Neon,
				Transparency = 0.5,
				Color = Color3.fromRGB(255,255,255),
				CFrame = Star.CFrame*CFrame.Angles(math.rad(90),math.rad(0),math.rad(0)),
				Parent = Star
			}
			local WaveMesh = Create("SpecialMesh"){
				MeshType = Enum.MeshType.FileMesh,
				Offset = Vector3.new(0,0,0),
				Scale = Vector3.new(0,0,0),
				VertexColor = Vector3.new(1,1,1)*10^5,
				MeshId = BaseUrl.."3270017",
				TextureId = BaseUrl.."883311537",
				Parent = Wave
			}
			local SupernovaParticle = script:WaitForChild("Supernova",10)
			SupernovaParticle.Parent = Attachment

			SupernovaParticle:Emit(SupernovaParticle.Rate)
			script:WaitForChild("Explosion",10):Play()
			local OrigSize = Star.Size
			for i=1,60,1 do
				if Star and Wave then
					Star.Transparency = (i/60)
					Wave.Transparency = Star.Transparency
					Star.Size = OrigSize:Lerp(OrigSize*5.5,i/60)
					WaveMesh.Scale = Vector3.new(1,1,0):Lerp(Vector3.new(85,85,0)*8,i/60)
					Services.RunService.Heartbeat:Wait()	
				end
			end
			if Touch then Touch:Disconnect();Touch = nil end
			wait(script:WaitForChild("Explosion",10).TimeLength)
			Star:Destroy()
		end
		
	end)
	
	wait(10)
	StarFall = false
	