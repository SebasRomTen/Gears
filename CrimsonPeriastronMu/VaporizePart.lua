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

local Object = script.Parent

local Services = {
	Players = (game:FindService("Players") or game:GetService("Players")),
	TweenService = (game:FindService("TweenService") or game:GetService("TweenService")),
	RunService = (game:FindService("RunService") or game:GetService("RunService")),
	Debris = (game:FindService("Debris") or game:GetService("Debris"))
}

local DisintegrateParticle = script:WaitForChild("Disintegreate",10)

	Object.Anchored = true
		spawn(function()
			DisintegrateParticle.Parent = Object
			DisintegrateParticle.Color = ColorSequence.new(Object.Color)
			DisintegrateParticle.Enabled = true
			for i=0,1,.01 do
				Object.Transparency = i
				DisintegrateParticle.Transparency = NumberSequence.new(i,1)
				Services.RunService.Heartbeat:Wait()
			end
		Object:Destroy()
	end)

