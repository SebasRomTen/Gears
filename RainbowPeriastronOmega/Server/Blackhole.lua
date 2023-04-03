local effect = Instance.new("Sound")
effect.Looped = true
effect.SoundId = "rbxassetid://268942903"
effect.Volume = 3
effect.Name = "Effect"
effect.Parent = script

local particles = Instance.new("Folder")
particles.Name = "Particles"
particles.Parent = script

local glow = Instance.new("ParticleEmitter")
glow.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)), ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0))})
glow.Lifetime = NumberRange.new(1, 1)
glow.LockedToPart = true
glow.Rate = 3
glow.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 9), NumberSequenceKeypoint.new(1, 9)})
glow.Speed = NumberRange.new(0, 0)
glow.Texture = "rbxassetid://867619398"
glow.Name = "Glow"
glow.Parent = particles

local vortex = Instance.new("ParticleEmitter")
vortex.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(0.666667, 0, 1)), ColorSequenceKeypoint.new(0.36605700850486755, Color3.new(0, 0, 0)), ColorSequenceKeypoint.new(1, Color3.new(0.666667, 0, 1))})
vortex.Lifetime = NumberRange.new(4, 4)
vortex.LockedToPart = true
vortex.Rate = 50
vortex.RotSpeed = NumberRange.new(360, 360)
vortex.Rotation = NumberRange.new(-180, 180)
vortex.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 45), NumberSequenceKeypoint.new(0.05550000071525574, 33.82379913330078), NumberSequenceKeypoint.new(0.11100000143051147, 24.98740005493164), NumberSequenceKeypoint.new(0.1665000021457672, 18.10260009765625), NumberSequenceKeypoint.new(0.22200000286102295, 12.826600074768066), NumberSequenceKeypoint.new(0.2775000035762787, 8.859350204467773), NumberSequenceKeypoint.new(0.3330000042915344, 5.940760135650635), NumberSequenceKeypoint.new(0.38850000500679016, 3.847640037536621), NumberSequenceKeypoint.new(0.4440000057220459, 2.391040086746216), NumberSequenceKeypoint.new(0.49950000643730164, 1.4133000373840332), NumberSequenceKeypoint.new(0.5550000071525574, 0.7852579951286316), NumberSequenceKeypoint.new(0.6104999780654907, 0.40341299772262573), NumberSequenceKeypoint.new(0.6660000085830688, 0.18704399466514587), NumberSequenceKeypoint.new(0.7214999794960022, 0.07539430260658264), NumberSequenceKeypoint.new(0.7770000100135803, 0.024816300719976425), NumberSequenceKeypoint.new(0.8324999809265137, 0.005933170206844807), NumberSequenceKeypoint.new(0.8880000114440918, 0.0007930540014058352), NumberSequenceKeypoint.new(0.9434999823570251, 0.000025909199393936433), NumberSequenceKeypoint.new(0.9990000128746033, 4.6629400915574465e-14), NumberSequenceKeypoint.new(1, 0)})
vortex.Speed = NumberRange.new(0, 0)
vortex.Texture = "rbxassetid://2650753181"
vortex.Name = "Vortex"
vortex.Parent = particles

local vortex_bits = Instance.new("ParticleEmitter")
vortex_bits.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(0.666667, 0, 1)), ColorSequenceKeypoint.new(1, Color3.new(0.666667, 0, 1))})
vortex_bits.Lifetime = NumberRange.new(0.6000000238418579, 1)
vortex_bits.LightEmission = 1
vortex_bits.LockedToPart = true
vortex_bits.Rate = 4
vortex_bits.Rotation = NumberRange.new(-180, 180)
vortex_bits.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 90), NumberSequenceKeypoint.new(0.05550000071525574, 67.64759826660156), NumberSequenceKeypoint.new(0.11100000143051147, 49.97480010986328), NumberSequenceKeypoint.new(0.1665000021457672, 36.2052001953125), NumberSequenceKeypoint.new(0.22200000286102295, 25.653099060058594), NumberSequenceKeypoint.new(0.2775000035762787, 17.718700408935547), NumberSequenceKeypoint.new(0.3330000042915344, 11.881500244140625), NumberSequenceKeypoint.new(0.38850000500679016, 7.6952900886535645), NumberSequenceKeypoint.new(0.4440000057220459, 4.782080173492432), NumberSequenceKeypoint.new(0.49950000643730164, 2.826590061187744), NumberSequenceKeypoint.new(0.5550000071525574, 1.570520043373108), NumberSequenceKeypoint.new(0.6104999780654907, 0.8068259954452515), NumberSequenceKeypoint.new(0.6660000085830688, 0.37408900260925293), NumberSequenceKeypoint.new(0.7214999794960022, 0.15078899264335632), NumberSequenceKeypoint.new(0.7770000100135803, 0.04963260143995285), NumberSequenceKeypoint.new(0.8324999809265137, 0.011866300366818905), NumberSequenceKeypoint.new(0.8880000114440918, 0.0015861099818721414), NumberSequenceKeypoint.new(0.9434999823570251, 0.000051818500651279464), NumberSequenceKeypoint.new(0.9990000128746033, 9.325870018719526e-14), NumberSequenceKeypoint.new(1, 0)})
vortex_bits.Speed = NumberRange.new(0, 0)
vortex_bits.Texture = "rbxassetid://1084969783"
vortex_bits.Name = "Vortex_Bits"
vortex_bits.Parent = particles

local creator = Instance.new("ObjectValue")
creator.Name = "Creator"
creator.Parent = script

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

function IsInTable(Table,Value)
	for _,v in pairs(Table) do
		if v == Value then
			return true
		end
	end
	return false
end

function IsTeamMate(Player1, Player2)
	return (Player1 and Player2 and not Player1.Neutral and not Player2.Neutral and Player1.TeamColor == Player2.TeamColor)
end

local Black_Hole = script.Parent

local Creator = script:WaitForChild("Creator",5)

local ParticleFolder = script:WaitForChild("Particles",5)

local CenterAttachment = Create("Attachment"){
	Position = Vector3.new(0,0,0),
	Parent = Black_Hole
}

local Radius = 50

local Services = {
	Players = (game:FindService("Players") or game:GetService("Players")),
	TweenService = (game:FindService("TweenService") or game:GetService("TweenService")),
	RunService = (game:FindService("RunService") or game:GetService("RunService")),
	Debris = (game:FindService("Debris") or game:GetService("Debris")),
	ServerScriptService = (game:FindService("ServerScriptService") or game:GetService("ServerScriptService"))
}

local function Wait(para) -- bypasses the latency
	local Initial = tick()
	repeat
		Services.RunService.Heartbeat:Wait()
	until tick()-Initial >= para
end

for _,particles in pairs(ParticleFolder:GetChildren()) do
	if particles:IsA("ParticleEmitter") then
		particles.Parent = CenterAttachment
		particles.Enabled = true
	end
end

local EffectSound = script:WaitForChild("Effect")
EffectSound.Parent = Black_Hole
EffectSound:Play()

local VeloForces = {}

local AffectedParts = {}

local Pulling = true

delay(5,function()
	Pulling = false
	for _,forces in pairs(VeloForces) do
		if forces then
			forces:Destroy()
		end
	end
	Black_Hole:Destroy()
end)

while Black_Hole and Black_Hole:IsDescendantOf(workspace) and Pulling do
	--spawn(function()
		local NegativeRegion = (Black_Hole.Position - Vector3.new(Radius,Radius,Radius))
		local PositiveRegion = (Black_Hole.Position + Vector3.new(Radius,Radius,Radius))
		local Region = Region3.new(NegativeRegion, PositiveRegion)
		local Parts = workspace:FindPartsInRegion3WithIgnoreList(Region,{Creator.Value.Character,Black_Hole},math.huge)
		for _,hit in pairs(Parts) do
			if hit and hit.Parent and not hit.Anchored and (hit.CFrame.p-Black_Hole.CFrame.p).Magnitude <= Radius and not IsInTable(AffectedParts,hit) and not hit:FindFirstAncestorWhichIsA("Tool") and not hit:FindFirstAncestorWhichIsA("Accoutrement") and not hit.Parent:FindFirstChildOfClass("ForceField") and not IsTeamMate(Creator.Value,Services.Players:GetPlayerFromCharacter(hit.Parent)) then
				AffectedParts[#AffectedParts+1] = hit
				local Pull = Create("BodyVelocity"){
					MaxForce = Vector3.new(1,1,1)*math.huge,
					Velocity = ((Black_Hole.CFrame.p-hit.CFrame.p).Unit*25),
					Name = "Pull",
					Parent = hit
				}
				VeloForces[#VeloForces+1] = Pull
				delay(.5,function()
				
						for index,v in pairs(VeloForces) do
							if v == Pull then
								table.remove(AffectedParts,index)
								if Pull then
									Pull:Destroy()
								end
							end
						end
						for index,v in pairs(AffectedParts) do
							if v == hit then
								table.remove(AffectedParts,index)
							end
						end
					
				end)
				--Services.Debris:AddItem(Pull,.5)
			end
		end
	--end)
	Wait(1/30)
	--Services.RunService.Heartbeat:Wait()
end
