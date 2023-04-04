local disintegreate = Instance.new("ParticleEmitter")
disintegreate.Lifetime = NumberRange.new(1, 2)
disintegreate.LightInfluence = 1
disintegreate.Rate = 100
disintegreate.RotSpeed = NumberRange.new(-300, 300)
disintegreate.Rotation = NumberRange.new(-180, 180)
disintegreate.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.1875), NumberSequenceKeypoint.new(1, 0)})
disintegreate.Speed = NumberRange.new(5, 30)
disintegreate.SpreadAngle = Vector2.new(-180, 180)
disintegreate.Texture = "rbxassetid://304846479"
disintegreate.Name = "Disintegreate"
disintegreate.Parent = script
disintegreate.Enabled = false

local Character = script.Parent

local Services = {
	Players = (game:FindService("Players") or game:GetService("Players")),
	TweenService = (game:FindService("TweenService") or game:GetService("TweenService")),
	RunService = (game:FindService("RunService") or game:GetService("RunService")),
	Debris = (game:FindService("Debris") or game:GetService("Debris"))
}

local DisintegrateParticle = script:WaitForChild("Disintegreate",10)

for _,parts in pairs(Character:GetChildren()) do
	if parts:IsA("BasePart") and parts.Transparency < 1 then
		parts.Anchored = true
			local ParticleClone = DisintegrateParticle:Clone()
			ParticleClone.Parent = parts
			ParticleClone.Color = ColorSequence.new(parts.Color)
			ParticleClone.Enabled = true
			Services.Debris:AddItem(parts,5)
			spawn(function()
				for i=0,1,.01 do
					if parts then
						parts.Transparency = i
						ParticleClone.Transparency = NumberSequence.new(i,1)
					end
					Services.RunService.Heartbeat:Wait()
				end
				if parts then parts:Destroy() end
			end)
	end
end