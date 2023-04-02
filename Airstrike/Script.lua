local Tool = script.Parent
	script.Name = "Script"
	local COOL_DOWN = 1
	
	local LastStrike = 0
	
	local Jet = {}
	Jet.__index = Jet
	
	local JET_HEIGHT = 200
	local JET_DISTANCE = 2000
	local JET_SPEED = 300
	local JET_DROP_RANGE = 550
	
	local GRAVITY = workspace.Gravity
	local WAIT_TIME = 1/60
	
	local Bomb = {}
	Bomb.__index = Bomb
	
	local BLAST_RADIUS = 19
	local BLAST_PRESSURE = 2*10^6
	
	local CreatorValue = Instance.new("ObjectValue")
	CreatorValue.Name = "creator"
	
	local function CreateBomb(jet)
		local BombPart = Instance.new("Part")
		BombPart.Name = "Effect"
		BombPart.Size = Vector3.new(3, 3, 10) * 0.5
		BombPart.CanCollide = false
		BombPart.CFrame = jet.Model.Torso.CFrame
		BombPart.Velocity = jet.Model.Torso.Velocity
	
		local Mesh = Instance.new("SpecialMesh")
		Mesh.MeshId = "rbxassetid://88782666"
		Mesh.TextureId = "rbxassetid://88782631"
		Mesh.Scale = Vector3.new(6, 6, 6)
		Mesh.Parent = BombPart
	
		local Sound = Instance.new("Sound")
		Sound.SoundId = "rbxasset://sounds/collide.wav"
		Sound.Volume = 1
		Sound.Pitch = 0.75
		Sound.Parent = BombPart
	
		game:GetService("Debris"):AddItem(BombPart, 10)
		BombPart.Parent = workspace	
	
		return BombPart
	end
	
	local function Explode(bomb)
		if not bomb.Exploded then
			bomb.Exploded = true
			bomb.Model.Anchored = true
			bomb.Model.Transparency = 1
			local Sound = bomb.Model:FindFirstChild("Sound")
			if Sound then
				Sound:Play()
			end
	
			local Explosion = Instance.new("Explosion")
			Explosion.Position = bomb.Model.Position
			Explosion.BlastPressure = BLAST_PRESSURE
			Explosion.BlastRadius = BLAST_RADIUS
			Explosion.ExplosionType = Enum.ExplosionType.CratersAndDebris
			Explosion.Hit:connect(function(hit)
				if bomb.Creator and (hit.Name == "Head" or hit.Name == "HumanoidRootPart") then
					local Humanoid = hit.Parent:FindFirstChild("Humanoid")
					if Humanoid then
						for _, v in ipairs(Humanoid:GetChildren()) do
							if v.Name == "creator" then
								v:Destroy()
							end
						end
						local NewCreator = CreatorValue:Clone()
						NewCreator.Value = bomb.Creator
						NewCreator.Parent = Humanoid
					end
				end
			end)
			Explosion.Parent = workspace
			wait(0.5)
			if bomb.Model and bomb.Model.Parent ~= nil then
				bomb.Model:Destroy()
			end
		end
	end
	
	function Bomb.new(jet)
		local self = {}
		setmetatable(self, Bomb)
	
		self.Model = CreateBomb(jet)
		self.Creator = jet.Creator
		self.Exploded = false
	
		self.Model.Touched:connect(function(hit)
			if hit and hit.Parent then
				if hit.Name ~= "Effect" and hit.Parent.Name ~= "F22 Bombing Jet" then
					Explode(self)
				end
			end
		end)
	
		return self
	end
	
	local function CreateJet(player, location)
		local Model = Instance.new("Model")
		Model.Name = "F22 Bombing Jet"
		local Part = Instance.new("Part")
		Part.Locked = true
		Part.Name = "Torso"
		Part.Transparency = 0
		Part.CanCollide = true
		Part.TopSurface = Enum.SurfaceType.Smooth
		Part.BottomSurface = Enum.SurfaceType.Smooth
		Part.Size = Vector3.new(20, 5, 20)
		Part.CFrame = CFrame.new(location + Vector3.new(0, JET_HEIGHT, 0)) * CFrame.Angles(0, math.pi*2*math.random(), 0) * CFrame.new(0, 0, JET_DISTANCE)
		Part.Parent = Model
	
		local Mesh = Instance.new("SpecialMesh")
		Mesh.MeshId = "rbxassetid://88775328"
		Mesh.TextureId = "rbxassetid://88775716"
		Mesh.Scale = Vector3.new(10, 10, 10)
		Mesh.Parent = Part
	
		local Smoke = Instance.new("Smoke")
		Smoke.RiseVelocity = 20
		Smoke.Parent = Part
	
		local HeadPart = Instance.new("Part")
		HeadPart.Locked = true
		HeadPart.Name = "Head"
		HeadPart.Transparency = 1
		HeadPart.Size = Vector3.new(0, 0, 0)
		HeadPart.Parent = Model
	
		local BodyForce = Instance.new("BodyForce")
		BodyForce.Force = Vector3.new(0, (Part:GetMass() + HeadPart:GetMass())*GRAVITY, 0)
		BodyForce.Parent = Part
	
		local Weld = Instance.new("Weld")
		Weld.Name = "Neck"
		Weld.Part0 = Part
		Weld.Part1 = HeadPart
		Weld.Parent = Part
	
		local Humanoid = Instance.new("Humanoid")
		Humanoid.MaxHealth = 5
		Humanoid.Health = 5
		Humanoid.WalkSpeed = 0
		Humanoid.Sit = true
		Humanoid.Parent = Model
	
		local JetSound = Instance.new("Sound")
		JetSound.Name = "JetScream"
		JetSound.SoundId = "rbxassetid://88862455"
		JetSound.Volume = 0.6
		game:GetService("Debris"):AddItem(JetSound, 10)
		JetSound.Parent = workspace
		delay(2, function()
			JetSound:Play()
		end)
	
		local Velocity = ((location + Vector3.new(0, JET_HEIGHT, 0)) - Part.Position).Unit*JET_SPEED
		Part.Velocity = Velocity
		HeadPart.Velocity = Velocity	
	
		Model.Parent = workspace
	
		return Model
	end
	
	local function CreateExplosion(jet)
		local Explosion = Instance.new("Explosion")
		Explosion.Position = jet.Model.Torso.Position
		Explosion.BlastPressure = 0
		Explosion.BlastRadius = 15
		Explosion.ExplosionType = Enum.ExplosionType.CratersAndDebris
		Explosion.Parent = workspace
	
		local Fire = Instance.new("Fire")
		Fire.Size = 100
		Fire.Heat = 100
		Fire.Parent = jet.Model.Torso
	
		if jet.Model.Head then
			jet.Model.Head:Destroy()
		end
	
		jet.Model.Torso.Velocity = jet.Model.Torso.Velocity + Vector3.new((math.random()-.5)*50,(math.random()-.5)*50,(math.random()-.5)*50)
		wait(3)
		if jet.Model.Torso then
			jet.Model.Torso.Transparency = 1
			jet.Model.Torso.Velocity = jet.Model.Torso.Velocity + Vector3.new((math.random()-.5)*50,(math.random()-.5)*50,(math.random()-.5)*50)
		end
		wait(3)
	end
	
	function Jet.new(player, location)
		local self = {}
		setmetatable(self, Jet)
	
		self.Model = CreateJet(player, location)	
		delay(20, function()
			self.Alive = false
			self.Model:Destroy()
		end)
		self.Creator = player
		self.TargetLocation = location
		self.Alive = true
		self.Bombs = 3
	
		self.Model.Humanoid.HealthChanged:connect(function(health)
			if self.Alive then
				if self.Model.Humanoid then
					if self.Model.Humanoid.Health <= 0 then
						self.Alive = false
						if self.Model.Torso then
							self.Model.Humanoid:Destroy()
							CreateExplosion(self.Model.Torso.Position)
						end
						self.Model:Destroy()
					end
				else
					self.Alive = false
					self.Model:Destroy()
				end
			end
		end)
	
		return self
	end
	
	function Jet:Fly()
		spawn(function()
			while self.Alive do
				if self.Model.Torso then
					if self.Bombs > 0 then
						if (self.Model.Torso.Position - self.TargetLocation).Magnitude < JET_DROP_RANGE then
							self.Bombs = self.Bombs - 1
							Bomb.new(self)
						end
					end
				end
				wait(.25)
			end
		end)
		while self.Alive do
			if self.Model.Torso then
				if self.Bombs > 0 then
					self.Model.Torso.Velocity = ((self.TargetLocation + Vector3.new(0, JET_HEIGHT, 0)) - self.Model.Torso.Position).Unit * self.Model.Torso.Velocity.Magnitude
				else
					self.Model.Torso.Velocity = self.Model.Torso.Velocity + Vector3.new(0, 10, 0)
				end
				self.Model.Torso.CFrame = CFrame.new(self.Model.Torso.Position, self.Model.Torso.Position + self.Model.Torso.Velocity)
			end
			wait(WAIT_TIME)
		end
	end
	
	local Airstrike = {}
	
	function Airstrike:Spawn(player, location)
		local LocationPart = Instance.new("Part")
		LocationPart.Name = "Effect"
		LocationPart.Anchored = true
		LocationPart.CanCollide = false
		LocationPart.Size = Vector3.new(0, 0, 0)
		LocationPart.BrickColor = BrickColor.new("Lime green")
		LocationPart.CFrame = CFrame.new(location) * CFrame.Angles(math.pi/2, 0, 0)
		local Mesh = Instance.new("SpecialMesh")
		Mesh.MeshId = "rbxassetid://3270017"
		Mesh.Scale = Vector3.new(40, 40, 1)
		Mesh.Parent = LocationPart
	
		game:GetService("Debris"):AddItem(LocationPart, 5)
		LocationPart.Parent = workspace
		spawn(function()
			while LocationPart and LocationPart.Transparency < 1 do
				LocationPart.Transparency = LocationPart.Transparency + 0.025
				wait(0.15)
			end
	
			if LocationPart then
				LocationPart:Destroy()
			end
		end)
	
		local NewJet = Jet.new(player, location)
		NewJet:Fly()
	end
	
	local OnMouseClickEvent = Instance.new("RemoteEvent")
	OnMouseClickEvent.Name = "OnMouseClick"
	OnMouseClickEvent.OnServerEvent:connect(function(player, location)
		if tick() - LastStrike > COOL_DOWN then
			LastStrike = 0
			Airstrike:Spawn(player, location)
		end
	end)
	OnMouseClickEvent.Parent = Tool
