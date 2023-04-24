--Rescripted by Luckymaxer
--Made by Stickmasterluke

Tool = script.Parent
Handle = Tool:WaitForChild("Handle")

Players = game:GetService("Players")
Debris = game:GetService("Debris")

local function Create_PrivImpl(objectType)
	if type(objectType) ~= 'string' then
		error("Argument of Create must be a string", 2)
	end
	--return the proxy function that gives us the nice Create'string'{data} syntax
	--The first function call is a function call using Lua's single-string-argument syntax
	--The second function call is using Lua's single-table-argument syntax
	--Both can be chained together for the nice effect.
	return function(dat)
		--default to nothing, to handle the no argument given case
		dat = dat or {}

		--make the object to mutate
		local obj = Instance.new(objectType)
		local parent = nil

		--stored constructor function to be called after other initialization
		local ctor = nil

		for k, v in pairs(dat) do
			--add property
			if type(k) == 'string' then
				if k == 'Parent' then
					-- Parent should always be set last, setting the Parent of a new object
					-- immediately makes performance worse for all subsequent property updates.
					parent = v
				else
					obj[k] = v
				end


			--add child
			elseif type(k) == 'number' then
				if type(v) ~= 'userdata' then
					error("Bad entry in Create body: Numeric keys must be paired with children, got a: "..type(v), 2)
				end
				v.Parent = obj


			--event connect
			elseif type(k) == 'table' and k.__eventname then
				if type(v) ~= 'function' then
					error("Bad entry in Create body: Key `[Create.E\'"..k.__eventname.."\']` must have a function value\
							got: "..tostring(v), 2)
				end
				obj[k.__eventname]:connect(v)


			--define constructor function
			elseif k == t.Create then
				if type(v) ~= 'function' then
					error("Bad entry in Create body: Key `[Create]` should be paired with a constructor function, \
							got: "..tostring(v), 2)
				elseif ctor then
					--ctor already exists, only one allowed
					error("Bad entry in Create body: Only one constructor function is allowed", 2)
				end
				ctor = v


			else
				error("Bad entry ("..tostring(k).." => "..tostring(v)..") in Create body", 2)
			end
		end

		--apply constructor function if it exists
		if ctor then
			ctor(obj)
		end

		if parent then
			obj.Parent = parent
		end

		--return the completed object
		return obj
	end
end

--now, create the functor:
Create = setmetatable({}, {__call = function(tb, ...) return Create_PrivImpl(...) end})

--and create the "Event.E" syntax stub. Really it's just a stub to construct a table which our Create
--function can recognize as special.
Create.E = function(eventName)
	return {__eventname = eventName}
end


BaseUrl = "http://www.roblox.com/asset/?id="

local jeweled_crown = Instance.new("Accessory")
jeweled_crown.AttachmentPoint = CFrame.fromMatrix(Vector3.new(0, 0.10000000149011612, -0.07500000298023224), Vector3.new(1, 0, 0), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1))
jeweled_crown.AttachmentPos = Vector3.new(0, 0.10000000149011612, -0.07500000298023224)
jeweled_crown.Name = "JeweledCrown"

local handle = Instance.new("Part")
handle.BottomSurface = Enum.SurfaceType.Smooth
handle.CFrame = CFrame.fromMatrix(Vector3.new(15.800002098083496, 0.4999997913837433, 38.09999465942383), Vector3.new(1, 0, 0), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1))
handle.Locked = true
handle.Size = Vector3.new(1.1999990940093994, 0.20000000298023224, 1)
handle.TopSurface = Enum.SurfaceType.Smooth
handle.Name = "Handle"
handle.Parent = jeweled_crown

local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "http://www.roblox.com/asset/?id=69428716"
mesh.TextureId = "http://www.roblox.com/asset/?id=69428704"
mesh.Parent = handle

local hat_attachment = Instance.new("Attachment")
hat_attachment.Axis = Vector3.new(1, -7.871375551360416e-09, 0)
hat_attachment.CFrame = CFrame.fromMatrix(Vector3.new(8.658389560878277e-09, 0.19999980926513672, -0.07527224719524384), Vector3.new(1, -7.871375551360416e-09, 0), Vector3.new(7.871375551360416e-09, 1, 4.1444220966321485e-16), Vector3.new(-3.2622303411172315e-24, -4.1444220966321485e-16, 1))
hat_attachment.Orientation = Vector3.new(2.3745789405962836e-14, -1.8691202130724443e-22, -4.5099656631464313e-07)
hat_attachment.Position = Vector3.new(8.658389560878277e-09, 0.19999980926513672, -0.07527224719524384)
hat_attachment.SecondaryAxis = Vector3.new(7.871375551360416e-09, 1, 4.1444220966321485e-16)
hat_attachment.Visible = false
hat_attachment.Name = "HatAttachment"
hat_attachment.Parent = handle

local long_hair_head_band = Instance.new("Accessory")
long_hair_head_band.AttachmentForward = Vector3.new(-0, -0.09950371831655502, -0.9950371980667114)
long_hair_head_band.AttachmentPoint = CFrame.fromMatrix(Vector3.new(0, 0.8999999761581421, 0), Vector3.new(1, 0, 0), Vector3.new(0, 0.9950371980667114, -0.09950371831655502), Vector3.new(0, 0.09950371831655502, 0.9950371980667114))
long_hair_head_band.AttachmentPos = Vector3.new(0, 0.8999999761581421, 0)
long_hair_head_band.AttachmentUp = Vector3.new(0, 0.9950371980667114, -0.09950371831655502)
long_hair_head_band.Name = "LongHairHeadBand"

local handle = Instance.new("Part")
handle.BottomSurface = Enum.SurfaceType.Smooth
handle.CFrame = CFrame.fromMatrix(Vector3.new(0, 4, -290), Vector3.new(1, 0, 0), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1))
handle.Locked = true
handle.Size = Vector3.new(1, 2.4000000953674316, 2)
handle.TopSurface = Enum.SurfaceType.Smooth
handle.Name = "Handle"
handle.Parent = long_hair_head_band

local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "http://www.roblox.com/asset/?id=13070796"
mesh.TextureId = "http://www.roblox.com/asset/?id=13070807"
mesh.Parent = handle

local hair_attachment = Instance.new("Attachment")
hair_attachment.Axis = Vector3.new(1, -7.832312576283584e-09, 7.831886250642128e-10)
hair_attachment.CFrame = CFrame.fromMatrix(Vector3.new(8.658389560878277e-09, 0.999476432800293, -0.010221272706985474), Vector3.new(1, -7.832312576283584e-09, 7.831886250642128e-10), Vector3.new(7.871372886825156e-09, 0.9950371980667114, -0.09950371831655502), Vector3.new(4.241051954068098e-14, 0.09950371831655502, 0.9950371980667114))
hair_attachment.Orientation = Vector3.new(-5.710592746734619, 2.4420632616789506e-12, -4.509966515797714e-07)
hair_attachment.Position = Vector3.new(8.658389560878277e-09, 0.999476432800293, -0.010221272706985474)
hair_attachment.SecondaryAxis = Vector3.new(7.871372886825156e-09, 0.9950371980667114, -0.09950371831655502)
hair_attachment.Visible = false
hair_attachment.Name = "HairAttachment"
hair_attachment.Parent = handle

MaxRange = 100
Rate = (1 / 30)
Hair = long_hair_head_band
Hat = jeweled_crown
Costume = {	
	{Name = "Princess Torso", BodyPart = Enum.BodyPart.Torso, BaseTextureId = 0, MeshId = 54069300, OverlayTextureId = 54069610},
	{Name = "Princess Left Arm", BodyPart = Enum.BodyPart.LeftArm, BaseTextureId = 0, MeshId = 54069504, OverlayTextureId = 54069610},
	{Name = "Princess Right Arm", BodyPart = Enum.BodyPart.RightArm, BaseTextureId = 0, MeshId = 54069400, OverlayTextureId = 54069610},
	{Name = "Princess Left Leg", BodyPart = Enum.BodyPart.LeftLeg, BaseTextureId = 0, MeshId = -1, OverlayTextureId = 54069610},
	{Name = "Princess Right Leg", BodyPart = Enum.BodyPart.RightLeg, BaseTextureId = 0, MeshId = -1, OverlayTextureId = 54069610},
}

Animations = {
	Wave = {Animation = Tool:WaitForChild("Wave"), FadeTime = nil, Weight = nil, Speed = 1},
}

Sounds = {
	Fire = Handle:WaitForChild("Fire"),
}

BasePart = Create("Part"){
	Material = Enum.Material.Plastic,
	Shape = Enum.PartType.Block,
	FormFactor = Enum.FormFactor.Custom,
	TopSurface = Enum.SurfaceType.Smooth,
	BottomSurface = Enum.SurfaceType.Smooth,
	Size = Vector3.new(0.2, 0.2, 0.2),
	Anchored = false,
	CanCollide = true,
	Locked = true,
}

Snowball = Handle:Clone()
Snowball.Transparency = 0

Velocity = 50

Magic = BasePart:Clone()
Magic.Name = "Effect"
Magic.Transparency = 1
Magic.CanCollide = false
Magic.Anchored = true
Create("Sparkles"){
	SparkleColor = Color3.new((144 / 255), (25 / 255), (255 / 255)),
	Enabled = true,
	Parent = Magic,
}

ServerControl = (Tool:FindFirstChild("ServerControl") or Instance.new("RemoteFunction"))
ServerControl.Name = "ServerControl"
ServerControl.Parent = Tool

ClientControl = (Tool:FindFirstChild("ClientControl") or Instance.new("RemoteFunction"))
ClientControl.Name = "ClientControl"
ClientControl.Parent = Tool

Loaded = true
ToolEquipped = false

Handle.Transparency = 0
Tool.Enabled = true


function Princessize(character)
	local Princessized = Create("StringValue"){
		Name = "Princessized",
		Parent = character,
	}
	local Hair = Hair:Clone()
	local Hat = Hat:Clone()
	local BodyParts = {}
	for i, v in pairs(Costume) do
		local CharacterMesh = Create("CharacterMesh"){
			Name = v.Name,
			BodyPart = v.BodyPart,
			MeshId = v.MeshId,
			BaseTextureId = v.BaseTextureId,
			OverlayTextureId = v.OverlayTextureId,
			Parent = character
		}
	end
	Hair.Parent = Character
	Hat.Parent = Character
end

function CheckIfAlive()
	return (((Character and Character.Parent and Humanoid and Humanoid.Parent and Humanoid.Health > 0 and Player and Player.Parent) and true) or false)
end

function Fire(targetPart, heat, size, clr1, clr2)
	local NewFire = Create("Fire"){
		Heat = heat,
		Size = size,
		Color = clr1,
		SecondaryColor = clr2,
		Parent = targetPart,
	}
	return NewFire
end

function Activated()
	local MouseData = InvokeClient("MouseData")
	if not MouseData or not MouseData.Position or not MouseData.Target or not ToolEquipped or not CheckIfAlive() or not Tool.Enabled then
		return
	end
	local character = MouseData.Target.Parent
	if character:IsA("Hat") or character:IsA("Accoutrement") or character:IsA("Tool") then
		character = character.Parent
	end
	if character:FindFirstChild("Princessized") then
		return
	end
	local humanoid = character:FindFirstChild("Humanoid")
	local torso = character:FindFirstChild("Torso")
	if not humanoid or humanoid.Health == 0 or not torso then
		return
	end
	local OriginalDistance = (Handle.Position - torso.Position).Magnitude
	if OriginalDistance > MaxRange then
		return
	end
	Tool.Enabled = false
	spawn(function()
		InvokeClient("PlayAnimation", Animations.Wave)
	end)
	Sounds.Fire:Play()
	local MagicCopy = Magic:Clone()
	Debris:AddItem(MagicCopy, 10)
	MagicCopy.CFrame = (Handle.CFrame * CFrame.new(0, 2, 0))
	MagicCopy.Parent = game:GetService("Workspace")
	local Frames = (1 / Rate)
	for Frame = 1, Frames do
		local Vec = (MagicCopy.Position - torso.Position).Unit
		MagicCopy.CFrame = CFrame.new(torso.Position + Vec * ((1 - (Frame / Frames)) * OriginalDistance))
		wait(Rate)
	end
	if MagicCopy and MagicCopy.Parent then
		MagicCopy:Destroy()
	end
	local Fires = {
		Fire(torso, 10, 15, Color3.new(1, (1 / 3), 1), Color3.new(1, (2 / 3), 1)),
		Fire(torso, 0, 20, Color3.new(1, 1, 1), Color3.new(1, (2 / 3), 1)),
		Fire(torso, -10, 15, Color3.new(1, (1 / 3), 1), Color3.new(1, (2 / 3), 1)),
	}
	for i, v in pairs(Fires) do
		Debris:AddItem(v, 5)
	end
	wait(1)
	for i, v in pairs(character:GetChildren()) do
		if v:IsA("CharacterMesh") or v:IsA("ShirtGraphic") or v:IsA("Hat") or v:IsA("Accoutrement") or v:IsA("Clothing") then
			v:Destroy()
		end
	end
	for i, v in pairs(torso:GetChildren()) do
		if v:IsA("Decal") then
			v:Destroy()
		end
	end
	Princessize(character)
	wait(1.5)
	for i, v in pairs(Fires) do
		v.Enabled = false
	end
	wait(3)
	Tool.Enabled = true
end

function Equipped()
	Character = Tool.Parent
	Humanoid = Character:FindFirstChild("Humanoid")
	Player = Players:GetPlayerFromCharacter(Character)
	if not CheckIfAlive() then
		return
	end
	ToolEquipped = true
end

function Unequipped()
	ToolEquipped = false
end

function InvokeClient(Mode, Value)
	local ClientReturn = nil
	pcall(function()
		ClientReturn = ClientControl:InvokeClient(Player, Mode, Value)
	end)
	return ClientReturn
end

function OnServerInvoke(player, mode, value)
	if player ~= Player or not mode or not value then
		return
	end
end

ServerControl.OnServerInvoke = OnServerInvoke

Tool.Activated:connect(Activated)
Tool.Equipped:connect(Equipped)
Tool.Unequipped:connect(Unequipped)