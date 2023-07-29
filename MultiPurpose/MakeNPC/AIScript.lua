--Made by Luckymaxer
--Updated for R15 avatar by StarWars

Model = script.Parent

Players = game:GetService("Players")
Debris = game:GetService("Debris")
RunService = game:GetService("RunService")

Create = function(className, defaultParent)
	return function(propList)
		local new = Instance.new(className)
		local parent = defaultParent

		for index, value in next, propList do
			if type(index)=='string' then
				if index == 'Parent' then
					parent = value
				else
					new[index] = value
				end
			elseif type(index)=='number' then
				value.Parent = new
			end
		end

		new.Parent = parent

		return new
	end
end

Functions = {

	CheckTableForString = (function(Table, String)
		for i, v in pairs(Table) do
			if string.lower(v) == string.lower(String) then
				return true
			end
		end
		return false
	end),

	CheckIntangible = (function(Hit)
		local ProjectileNames = {"Water", "Arrow", "Projectile", "Effect", "Rail", "Laser", "Ray", "Bullet", "ParticlePart"}
		if Hit and Hit.Parent then
			if (Hit.Transparency >= 1 and not Hit.CanCollide) or Functions.CheckTableForString(ProjectileNames, Hit.Name) then
				return true
			end
			local ObjectParent = Hit.Parent
			local Character = ObjectParent.Parent
			local Humanoid = Character:FindFirstChild("Humanoid")
			if Humanoid and Humanoid.Health > 0 and ObjectParent:IsA("Hat") then
				return true
			end
		end
		return false
	end),

	CastRay = (function(StartPos, Vec, Length, Ignore, DelayIfHit)
		local RayHit, RayPos, RayNormal = game:GetService("Workspace"):FindPartOnRayWithIgnoreList(Ray.new(StartPos, Vec * Length), Ignore)
		if RayHit and Functions.CheckIntangible(RayHit) then
			if DelayIfHit then
				wait()
			end
			RayHit, RayPos, RayNormal = Functions.CastRay((RayPos + (Vec * 0.01)), Vec, (Length - ((StartPos - RayPos).magnitude)), Ignore, DelayIfHit)
		end
		return RayHit, RayPos, RayNormal
	end),

	CheckTableForInstance = (function(Table, Instance)
		for i, v in pairs(Table) do
			if v == Instance then
				return true
			end
		end
		return false
	end),

	GetAllConnectedParts = (function(Object)
		local Parts = {}
		local function GetConnectedParts(Object)
			for i, v in pairs(Object:GetConnectedParts()) do
				local Ignore = false
				for ii, vv in pairs(Parts) do
					if v == vv then
						Ignore = true
					end
				end
				if not Ignore then
					table.insert(Parts, v)
					GetConnectedParts(v)
				end
			end
		end
		GetConnectedParts(Object)
		return Parts
	end),

	GetTotalParts = (function(MaxParts, PossibleParts, Parts)
		if MaxParts < PossibleParts then
			return MaxParts
		elseif Parts >= MaxParts then
			return 0
		elseif MaxParts >= PossibleParts then
			local PartCount = (MaxParts - PossibleParts)
			if Parts <= MaxParts then
				PartCount = (MaxParts - Parts)
				if PartCount > PossibleParts then
					return PossibleParts
				else
					return PartCount
				end
			elseif PartCount >= PossibleParts then
				return PossibleParts
			else
				return PartCount
			end
		end
	end),

	GetParts = (function(Region, MaxParts, Ignore)
		local Parts = {}
		local RerunFailed = false
		while #Parts < MaxParts and not RerunFailed do
			local Region = Region
			local PossibleParts = Functions.GetTotalParts(MaxParts, 100, #Parts)
			local PartsNearby = game:GetService("Workspace"):FindPartsInRegion3WithIgnoreList(Region, Ignore, PossibleParts)
			if #PartsNearby == 0 then
				RerunFailed = true
			else
				for i, v in pairs(PartsNearby) do
					table.insert(Parts, v)
					table.insert(Ignore, v)
				end
			end
		end
		return Parts
	end),

	IsTeamMate = (function(Player1, Player2)
		return (Player1 and Player2 and not Player1.Neutral and not Player2.Neutral and Player1.TeamColor == Player2.TeamColor)
	end),

	TagHumanoid = (function(humanoid, player)
		local Creator_Tag = Instance.new("ObjectValue")
		Creator_Tag.Name = "creator"
		Creator_Tag.Value = player
		Debris:AddItem(Creator_Tag, 2)
		Creator_Tag.Parent = humanoid
	end),

	UntagHumanoid = (function(humanoid)
		for i, v in pairs(humanoid:GetChildren()) do
			if v:IsA("ObjectValue") and v.Name == "creator" then
				v:Destroy()
			end
		end
	end),
}

Rate = (1 / 60)

BasePart = Create("Part"){
	Shape = Enum.PartType.Block,
	Material = Enum.Material.Plastic,
	TopSurface = Enum.SurfaceType.Smooth,
	BottomSurface = Enum.SurfaceType.Smooth,
	Size = Vector3.new(0.2, 0.2, 0.2),
	CanCollide = true,
	Locked = true,
	Anchored = false,
}

Figures = {}

function GetNearbyObjects(Region, Player, Ignore)
	local IgnoreList = (Ignore or {})
	table.insert(IgnoreList, ((Player and Player.Character) or nil))
	for i, v in pairs(Players:GetChildren()) do
		if v:IsA("Player") and v ~= Player and v.Character and v.Character.Parent and Functions.IsTeamMate(Player, v) then
			table.insert(IgnoreList, v.Character)
		end
	end
	return Functions.GetParts(Region, 500, IgnoreList)
end

function GetClosestEnemy(Table)
	local Player = (Table.Creator or nil)
	local Ignore = (Table.Ignore or {})
	local ChaseDistance = (Table.ChaseDistance or 150)
	local Origin = Table.Origin
	if not Origin then
		return
	end
	local PlayersNearby = {}
	for i, v in pairs(Players:GetChildren()) do
		if v:IsA("Player") and ((Player and (v ~= Player and not Functions.IsTeamMate(Player, v))) or not Player) and v.Character then
			local character = v.Character
			local ForceField = nil
			for i, v in pairs(character:GetChildren()) do
				if v:IsA("ForceField") then
					ForceField = v
					break
				end
			end
			if not ForceField then
				local torso = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
				table.insert(PlayersNearby, v)
			end
		end
	end
	local ClosestPlayer = {Player = nil, Distance = ChaseDistance}
	for i, v in pairs(PlayersNearby) do
		local character = v.Character
		local torso = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
		if torso then
			local DistanceApart = (Origin - torso.Position).Magnitude
			if DistanceApart < ClosestPlayer.Distance then
				ClosestPlayer.Player = character
				ClosestPlayer.Distance = DistanceApart
			end
		end
	end
	if not ClosestPlayer.Player then
		local HumanoidsHit = {}
		local NPCsNearby = {}
		local ChaseRadius = ClosestPlayer.Distance
		local ChaseRegion = Region3.new((Origin - Vector3.new(ChaseRadius, ChaseRadius, ChaseRadius)), (Origin + Vector3.new(ChaseRadius, ChaseRadius, ChaseRadius)))
		for i, v in pairs(GetNearbyObjects(ChaseRegion, Player, Ignore)) do
			if v and v.Parent then
				local character = v.Parent
				local creator = character:FindFirstChild("Creator")
				local humanoid = character:FindFirstChild("Humanoid")
				if (not creator or (creator and creator.Value ~= Player)) and humanoid and humanoid.Health > 0 then
					local player = Players:GetPlayerFromCharacter(character)
					if not player then
						if not Functions.CheckTableForInstance(HumanoidsHit, humanoid) then
							local ForceField = nil
							for ii, vv in pairs(character:GetChildren()) do
								if vv:IsA("ForceField") then
									ForceField = vv
									break
								end
							end
							if not ForceField then
								table.insert(NPCsNearby, character)
							end
						end
					end
				end
			end
		end
		for i, v in pairs(NPCsNearby) do
			local torso = v:FindFirstChild("Torso") or v:FindFirstChild("UpperTorso")
			if torso then
				local DistanceApart = (Origin - torso.Position).Magnitude
				if DistanceApart < ClosestPlayer.Distance then
					ClosestPlayer.Player = v
					ClosestPlayer.Distance = DistanceApart
				end
			end
		end
	end
	if ClosestPlayer.Player then
		local character = ClosestPlayer.Player
		local humanoid = character:FindFirstChild("Humanoid")
		local torso = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
		if humanoid and humanoid.Health > 0 and torso then
			return character
		end
	end
end

function SecureJump(Table)
	local Humanoid = Table.Humanoid
	local Torso = Table.Torso
	if not Humanoid or Humanoid.Jump or not Torso then
		return
	end
	local TargetPoint = Torso.Velocity.Unit
	local Blockage, BlockagePos = Functions.CastRay((Torso.CFrame + CFrame.new(Torso.Position, Vector3.new(TargetPoint.X, Torso.Position.Y, TargetPoint.Z)).lookVector * (Torso.Size.Z / 2)).p, Torso.CFrame.lookVector, (Torso.Size.Z * 2.5), {Figure, (((Creator and Creator.Value and Creator.Value:IsA("Player") and Creator.Value.Character) and Creator.Value.Character) or nil)}, false)
	local Jumpable = false
	if Blockage then
		Jumpable = true
		if Blockage:IsA("Terrain") then
			local CellPos = Blockage:WorldToCellPreferSolid((BlockagePos - Vector3.new(0, 2, 0)))
			local CellMaterial, CellShape, CellOrientation = Blockage:GetCell(CellPos.X, CellPos.Y, CellPos.Z)
			if CellMaterial == Enum.CellMaterial.Water then
				Jumpable = false
			end
		elseif Blockage.Parent:FindFirstChild("Humanoid") then
			Jumpable = false
		end
	end
	if Jumpable then
		Humanoid.Jump = true
	end
end

function IncludeAI(Child)
	if not Child or not Child.Parent then
		return
	end
	local Player = Players:GetPlayerFromCharacter(Child)
	if Player then
		return
	end
	for i, v in pairs(Figures) do
		if v.Figure == Child then
			return
		end
	end
	local Figure = {Figure = Child, TouchDebounce = false, Connections = {}, LastMove = 0}
	local Humanoid = Child:FindFirstChild("Humanoid")
	local Head = Child:FindFirstChild("Head")
	local Torso = Child:FindFirstChild("Torso") or Child:FindFirstChild("UpperTorso")
	if not Humanoid or not Humanoid:IsA("Humanoid") or Humanoid.Health == 0 or not Head or not Torso then
		return
	end
	local Neck = Torso:FindFirstChild("Neck")
	if not Neck then
		--return
	end
	for i, v in pairs({Humanoid, Head, Torso, Neck}) do
		Figure[v.Name] = v
	end
	--local AIConfiguration = Child:FindFirstChild("AIConfiguration")
	--if AIConfiguration then
		for i, v in pairs(Child:GetChildren()) do
			if string.find(string.lower(v.ClassName), string.lower("Value")) then
				Figure[v.Name] = v
			end
		end
	--end
	if Figure.NormalSpeed then
		Humanoid.WalkSpeed = Figure.NormalSpeed.Value
	end
	Figure.LastMove = (tick() - (math.random() * Figure.MoveDelay.Value))
	local HumanoidChanged = Humanoid:GetPropertyChangedSignal("Sit"):Connect(function()
		if Humanoid.Sit then
			Humanoid.Sit = false
			Humanoid.Jump = true
		end
	end)
	local HumanoidDied = Humanoid.Died:connect(function()
		Debris:AddItem(Child, 1.5)
	end)
	local FigureRemoved = Child.Changed:connect(function(Property)
		if Property == "Parent" and not Child.Parent then
			for i, v in pairs(Figures) do
				if v == Figure then
					for ii, vv in pairs(v.Connections) do
						if vv then
							vv:disconnect()
						end
					end
					table.remove(Figures, i)
				end
			end
		end
	end)
	for i ,v in pairs({HumanoidChanged, FigureRemoved}) do
		table.insert(Figure.Connections, v)
	end
	for i, v in pairs(Child:GetChildren()) do
		if v:IsA("BasePart") then
			local TouchedConnection
			TouchedConnection = v.Touched:connect(function(Hit)
				if not Hit or not Hit.Parent or Figure.TouchDebounce then
					return
				end
				local Connected = false
				local ConnectedParts = v:GetConnectedParts()
				if #ConnectedParts <= 1 then
					return
				end
				for i, v in pairs(ConnectedParts) do
					if v == Torso then
						Connected = true
					end
				end
				if not Connected then
					return
				end
				local character = Hit.Parent
				if character:IsA("Accessory") then
					character = character.Parent
				end
				if (Figure.Chase.Value and character ~= Figure.Target.Value) then
					return
				end
				local player = Players:GetPlayerFromCharacter(character)
				local CreatorValue = Figure.Creator.Value
				if not CreatorValue then
					return
				end
				local CreatorPlayer = ((CreatorValue:IsA("Player") and CreatorValue) or Players:GetPlayerFromCharacter(CreatorValue))
				if player then
					if player == CreatorPlayer then
						return
					end
					if player and CreatorPlayer and Functions.IsTeamMate(CreatorPlayer, player) then
						return
					end
				end
				local creator = character:FindFirstChild("Creator")
				if creator and creator:IsA("ObjectValue") and creator.Value == CreatorValue then
					return
				end
				local humanoid = character:FindFirstChild("Humanoid")
				if not humanoid or not humanoid:IsA("Humanoid") or humanoid.Health == 0 then
					return
				end
				Figure.TouchDebounce = true
				Functions.UntagHumanoid(humanoid)
				Functions.TagHumanoid(humanoid, CreatorPlayer)
				humanoid:TakeDamage(Figure.Damage.Value)
				wait(Figure.DamageDelay.Value)
				Figure.TouchDebounce = false
			end)
			table.insert(Figure.Connections, TouchedConnection)
		end
	end
	table.insert(Figures, Figure)
end

function ControlAI()
	if AIControl then
		AIControl:disconnect()
	end
	local function FunctionAI(Table)
		if not Table or not Table.Figure or not Table.Figure.Parent then
			return
		end
		local Figure = Table.Figure
		local Creator = Table.Creator.Value
		if Creator and Creator.Parent then
			if Players:GetPlayerFromCharacter(Creator) then
				Creator = Players:GetPlayerFromCharacter(Creator)
			end
		end
		if not Creator then
			return
		end
		local Character = Creator.Character
		if not Character or not Character.Parent then
			return
		end
		local Humanoid = Character:FindFirstChild("Humanoid")
		local Torso = Character:FindFirstChild("Torso") or Character:FindFirstChild("UpperTorso")
		if not Humanoid or Humanoid.Health == 0 or not Torso then
			return
		end
		local Disabled = Figure:FindFirstChild("Disabled")
		if Disabled then
			return
		end
		local Now = tick()
		spawn(function()
			SecureJump(Table)
		end)
		local Mode = Table.Mode.Value
		local DistanceApart = (Torso.Position - Table.Torso.Position).Magnitude
		if DistanceApart > Table.MaxDistance.Value then
			Table.Mode.Value = ((Table.Follow.Value and "Follow") or "Wander")
		end
		if Mode == "Follow" and not Table.Follow.Value then
			Table.Mode.Value = "Wander"
		end
		if not Table.Target.Value and Table.Chase.Value then
			local FigureTorso = Figure:FindFirstChild("Torso") or Figure:FindFIrstChild("UpperTorso")
			if FigureTorso then
				local Enemy = GetClosestEnemy({Ignore = {Character, Figure}, ChaseDistance = Table.ChaseDistance.Value, Origin = FigureTorso.Position, Creator = Creator})
				if Enemy then
					Table.Target.Value = Enemy
					Table.Mode.Value = "Attack"
				end
			end
		end
		if Mode == "Follow" then
			local Follow = Table.Follow.Value
			if Follow then
				if Follow:IsA("Player") and Follow.Character and Follow.Character.Parent then
					Follow = Follow.Character
				end
				local FollowHumanoid = Follow:FindFirstChild("Humanoid")
				local FollowTorso = Follow:FindFirstChild("Torso") or Follow:FindFirstChild("UpperTorso")
				local FollowDistance = (Table.Torso.Position - FollowTorso.Position).Magnitude
				Table.Humanoid.WalkSpeed = ((FollowDistance >= 10 and (Table.NormalSpeed.Value * 2)) or Table.NormalSpeed.Value)
				if not FollowHumanoid or FollowHumanoid.Health == 0 or not FollowTorso then
					return
				end
				--if FollowDistance > 5 then
					if Table.GeneralOffset.Value then
						Table.Humanoid:MoveTo((CFrame.new(FollowTorso.Position) * CFrame.new(Table.Offset.Value)).Position)
					else
						Table.Humanoid:MoveTo((FollowTorso.CFrame * CFrame.new(Table.Offset.Value)).Position)
					end
				--end
			end
		elseif Mode == "MoveTo" then
			local Offset = Table.MoveOffset.Value
			local RandomOffset = (Offset * 1000)
			RandomOffset = (Vector3.new(math.random(-RandomOffset.X, RandomOffset.X), math.random(-RandomOffset.Y, RandomOffset.Y), math.random(-RandomOffset.Z, RandomOffset.Z)) * 0.001)
			local DesiredPosition = (Table.TargetPos.Value + RandomOffset)
			Table.Humanoid:MoveTo(DesiredPosition)
			Table.Mode.Value = "Nothing"
			Table.LastMove = Now
			if not Table.Target.Value then
				Table.Mode.Value = "Wander"
			else
				Table.Mode.Value = "Attack"
			end
		elseif Mode == "Attack" then
			local TargetCharacter = Table.Target.Value
			if TargetCharacter and TargetCharacter.Parent then
				local TargetHumanoid = TargetCharacter:FindFirstChild("Humanoid")
				local TargetTorso = TargetCharacter:FindFirstChild("Torso") or TargetCharacter:FindFirstChild("UpperTorso")
				local creator = TargetCharacter:FindFirstChild("Creator")
				if Table.Chase.Value then
					if TargetHumanoid and TargetHumanoid.Health > 0 and TargetTorso and (not creator or (creator and Table.Creator.Value ~= creator.Value and not Functions.IsTeamMate(Table.Creator.Value, creator.Value))) then
						if Table.ChaseRange.Value > 0 then
							local Direction = CFrame.new(Table.Torso.Position, Vector3.new(TargetTorso.Position.X, Table.Torso.Position.Y, TargetTorso.Position.Z))
							local ChasePosition = (CFrame.new(TargetTorso.Position) - Direction.lookVector * Table.ChaseRange.Value).p
							local Distance = (Table.Torso.Position - TargetTorso.Position).Magnitude
							local BodyGyro = Create("BodyGyro"){
								maxTorque = Vector3.new(math.huge, math.huge, math.huge),
								cframe = Direction,
							}
							Debris:AddItem(BodyGyro, Rate)
							BodyGyro.Parent = Table.Torso
							Table.Humanoid:MoveTo(ChasePosition)
						else
							local TargetDistance = (Table.Torso.Position - TargetTorso.Position).Magnitude
							Table.Humanoid.WalkSpeed = ((TargetDistance >= 10 and (Table.ChaseSpeed.Value * 2)) or Table.ChaseSpeed.Value)
							local ChaseRange = Vector3.new(((math.random() - 0.5) * 5), ((math.random() - 0.5) * 5), ((math.random() - 0.5) * 5))
							Table.Humanoid:MoveTo((TargetTorso.CFrame * CFrame.new(ChaseRange)).p)
						end
					else
						Table.Target.Value = nil
						Table.Mode.Value = "Follow"
					end
				end
			else
				Table.Target.Value = nil
				Table.Mode.Value = "Follow"
			end
		elseif Mode == "Wander" then
			if (Now - Table.LastMove) >= Table.MoveDelay.Value then
				Table.Humanoid:MoveTo(Table.Torso.Position + Vector3.new(math.random(-Table.WanderRange.Value.X, Table.WanderRange.Value.X), 0, math.random(-Table.WanderRange.Value.Z, Table.WanderRange.Value.Z)))
				Table.LastMove = Now
			end
		elseif Mode == "Nothing" then
			if (Now - Table.LastMove) >= 30 then
				Table.Mode.Value = ((Table.Follow.Value and "Follow") or "Wander")
			end
		end
		local HumanoidState = Table.Humanoid:GetState().Name
		if Table.Mode.Value ~= "Follow" and HumanoidState == "RunningNoPhysics" and Table.AutoWander.Value and not Table.Target.Value then
			Table.Mode.Value = "Wander"
		end
	end
	AIControl = RunService.Stepped:connect(function()
		local _, Time = wait(Rate)
		for i, v in pairs(Figures) do
			spawn(function()
				FunctionAI(v)
			end)
		end
	end)
end

if Model:FindFirstChild("Humanoid") then
	IncludeAI(Model)
else
	for i, v in pairs(Model:GetChildren()) do
		IncludeAI(v)
	end
	Model.ChildAdded:connect(function(Child)
		IncludeAI(Child)
	end)
end

ControlAI()