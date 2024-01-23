local Race_the_Sunset = Instance.new("Tool")
Race_the_Sunset.Grip = CFrame.fromMatrix(Vector3.new(0, 0, -0.15000000596046448), Vector3.new(1, 0, -0), Vector3.new(0, -1, 0), Vector3.new(-0, -0, -1))
Race_the_Sunset.GripForward = Vector3.new(0, 0, 1)
Race_the_Sunset.GripPos = Vector3.new(0, 0, -0.15000000596046448)
Race_the_Sunset.GripUp = Vector3.new(0, -1, 0)
Race_the_Sunset.TextureId = "http://www.roblox.com/asset/?id=76121378"
Race_the_Sunset.WorldPivot = CFrame.fromMatrix(Vector3.new(-5.134459018707275, 9.882221221923828, -25.339336395263672), Vector3.new(1, 0, 0), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1))
Race_the_Sunset.Name = "Race the Sunset"
Race_the_Sunset.Parent = owner.Backpack

MisL = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/MisL/main/source.lua"))()

local handle = Instance.new("Part")
handle.CFrame = CFrame.fromMatrix(Vector3.new(-5.134459018707275, 9.882221221923828, -25.339336395263672), Vector3.new(1, 0, 0), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1))
handle.Size = Vector3.new(1.480000615119934, 0.7700003385543823, 0.2499997466802597)
handle.Size = Vector3.new(1.480000615119934, 0.7700003385543823, 0.2499997466802597)
handle.Name = "Handle"
handle.Parent = Race_the_Sunset

local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "http://www.roblox.com/asset/?id=76121335"
mesh.TextureId = "http://www.roblox.com/asset/?id=76120937"
mesh.Parent = handle

local platformer_gui = Instance.new("ScreenGui")
platformer_gui.IgnoreGuiInset = false
platformer_gui.ResetOnSpawn = true
platformer_gui.ZIndexBehavior = Enum.ZIndexBehavior.Global
platformer_gui.Name = "PlatformerGui"
platformer_gui.Parent = Race_the_Sunset

local background = Instance.new("Frame")
background.BackgroundColor3 = Color3.new(0, 0, 0)
background.BorderSizePixel = 0
background.Position = UDim2.new(0, -50, 0, -50)
background.Size = UDim2.new(1, 100, 1, 100)
background.Visible = false
background.ZIndex = 0
background.Name = "Background"
background.Parent = platformer_gui

local game_frame = Instance.new("Frame")
game_frame.BackgroundColor3 = Color3.new(0.4, 0.8, 1)
game_frame.BackgroundTransparency = 1
game_frame.BorderSizePixel = 0
game_frame.ClipsDescendants = true
game_frame.Position = UDim2.new(0.5, -300, 0.5, -200)
game_frame.Size = UDim2.new(0, 600, 0, 400)
game_frame.Visible = true
game_frame.ZIndex = 2
game_frame.Name = "GameFrame"
game_frame.Parent = platformer_gui

local move_frame = Instance.new("Frame")
move_frame.BackgroundColor3 = Color3.new(0.4, 0.8, 1)
move_frame.BackgroundTransparency = 1
move_frame.BorderSizePixel = 0
move_frame.Position = UDim2.new(0.5, -200, 0.5, -300)
move_frame.Visible = true
move_frame.ZIndex = 2
move_frame.Name = "MoveFrame"
move_frame.Parent = game_frame

local map = Instance.new("Frame")
map.Visible = true
map.ZIndex = 2
map.Name = "Map"
map.Parent = move_frame

local land2 = Instance.new("ImageLabel")
land2.Image = "http://www.roblox.com/asset/?id=72484254"
land2.BackgroundColor3 = Color3.new(0.8, 0.4, 0)
land2.BackgroundTransparency = 1
land2.BorderSizePixel = 0
land2.Position = UDim2.new(0, -15, 0, 330)
land2.Size = UDim2.new(0, 280, 0, 140)
land2.Visible = true
land2.ZIndex = 5
land2.Name = "Land2"
land2.Parent = map

local land1 = Instance.new("ImageLabel")
land1.Image = "http://www.roblox.com/asset/?id=72484283"
land1.BackgroundColor3 = Color3.new(0.8, 0.4, 0)
land1.BackgroundTransparency = 1
land1.BorderSizePixel = 0
land1.Position = UDim2.new(0, 190, 0, 330)
land1.Size = UDim2.new(0, 350, 0, 100)
land1.Visible = true
land1.ZIndex = 5
land1.Name = "Land1"
land1.Parent = map

local character = Instance.new("ImageLabel")
character.Image = "http://www.roblox.com/asset/?id=73014404"
character.BackgroundColor3 = Color3.new(0.4, 1, 0.4)
character.BackgroundTransparency = 1
character.BorderSizePixel = 0
character.Position = UDim2.new(0, 0, 0, 300)
character.Size = UDim2.new(0, 30, 0, 30)
character.Visible = true
character.ZIndex = 6
character.Name = "Character"
character.Parent = move_frame

local effects = Instance.new("Frame")
effects.Visible = true
effects.ZIndex = 2
effects.Name = "Effects"
effects.Parent = move_frame

local bonus = Instance.new("Frame")
bonus.Visible = true
bonus.ZIndex = 2
bonus.Name = "Bonus"
bonus.Parent = move_frame

local sky = Instance.new("ImageLabel")
sky.Image = "http://www.roblox.com/asset/?id=74754815"
sky.BackgroundTransparency = 1
sky.BorderSizePixel = 0
sky.Size = UDim2.new(1, 0, 1, 0)
sky.Visible = true
sky.Name = "Sky"
sky.Parent = game_frame

local black_fade = Instance.new("ImageLabel")
black_fade.Image = "http://www.roblox.com/asset/?id=73173361"
black_fade.BackgroundTransparency = 1
black_fade.Position = UDim2.new(0, -10, 1.5, -10)
black_fade.Size = UDim2.new(1, 20, 1, 20)
black_fade.Visible = true
black_fade.ZIndex = 8
black_fade.Name = "BlackFade"
black_fade.Parent = game_frame

local frame = Instance.new("Frame")
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.BorderColor3 = Color3.new(0, 0, 0)
frame.BorderSizePixel = 0
frame.Position = UDim2.new(0, 0, 1, 0)
frame.Size = UDim2.new(1, 0, 2, 0)
frame.Visible = true
frame.ZIndex = 8
frame.Parent = black_fade

local score = Instance.new("TextLabel")
score.Font = Enum.Font.ArialBold
score.Text = "0"
score.TextColor3 = Color3.new(1, 1, 1)
score.TextSize = 18
score.TextXAlignment = Enum.TextXAlignment.Left
score.TextYAlignment = Enum.TextYAlignment.Top
score.Position = UDim2.new(0, 4, 0, 4)
score.Visible = true
score.ZIndex = 5
score.Name = "Score"
score.Parent = game_frame

local white_frame = Instance.new("Frame")
white_frame.BackgroundColor3 = Color3.new(1, 1, 1)
white_frame.BackgroundTransparency = 1
white_frame.BorderSizePixel = 0
white_frame.Position = UDim2.new(0, -50, 0, -50)
white_frame.Size = UDim2.new(1, 100, 1, 100)
white_frame.Visible = true
white_frame.ZIndex = 10
white_frame.Name = "WhiteFrame"
white_frame.Parent = game_frame

local black_frame = Instance.new("Frame")
black_frame.BackgroundColor3 = Color3.new(0, 0, 0)
black_frame.BackgroundTransparency = 1
black_frame.BorderSizePixel = 0
black_frame.Position = UDim2.new(0, -50, 0, -50)
black_frame.Size = UDim2.new(1, 100, 1, 100)
black_frame.Visible = true
black_frame.ZIndex = 10
black_frame.Name = "BlackFrame"
black_frame.Parent = game_frame

local title_page = Instance.new("ImageLabel")
title_page.Image = "http://www.roblox.com/asset/?id=74753152"
title_page.BackgroundColor3 = Color3.new(0, 0, 0)
title_page.BorderSizePixel = 0
title_page.Size = UDim2.new(1, 0, 1, 0)
title_page.Visible = true
title_page.ZIndex = 8
title_page.Name = "TitlePage"
title_page.Parent = game_frame

local play = Instance.new("TextButton")
play.Font = Enum.Font.ArialBold
play.Text = "Play"
play.TextColor3 = Color3.new(1, 1, 1)
play.TextSize = 24
play.Style = Enum.ButtonStyle.RobloxButton
play.Position = UDim2.new(0.5, -180, 0, 250)
play.Size = UDim2.new(0, 200, 0, 40)
play.Visible = true
play.ZIndex = 8
play.Name = "Play"
play.Parent = title_page

local controls = Instance.new("TextButton")
controls.Font = Enum.Font.ArialBold
controls.Text = "Controls"
controls.TextColor3 = Color3.new(1, 1, 1)
controls.TextSize = 24
controls.Style = Enum.ButtonStyle.RobloxButton
controls.Position = UDim2.new(0.5, -180, 0, 305)
controls.Size = UDim2.new(0, 200, 0, 40)
controls.Visible = true
controls.ZIndex = 8
controls.Name = "Controls"
controls.Parent = title_page

local character_2 = Instance.new("ImageLabel")
character_2.Image = "http://www.roblox.com/asset/?id=73014404"
character_2.BackgroundColor3 = Color3.new(0.4, 1, 0.4)
character_2.BackgroundTransparency = 1
character_2.BorderSizePixel = 0
character_2.Position = UDim2.new(0, 220, 0, 87)
character_2.Size = UDim2.new(0, 45, 0, 45)
character_2.Visible = true
character_2.ZIndex = 9
character_2.Name = "Character"
character_2.Parent = title_page

local score_page = Instance.new("ImageLabel")
score_page.BackgroundColor3 = Color3.new(0, 0, 0)
score_page.BorderSizePixel = 0
score_page.Size = UDim2.new(1, 0, 1, 0)
score_page.Visible = false
score_page.ZIndex = 9
score_page.Name = "ScorePage"
score_page.Parent = game_frame

local okay = Instance.new("TextButton")
okay.Font = Enum.Font.ArialBold
okay.Text = "Ok"
okay.TextColor3 = Color3.new(1, 1, 1)
okay.TextSize = 24
okay.Style = Enum.ButtonStyle.RobloxButton
okay.Position = UDim2.new(0.5, -100, 0, 320)
okay.Size = UDim2.new(0, 200, 0, 40)
okay.Visible = true
okay.ZIndex = 9
okay.Name = "Okay"
okay.Parent = score_page

local best_score = Instance.new("TextLabel")
best_score.Text = "Best Score: 874382"
best_score.TextColor3 = Color3.new(1, 1, 1)
best_score.TextSize = 11
best_score.TextStrokeColor3 = Color3.new(1, 1, 0)
best_score.TextStrokeTransparency = 0.75
best_score.Position = UDim2.new(0.5, 0, 0, 120)
best_score.Visible = true
best_score.ZIndex = 9
best_score.Name = "BestScore"
best_score.Parent = score_page

local title = Instance.new("TextLabel")
title.Font = Enum.Font.ArialBold
title.Text = "High Scores"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextSize = 24
title.TextStrokeColor3 = Color3.new(1, 1, 0)
title.TextStrokeTransparency = 0.6499999761581421
title.BackgroundTransparency = 1
title.BorderSizePixel = 0
title.Position = UDim2.new(0.5, 0, 0, 50)
title.Visible = true
title.ZIndex = 9
title.Name = "Title"
title.Parent = score_page

local lastlight = Instance.new("TextLabel")
lastlight.Text = "Light Collected: 6"
lastlight.TextColor3 = Color3.new(1, 1, 1)
lastlight.TextSize = 11
lastlight.TextStrokeColor3 = Color3.new(1, 1, 0)
lastlight.Position = UDim2.new(0.5, 0, 0, 260)
lastlight.Visible = true
lastlight.ZIndex = 9
lastlight.Name = "LastLight"
lastlight.Parent = score_page

local best_dist = Instance.new("TextLabel")
best_dist.Text = "Best Distance: 345643"
best_dist.TextColor3 = Color3.new(1, 1, 1)
best_dist.TextSize = 11
best_dist.TextStrokeColor3 = Color3.new(1, 1, 0)
best_dist.TextStrokeTransparency = 0.75
best_dist.Position = UDim2.new(0.5, 0, 0, 140)
best_dist.Visible = true
best_dist.ZIndex = 9
best_dist.Name = "BestDist"
best_dist.Parent = score_page

local last_score = Instance.new("TextLabel")
last_score.Text = "Score: 345523"
last_score.TextColor3 = Color3.new(1, 1, 1)
last_score.TextSize = 11
last_score.TextStrokeColor3 = Color3.new(1, 1, 0)
last_score.Position = UDim2.new(0.5, 0, 0, 220)
last_score.Visible = true
last_score.ZIndex = 9
last_score.Name = "LastScore"
last_score.Parent = score_page

local best_light = Instance.new("TextLabel")
best_light.Text = "Best Light Collected: 15"
best_light.TextColor3 = Color3.new(1, 1, 1)
best_light.TextSize = 11
best_light.TextStrokeColor3 = Color3.new(1, 1, 0)
best_light.TextStrokeTransparency = 0.75
best_light.Position = UDim2.new(0.5, 0, 0, 160)
best_light.Visible = true
best_light.ZIndex = 9
best_light.Name = "BestLight"
best_light.Parent = score_page

local last_dist = Instance.new("TextLabel")
last_dist.Text = "Distance: 345523"
last_dist.TextColor3 = Color3.new(1, 1, 1)
last_dist.TextSize = 11
last_dist.TextStrokeColor3 = Color3.new(1, 1, 0)
last_dist.Position = UDim2.new(0.5, 0, 0, 240)
last_dist.Visible = true
last_dist.ZIndex = 9
last_dist.Name = "LastDist"
last_dist.Parent = score_page

local paused = Instance.new("ImageLabel")
paused.Image = "http://www.roblox.com/asset/?id=74299555"
paused.BackgroundTransparency = 1
paused.BorderSizePixel = 0
paused.Size = UDim2.new(1, 0, 1, 0)
paused.Visible = false
paused.ZIndex = 9
paused.Name = "Paused"
paused.Parent = game_frame

local controls_2 = Instance.new("ImageLabel")
controls_2.Image = "http://www.roblox.com/asset/?id=74304727"
controls_2.BackgroundColor3 = Color3.new(0, 0, 0)
controls_2.BorderSizePixel = 0
controls_2.Size = UDim2.new(1, 0, 1, 0)
controls_2.Visible = false
controls_2.ZIndex = 9
controls_2.Name = "Controls"
controls_2.Parent = game_frame

local title_2 = Instance.new("TextLabel")
title_2.Font = Enum.Font.ArialBold
title_2.Text = "Controls"
title_2.TextColor3 = Color3.new(1, 1, 1)
title_2.TextSize = 24
title_2.TextStrokeColor3 = Color3.new(1, 1, 0)
title_2.TextStrokeTransparency = 0.6499999761581421
title_2.BackgroundTransparency = 1
title_2.BorderSizePixel = 0
title_2.Position = UDim2.new(0.5, 0, 0, 35)
title_2.Visible = true
title_2.ZIndex = 9
title_2.Name = "Title"
title_2.Parent = controls_2

local back = Instance.new("TextButton")
back.Font = Enum.Font.ArialBold
back.Text = "Back"
back.TextColor3 = Color3.new(1, 1, 1)
back.TextSize = 24
back.Style = Enum.ButtonStyle.RobloxButton
back.Position = UDim2.new(0.5, -100, 0, 345)
back.Size = UDim2.new(0, 200, 0, 40)
back.Visible = true
back.ZIndex = 9
back.Name = "Back"
back.Parent = controls_2

local mountians1 = Instance.new("ImageLabel")
mountians1.Image = "http://www.roblox.com/asset/?id=74734792"
mountians1.BackgroundColor3 = Color3.new(0, 0.4, 1)
mountians1.BackgroundTransparency = 1
mountians1.Position = UDim2.new(0, 0, 0.150000006, 0)
mountians1.Size = UDim2.new(1, 0, 1, 0)
mountians1.Visible = true
mountians1.ZIndex = 4
mountians1.Name = "Mountians1"
mountians1.Parent = game_frame

local mountians = Instance.new("ImageLabel")
mountians.Image = "http://www.roblox.com/asset/?id=74734792"
mountians.BackgroundColor3 = Color3.new(1, 0, 0)
mountians.BackgroundTransparency = 1
mountians.Position = UDim2.new(1, 0, 0, 0)
mountians.Size = UDim2.new(1, 0, 1, 0)
mountians.Visible = true
mountians.ZIndex = 4
mountians.Name = "Mountians"
mountians.Parent = mountians1

local mountians2 = Instance.new("ImageLabel")
mountians2.Image = "http://www.roblox.com/asset/?id=74734757"
mountians2.BackgroundColor3 = Color3.new(0, 0.4, 1)
mountians2.BackgroundTransparency = 1
mountians2.Position = UDim2.new(0, 0, 0.25, 0)
mountians2.Size = UDim2.new(1, 0, 1, 0)
mountians2.Visible = true
mountians2.ZIndex = 3
mountians2.Name = "Mountians2"
mountians2.Parent = game_frame

local mountians_2 = Instance.new("ImageLabel")
mountians_2.Image = "http://www.roblox.com/asset/?id=74734757"
mountians_2.BackgroundColor3 = Color3.new(1, 0, 0)
mountians_2.BackgroundTransparency = 1
mountians_2.Position = UDim2.new(1, 0, 0, 0)
mountians_2.Size = UDim2.new(1, 0, 1, 0)
mountians_2.Visible = true
mountians_2.ZIndex = 3
mountians_2.Name = "Mountians"
mountians_2.Parent = mountians2

local mountians3 = Instance.new("ImageLabel")
mountians3.Image = "http://www.roblox.com/asset/?id=74734717"
mountians3.BackgroundColor3 = Color3.new(0, 0.4, 1)
mountians3.BackgroundTransparency = 1
mountians3.Position = UDim2.new(0, 0, 0.5, 0)
mountians3.Size = UDim2.new(1, 0, 1, 0)
mountians3.Visible = true
mountians3.ZIndex = 2
mountians3.Name = "Mountians3"
mountians3.Parent = game_frame

local mountians_3 = Instance.new("ImageLabel")
mountians_3.Image = "http://www.roblox.com/asset/?id=74734717"
mountians_3.BackgroundColor3 = Color3.new(1, 0, 0)
mountians_3.BackgroundTransparency = 1
mountians_3.Position = UDim2.new(1, 0, 0, 0)
mountians_3.Size = UDim2.new(1, 0, 1, 0)
mountians_3.Visible = true
mountians_3.ZIndex = 2
mountians_3.Name = "Mountians"
mountians_3.Parent = mountians3

local LocalScript = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/RaceTheSunset/LocalScript.lua", "local", Race_the_Sunset)
LocalScript.Name = "LocalScript"
