local crumble = Instance.new("Sound")
crumble.SoundId = "rbxassetid://1682505361"
crumble.Volume = 2
crumble.Name = "Crumble"
crumble.Parent = script

local explosion = Instance.new("Sound")
explosion.SoundId = "rbxassetid://315775189"
explosion.Volume = 3
explosion.Name = "Explosion"
explosion.Parent = script

local creator = Instance.new("ObjectValue")
creator.Name = "Creator"
creator.Parent = script

local smashsmoke = Instance.new("ParticleEmitter")
smashsmoke.Acceleration = Vector3.new(0, 10, 0)
smashsmoke.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(0.509804, 0.509804, 0.509804)), ColorSequenceKeypoint.new(1, Color3.new(0.509804, 0.509804, 0.509804))})
smashsmoke.Drag = 3
smashsmoke.EmissionDirection = Enum.NormalId.Bottom
smashsmoke.Lifetime = NumberRange.new(1, 3)
smashsmoke.LightInfluence = 1
smashsmoke.Rate = 200
smashsmoke.RotSpeed = NumberRange.new(-200, 200)
smashsmoke.Rotation = NumberRange.new(-180, 180)
smashsmoke.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.30000001192092896, 10), NumberSequenceKeypoint.new(1, 10)})
smashsmoke.Speed = NumberRange.new(80, 80)
smashsmoke.SpreadAngle = Vector2.new(180, 180)
smashsmoke.Texture = "rbxassetid://528256032"
smashsmoke.Name = "SmashSmoke"
smashsmoke.Parent = script

---

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

local function VisualizeRay(ray,RayLength)
	local RayCast = Create("Part"){
		Material = Enum.Material.Neon,
		Color = Color3.new(0,1,0),
		Size = Vector3.new(0.3,0.3,(RayLength or 5)),
		CFrame = CFrame.new(ray.Origin, ray.Origin+ray.Direction) * CFrame.new(0, 0, -(RayLength or 5) / 2),
		Anchored = true,
		CanCollide = false,
		Parent = workspace
	}
	game:GetService("Debris"):AddItem(RayCast,5)
end

local Rock = script.Parent

local Seed = Random.new(tick())

local Creator = script:WaitForChild("Creator",5).Value

local RockCollection = {Rock}

function RayCast(Pos, Dir, Max, IgnoreList)
	return game:GetService("Workspace"):FindPartOnRayWithIgnoreList(Ray.new(Pos, Dir.unit * (Max or 999.999)), IgnoreList) 
end

local RockTemplate = Rock:Clone()
RockTemplate:ClearAllChildren()

local SurroundingRockCount = 30

for i=1,SurroundingRockCount,1 do
	local Position = ((CFrame.new(Rock.CFrame.p+Vector3.new(0,5,0))*CFrame.Angles(0,math.rad((i*(360/SurroundingRockCount))),0))*CFrame.new(0,0,15)).p
	local hit,pos = RayCast(Position,((Position + Vector3.new(0,-1,0))-Position).Unit,10,RockCollection)
	--VisualizeRay(Ray.new(Position,((Position + Vector3.new(0,-1,0))-Position).Unit),10)
	--print(hit)
	if hit then
		local RockBase = RockTemplate:Clone()
		RockCollection[#RockCollection+1] = RockBase
		RockBase.Size = Vector3.new(1,1,1)*Seed:NextNumber(7,9)
		RockBase.Color = hit.Color
		RockBase.CFrame = CFrame.new(pos)*CFrame.Angles(math.rad(Seed:NextInteger(0,360)),math.rad(Seed:NextInteger(0,360)),math.rad(Seed:NextInteger(0,360)))
		RockBase.Parent = workspace
	end
end

local Smoke = script:WaitForChild("SmashSmoke",5)
Smoke.Color = ColorSequence.new(Rock.Color)
Smoke.Parent = Rock
Smoke:Emit(Smoke.Rate)

local ExplosionSound = script:WaitForChild("Explosion",5)
ExplosionSound.Parent = Rock
ExplosionSound:Play()

local CrumnbleSound = script:WaitForChild("Crumble",5)
CrumnbleSound.Parent = Rock
CrumnbleSound:Play()

delay(4,function()
	for _,rocks in pairs(RockCollection) do
		rocks:Destroy()
	end
	Rock:Destroy()
end)
