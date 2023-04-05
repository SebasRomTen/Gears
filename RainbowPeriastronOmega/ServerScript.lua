--Rescripted by TakeoHonorable
--Revamped Periastrons: The Periastron of Rainbow Maelstrom
--The leader of the bunch, you know it well (get the reference?)

MisL = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/MisL/main/source.lua"))()

local shard_content = Instance.new("Folder")
shard_content.Name = "ShardContent"
shard_content.Parent = script

local trail = Instance.new("Trail")
trail.FaceCamera = true
trail.Lifetime = 1
trail.LightEmission = 1
trail.MinLength = 0
trail.Texture = "rbxassetid://165424187"
trail.TextureLength = 0.8999999761581421
trail.Parent = shard_content

local stars = Instance.new("ParticleEmitter")
stars.Drag = 2.75
stars.Lifetime = NumberRange.new(0.5, 1)
stars.LightEmission = 1
stars.Rate = 50
stars.Rotation = NumberRange.new(20, 20)
stars.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.05000000074505806, 0), NumberSequenceKeypoint.new(0.10000000149011612, 1), NumberSequenceKeypoint.new(0.15000000596046448, 0), NumberSequenceKeypoint.new(0.20000000298023224, 1), NumberSequenceKeypoint.new(0.25, 0), NumberSequenceKeypoint.new(0.30000001192092896, 1), NumberSequenceKeypoint.new(0.3499999940395355, 0), NumberSequenceKeypoint.new(0.4000000059604645, 1), NumberSequenceKeypoint.new(0.44999998807907104, 0), NumberSequenceKeypoint.new(0.5, 1), NumberSequenceKeypoint.new(0.550000011920929, 0), NumberSequenceKeypoint.new(0.6000000238418579, 1), NumberSequenceKeypoint.new(0.6499999761581421, 0), NumberSequenceKeypoint.new(0.699999988079071, 1), NumberSequenceKeypoint.new(0.75, 0), NumberSequenceKeypoint.new(0.800000011920929, 1), NumberSequenceKeypoint.new(0.8500000238418579, 0), NumberSequenceKeypoint.new(0.8999999761581421, 1), NumberSequenceKeypoint.new(1, 0)})
stars.Speed = NumberRange.new(5, 10)
stars.SpreadAngle = Vector2.new(-180, 180)
stars.Texture = "rbxassetid://1141830599"
stars.Name = "Stars"
stars.Parent = shard_content

local sparkle = Instance.new("Sound")
sparkle.Looped = true
sparkle.SoundId = "rbxassetid://2018386608"
sparkle.Volume = 0.10000000149011612
sparkle.Name = "Sparkle"
sparkle.Parent = script

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

local Seed = Random.new(tick())

local Tool = script.Parent
shared.Tool = Tool
_G.Tool = Tool
Tool.Enabled = true
local Handle = Tool:WaitForChild("Handle",10)
local Region = MisL.Http.returnData("https://raw.githubusercontent.com/SebasRomTen/Gears/main/RegionModule.lua")
local PointLight = Handle:WaitForChild("PointLight",10)
local Sparkles = Handle:FindFirstChildOfClass("Sparkles")
local Animations = Tool:WaitForChild("Animations",10)

local Deletables = {} --Send all deletables here

local Sounds = {
	LungeSound = Handle:WaitForChild("LungeSound",10),
	SlashSound = Handle:WaitForChild("SlashSound",10),
}

local PeriastronNames = {
	"Azure",
	"Grimgold",
	"Crimson",
	"Chartreuse",
	"Amethyst",
	"Ivory",
	"Noir",
}

local PeriastronNamesAlt = {
	"Azure",
	"Grimgold",
	"Crimson",
	"Chartreuse",
	"Amethyst",
	"Ivory",
	"Noir",
	"Hazel",
	"Fuchsia"
}

local AttackAnims

local Services = {
	Players = (game:FindService("Players") or game:GetService("Players")),
	TweenService = (game:FindService("TweenService") or game:GetService("TweenService")),
	RunService = (game:FindService("RunService") or game:GetService("RunService")),
	Debris = (game:FindService("Debris") or game:GetService("Debris")),
	ServerScriptService = (game:FindService("ServerScriptService") or game:GetService("ServerScriptService"))
}

local Components = {
	PeriSparkle = Handle:WaitForChild("Sparkles",10),
	PeriTrail = Handle:WaitForChild("Trail",10),
	MouseInput = Tool:WaitForChild("MouseInput",10)
}
Components.PeriSparkle.Enabled = true
Components.PeriTrail.Enabled = false
PointLight.Enabled = true

local Player,Character,Humanoid,Root,Torso

local Properties = {
	BaseDamage = 40,
	SpecialCooldown = 90,
	GrimgoldRange = 40,
}

local Remote = (Tool:FindFirstChild("Remote") or Instance.new("RemoteEvent"));Remote.Name = "Remote";Remote.Parent = Tool



local Grips = {
	Normal = Tool:WaitForChild("NormalGrip").Value,
	--BackR6 = Tool:WaitForChild("BackGrip").Value,
	--BackR15 = Tool:WaitForChild("BackGrip").Value+Vector3.new(-.7,0,-.7)
}
Tool.Grip = Grips.Normal

local function Wait(para) -- bypasses the latency
	local Initial = tick()
	repeat
		Services.RunService.Heartbeat:Wait()
	until tick()-Initial >= para
end

function RayCast(Pos, Dir, Max, IgnoreList)
	return game:GetService("Workspace"):FindPartOnRayWithIgnoreList(Ray.new(Pos, Dir.unit * (Max or 999.999)), IgnoreList) 
end

function IsInTable(Table,Value)
	for _,v in pairs(Table) do
		if v == Value then
			return true
		end
	end
	return false
end

local function HasPeri(PeriName)
	return (Player:FindFirstChild("Backpack") and Player:FindFirstChild("Backpack"):FindFirstChild(PeriName.."Periastron")) or false
end

local function HasFullSet()
	for _,names in pairs(PeriastronNames) do
		if not HasPeri(names) then
			return false
		end
	end
	return true
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

function UntagHumanoid(humanoid)
	for i, v in pairs(humanoid:GetChildren()) do
		if v:IsA("ObjectValue") and v.Name == "creator" then
			v:Destroy()
		end
	end
end


function GetHumanoidsInRange(Range)
	local RecordedHumanoids = {}
	for _,parts in pairs(Region.new(Root.CFrame,Vector3.new(1,1,1)*Range):Cast(Character)) do
		if parts and parts.Parent and string.find(string.lower(parts.Name),"torso") or string.find(string.lower(parts.Name),"root") and (parts.CFrame.p-Root.CFrame.p).magnitude <= Range then
			local Hum = parts.Parent:FindFirstChildOfClass("Humanoid")
			if Hum and Hum.Health ~= 0 and not IsInTable(RecordedHumanoids,Hum) then
				RecordedHumanoids[#RecordedHumanoids+1] = Hum
			end
		end
	end
	return RecordedHumanoids
end

local function GetNearestTorso(MarkedPosition,TorsoPopulationTable)
	local ClosestDistance = math.huge
	local ClosestTorso
	for i=1,#TorsoPopulationTable do
		local distance = (TorsoPopulationTable[i].CFrame.p-MarkedPosition).magnitude
		if TorsoPopulationTable[i] and  distance < ClosestDistance then
			ClosestDistance = distance
			ClosestTorso = TorsoPopulationTable[i]
		end
	end
	--warn("The Closest Person is: "..ClosestTorso.Parent.Name)
	return ClosestTorso
end


local RedPillar = Create("Part"){
	Shape = Enum.PartType.Cylinder,
	Material = Enum.Material.Neon,
	Name = "CrimsonPillar",
	BrickColor = BrickColor.new("Crimson"),
	Size = Vector3.new(100,5,5),
	CanCollide = false,
	Anchored = true,
	Transparency = 0.3,
	Locked = true,
	TopSurface = Enum.SurfaceType.Smooth,
	BottomSurface = Enum.SurfaceType.Smooth
}

local Surfaces = {"Front","Back","Left","Right","Top","Bottom"}

local PillarLighting = Create("SurfaceLight"){
	Color = Color3.fromRGB(151, 0, 0),
	Angle = 180,
	Enabled = true,
	Range = 10,
	Shadows = true
}

for _,surfaces in pairs(Surfaces) do
	local Lighting = PillarLighting:Clone()
	Lighting.Face = Enum.NormalId[surfaces]
	Lighting.Parent = RedPillar
end

local CurrentTime,LastTime = tick(),tick()
function Activated()
	if not Tool.Enabled then return end
	Tool.Enabled = false
	CurrentTime = tick()
	if (CurrentTime-LastTime) <= 0.2 then
		--print("Lunge")
		Sounds.LungeSound:Play()
		Components.PeriTrail.Enabled = true
		local sucess,MousePosition = pcall(function() return Components.MouseInput:InvokeClient(Player) end)
		MousePosition = (sucess and MousePosition) or Vector3.new(0,0,0)
		
		local Direction = CFrame.new(Root.Position, Vector3.new(MousePosition.X, Root.Position.Y, MousePosition.Z))
		local BodyVelocity = Instance.new("BodyVelocity")
		BodyVelocity.MaxForce = Vector3.new(math.huge, 0, math.huge)
		BodyVelocity.Velocity = Direction.lookVector * ((HasPeri("Fuchsia") and 200) or 100)
		Services.Debris:AddItem(BodyVelocity, 0.5)
		BodyVelocity.Parent = Root
		delay(.5,function()
			Components.PeriTrail.Enabled = false
		end)
		Root.CFrame = CFrame.new(Root.CFrame.p,Root.CFrame.p+Direction.lookVector)
		wait(1.5)
	else
		local SwingAnims = {AttackAnims.Slash,AttackAnims.SlashAnim,AttackAnims.RightSlash}
		local AttackAnim = SwingAnims[Seed:NextInteger(1,#SwingAnims)]
		spawn(function()
			if AttackAnim ~= AttackAnims.SlashAnim then
				Sounds.SlashSound:Play()
				else
				Sounds.SlashSound:Play()
				wait(.5)
				Sounds.SlashSound:Play()
			end	
		end)

		AttackAnim:Play()
	--wait(.4)
	end
	LastTime = CurrentTime
	Tool.Enabled = true
end

local Touch
local EquippedPassives = {}

local IvoryDebounce,GrimgoldDebounce,CrimsonDebounce = false,false,false

function Equipped(Mouse)
	Character = Tool.Parent
	Root = Character:FindFirstChild("HumanoidRootPart")
	Player = Services.Players:GetPlayerFromCharacter(Character)
	Humanoid = Character:FindFirstChildOfClass("Humanoid")
	AttackAnims = {
		Slash = Animations:WaitForChild(Humanoid.RigType.Name,10):WaitForChild("Slash",10),
		RightSlash = Animations:WaitForChild(Humanoid.RigType.Name,10):WaitForChild("RightSlash",10),
		SlashAnim = Animations:WaitForChild(Humanoid.RigType.Name,10):WaitForChild("SlashAnim",10),
	}
	for i,v in pairs(AttackAnims) do
		AttackAnims[i] = Humanoid:LoadAnimation(v)
	end
	Touch = Handle.Touched:Connect(function(hit)
		Damage(hit,Properties.BaseDamage,false)
	end)
	
	
	local IgnoreHealthChange = false
		local CurrentHealth = Humanoid.Health
		EquippedPassives[#EquippedPassives+1] = Humanoid.Changed:Connect(function(Property) -- Based on Azure Periastron
			local NewHealth = Humanoid.Health
			if not IgnoreHealthChange and NewHealth ~= Humanoid.MaxHealth then
				if NewHealth < CurrentHealth then
					local DamageDealt = (CurrentHealth - NewHealth)
					IgnoreHealthChange = true
					Humanoid.Health = Humanoid.Health + (DamageDealt * ((HasFullSet() and .5) or .33))
					--print((HasPeri("Azure") and "Has Azure") or "Does not have Azure")
					IgnoreHealthChange = false
				end
			end
			CurrentHealth = NewHealth
		end)
		
	if HasPeri("Grimgold") then
		EquippedPassives[#EquippedPassives+1] = Services.RunService.Heartbeat:Connect(function()
			if GrimgoldDebounce or not Tool:IsDescendantOf(Character) then return end
			repeat
				
				GrimgoldDebounce = true
				local TaggedHumanoids = {}
					for _,Hum in pairs(GetHumanoidsInRange((HasFullSet() and Properties.GrimgoldRange*1.5) or Properties.GrimgoldRange)) do
						if not IsInTable(TaggedHumanoids,Hum) and not IsTeamMate(Player,Services.Players:GetPlayerFromCharacter(Hum.Parent)) and not Hum.Parent:FindFirstChild("RevealRainbow")then
							TaggedHumanoids[#TaggedHumanoids+1] = Hum
							spawn(function()
							local RevealScript = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/RainbowPeriastronOmega/Server/RevealRainbow.lua", "server")
								RevealScript:WaitForChild("Range").Value = (HasFullSet() and Properties.GrimgoldRange*1.5) or Properties.GrimgoldRange
								RevealScript:WaitForChild("Creator").Value = Character
								RevealScript:WaitForChild("Tool").Value = Tool
							RevealScript.Parent = Hum.Parent
							RevealScript.Name = "RevealRainbow"
							end)
							Hum.WalkSpeed = (HasFullSet() and 4) or 12
						end
					end
				wait(1/10)
				GrimgoldDebounce = false
			until not Tool:IsDescendantOf(Character) or Humanoid.Health <= 0
		end)
	end
	
	if HasPeri("Crimson") then
		EquippedPassives[#EquippedPassives+1] = Services.RunService.Heartbeat:Connect(function()
			if CrimsonDebounce or not Tool:IsDescendantOf(Character) then return end
			repeat
				CrimsonDebounce = true
				Wait((HasFullSet() and Seed:NextNumber(.2,1)) or Seed:NextNumber(1,3))
				local NearbyPlayers = {}
				for _,player in pairs(Services.Players:GetPlayers()) do
					if player ~= Player and player.Character and player.Character.PrimaryPart then
						local Hum = player.Character:FindFirstChildOfClass("Humanoid")
						if Hum and Hum.Health <= 0 and Hum.Health ~= 0 and (player.Character.PrimaryPart.CFrame.p-Root.CFrame.p).Magnitude <=30 then
							NearbyPlayers[#NearbyPlayers+1] = player.Character.PrimaryPart
						end
					end
				end
				if #NearbyPlayers == 0 then
					local SpawnPos = (Root.CFrame*CFrame.new(Seed:NextInteger(-40,40),100,Seed:NextInteger(-40,40))).p
					local hit,pos = RayCast(SpawnPos,(SpawnPos-Vector3.new(0,1,0))-SpawnPos,150,{Character})
					if hit then
						local PillarClone = RedPillar:Clone()
						local PillarScript = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/RainbowPeriastronOmega/Server/CrimsonPillar.lua", "server")
						PillarScript:WaitForChild("Creator",5).Value = Player
						PillarScript.Parent = PillarClone
						PillarClone.CFrame = CFrame.new(pos+Vector3.new(0,PillarClone.Size.X/2,0))*CFrame.Angles(0,0,math.rad(90))
						PillarClone.Parent = workspace
						PillarScript.Name = "CrimsonPillar"
					end
				else
					local ChosenPlayer = NearbyPlayers[Seed:NextInteger(1,#NearbyPlayers)]
					if ChosenPlayer then
						local PillarClone = RedPillar:Clone()
						local PillarScript = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/RainbowPeriastronOmega/Server/CrimsonPillar.lua", "server")
						PillarScript:WaitForChild("Creator",5).Value = Player
						PillarScript.Parent = PillarClone
						PillarScript.Name = "CrimsonPillar"
						PillarClone.CFrame = CFrame.new(ChosenPlayer.CFrame.p+Vector3.new(0,(PillarClone.Size.X/2)-2.5,0))*CFrame.Angles(0,0,math.rad(90))
						PillarClone.Parent = workspace
					end
				end
				
				Services.RunService.Heartbeat:Wait()
				CrimsonDebounce = false
			until not Tool:IsDescendantOf(Character) or Humanoid.Health <= 0
		end)
	end
	
	if HasPeri("Ivory") then
		
		local ShardContent = script:WaitForChild("ShardContent",10):GetChildren()	
		
		local Shard = Create("Part"){
						Material = Enum.Material.Neon,
						Size = Vector3.new(1,1,1)*.5,
						Anchored = false,
						CanCollide = false,
						Name = "StarShard",
						Locked = true,
						Transparency = 0,
						Shape = Enum.PartType.Ball,
						CFrame = Handle.CFrame,
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
		EquippedPassives[#EquippedPassives+1] = Services.RunService.Heartbeat:Connect(function()
	
				if IvoryDebounce or not Tool:IsDescendantOf(Character) then return end
				
				
				repeat
					--wait(Seed:NextNumber(.1,.5))
					IvoryDebounce = true
					local Proj = Shard:Clone()
					for _,v in pairs(Proj:GetChildren()) do
						if v:IsA("ParticleEmitter") then
							v.Enabled = true
						end
					end
					local SparkleClone = script:WaitForChild("Sparkle",5):Clone()
					SparkleClone.Parent = Proj
				SparkleClone:Play()

				local creatorFF = Instance.new("ObjectValue")
creatorFF.Name = "Creator"

				local ShardScript = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/RainbowPeriastronOmega/Server/StarShard.lua", "server")
				creatorFF.Parent = ShardScript
				creatorFF.Value = Player or owner
				ShardScript.Parent = Proj
				ShardScript.Name = "StarShard"
					--Services.Debris:AddItem(Proj,7)
					Proj.CFrame = Handle.CFrame
					Proj.Parent = workspace
					Proj:SetNetworkOwner(nil)
					Proj.Velocity = CFrame.new(Handle.CFrame.p,Handle.CFrame.p+Vector3.new(Seed:NextNumber(-1,1),Seed:NextNumber(-1,1),Seed:NextNumber(-1,1))).lookVector*Seed:NextNumber(50,70)
					Wait((HasFullSet() and 1/3) or 1/2)
					IvoryDebounce = false
					--Services.RunService.Heartbeat:Wait()
				until not Tool:IsDescendantOf(Character) or Humanoid.Health <= 0
		end)
	end
	
end


function Unequipped()
	if Touch then Touch:Disconnect();Touch = nil end
	for i,v in pairs(AttackAnims) do
		v:Stop()
	end
	for index,passive in pairs(EquippedPassives) do
		if passive then 
			passive:Disconnect();EquippedPassives[index] = nil
		end 
	end
end



local HitHumanoids = {}
function Damage(hit,TotalDamage)
	if not hit or not hit.Parent then return end
	local Hum = hit.Parent:FindFirstChildOfClass("Humanoid")
	local ForceField = hit.Parent:FindFirstChildOfClass("ForceField")
	if not Hum or Hum.Health <=0 or Hum == Humanoid or ForceField then return end
	
	if IsTeamMate(Player,Services.Players:GetPlayerFromCharacter(Hum.Parent)) then return end
	
	if IsInTable(HitHumanoids,Hum) then return end
	
	spawn(function()
		UntagHumanoid(Hum)
		TagHumanoid(Hum,Player)
		HitHumanoids[#HitHumanoids+1]=Hum
		Hum:TakeDamage(TotalDamage)
		Humanoid.Health = math.clamp(Humanoid.Health + (TotalDamage * ((HasFullSet() and .3) or .2)),0,Humanoid.MaxHealth)--Noir life-steal
		--wait(.5)
		for i,v in pairs(HitHumanoids) do
			if v == Hum then
				HitHumanoids[i] = nil
			end
		end
	end)
end

Tool.Activated:Connect(Activated)
Tool.Equipped:Connect(Equipped)
Tool.Unequipped:Connect(Unequipped)


function SummonRainBeam()
	if not Sparkles.Enabled then return end
	Sparkles.Enabled = false

	local animations = Instance.new("Folder")
animations.Name = "Animations"

local r6 = Instance.new("Folder")
r6.Name = 'R6'
r6.Parent = animations

local release = Instance.new("Animation")
release.AnimationId = "rbxassetid://101070520"
release.Name = "Release"
release.Parent = r6

local r15 = Instance.new("Folder")
r15.Name = 'R15'
r15.Parent = animations

local release_2 = Instance.new("Animation")
release_2.AnimationId = "rbxassetid://2648017520"
release_2.Name = "Release"
release_2.Parent = r15

local charge_sound = Instance.new("Sound")
charge_sound.SoundId = "rbxassetid://1899274315"
charge_sound.Volume = 1
charge_sound.Name = "ChargeSound"

local fire_sound = Instance.new("Sound")
fire_sound.SoundId = "rbxassetid://1899276280"
fire_sound.Volume = 2
fire_sound.Name = "FireSound"

local loop_sound = Instance.new("Sound")
loop_sound.Looped = true
loop_sound.SoundId = "rbxassetid://1899276849"
loop_sound.Volume = 2
loop_sound.Name = "LoopSound"

local peri_formation = Instance.new("Folder")
peri_formation.Name = "PeriFormation"

local creator = Instance.new("ObjectValue")
creator.Name = "Creator"

local tool = Instance.new("ObjectValue")
tool.Name = "Tool"

	local RainBeamScript = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/RainbowPeriastronOmega/Server/RainBeem.lua", "server")
	RainBeamScript.Name = "RainBeam"

	tool.Parent = RainBeamScript
	creator.Parent = RainBeamScript
	peri_formation.Parent = RainBeamScript
	loop_sound.Parent = RainBeamScript
	fire_sound.Parent = RainBeamScript
	charge_sound.Parent = RainBeamScript
	animations.Parent = RainBeamScript

	creator.Value = owner
	tool.Value = Tool
	RainBeamScript.Parent = Services.ServerScriptService
	local PeriFormation = RainBeamScript:WaitForChild("PeriFormation",5)
	for _,name in pairs(PeriastronNamesAlt) do
		local Peri = HasPeri(name)
		if Peri then
			local PeriHandle = Peri:FindFirstChild("Handle",true)
			
			if PeriHandle then
				local PeriLight = PeriHandle:FindFirstChildOfClass("PointLight")
				local PeriMesh = PeriHandle:FindFirstChildOfClass("SpecialMesh")
				if PeriMesh and PeriLight then
					local PeriTag = Create("Color3Value"){
						Name = PeriMesh.TextureId,
						Value = PeriLight.Color,
						Parent = PeriFormation
					}
				end
			end
		
		end
	end
	RainBeamScript.Disabled = false
	
	repeat
		Services.RunService.Heartbeat:Wait()
	until not RainBeamScript or not RainBeamScript:IsDescendantOf(Services.ServerScriptService)
	
	wait((HasFullSet() and Properties.SpecialCooldown/2) or Properties.SpecialCooldown)
	Sparkles.Enabled = true
end

local ChartreuseReady,AmethystReady,HazelReady = true,true,true -- debounces for each one

function ShieldPulse()
	if not ChartreuseReady then return end
	ChartreuseReady = false
	--print("Shield Pulse")
	local ShieldScript = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/RainbowPeriastronOmega/Server/ShieldScript.lua", "server")
	ShieldScript.Name = "ShieldScript"
	ShieldScript.Parent = Character
	
	repeat
		Services.RunService.Heartbeat:Wait()
	until not ShieldScript or not ShieldScript.Parent
	
	delay((HasFullSet() and 7) or 7*2,function()
		ChartreuseReady = true
	end)
end

function Singularity()
	if not AmethystReady then return end
	AmethystReady = false
	--print("Singularity")
	
local Centre = Create("Part"){
	Size = Vector3.new(1,1,1)*1,
	CFrame = Root.CFrame,
	Transparency = 1,
	Anchored = true,
	Locked = true,
	CanCollide = false,
	TopSurface = Enum.SurfaceType.Smooth,
	BottomSurface = Enum.SurfaceType.Smooth	
}

Centre.Parent = workspace
	local BlackHoleScript = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/RainbowPeriastronOmega/Server/Blackhole.lua", "server")
BlackHoleScript:WaitForChild("Creator",5).Value = Player
BlackHoleScript.Parent = Centre
BlackHoleScript.Name = "BlackHole"

	delay((HasFullSet() and 12) or 12*2,function()
		AmethystReady = true
	end)
end

function RockLift()
	if not HazelReady then return end
	HazelReady = false
	--print("Rock Lift")
	local hit,pos,mat = RayCast(Root.CFrame.p,(Root.CFrame.p+Vector3.new(0,-1,0))-Root.CFrame.p,10,{Character})
	
	local Rock = Create("Part"){
		Size = Vector3.new(1,1,1)*15,
		Material = Enum.Material.Slate,
		Anchored = true,
		Name = "Rock",
		Locked = true,
		CanCollide = true,
		Color = ((hit and hit.Color) or Color3.fromRGB(102, 51, 0)),
		CFrame = CFrame.new(Root.CFrame.p-Vector3.new(0,2,0))*CFrame.Angles(math.rad(Seed:NextInteger(0,360)),math.rad(Seed:NextInteger(0,360)),math.rad(Seed:NextInteger(0,360))),
		Parent = workspace
	}
	
	local RockSummon = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/RainbowPeriastronOmega/Server/RockSummon.lua", "server")
	RockSummon:WaitForChild("Creator",5).Value = Player
	RockSummon.Parent = Rock
	RockSummon.Name = "RockSummon"
	
	local JumpForce = Create("BodyVelocity"){
		MaxForce = Vector3.new(1,1,1) * math.huge,
		Name = "JumpForce",
		Velocity = ((Root.CFrame.p + Vector3.new(0,1,0))-Root.CFrame.p).Unit*150,
		Parent = Root
	}
	Services.Debris:AddItem(JumpForce,.1)
	
	delay((HasFullSet() and 6) or 6*2,function()
		HazelReady = true
	end)
end

Remote.OnServerEvent:Connect(function(Client,Key)
	if not Player or not Client or Client ~= Player or not Key or not Tool.Enabled or Humanoid.Health <= 0 then return end
	if Key == Enum.KeyCode.Q then
		SummonRainBeam()
	elseif Key == Enum.KeyCode.E and HasPeri("Chartreuse") then
		ShieldPulse()
	elseif Key == Enum.KeyCode.X and HasPeri("Amethyst") then
		Singularity()	
	elseif Key == Enum.KeyCode.R and HasPeri("Hazel") then
		RockLift()
	end
end)
