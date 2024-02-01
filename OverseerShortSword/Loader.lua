local MisL : "Library" = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SebasRomTen/MisL/main/source.lua"))()
oldrequire = require
local require = LoadAssets

--//Gear Setup
local rawGear = require(16191942842)
local Gear = nil
Gear = rawGear:Get("Overseer Short Sword")
Gear.Parent = owner.Backpack

--//Script Setup

local LS = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/OverseerShortSword/LocalScript.lua", "local", Gear)
LS.Name = "LocalScript"

local MI = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/OverseerShortSword/MouseIcon.lua", "local", Gear)
MI.Name = "MouseIcon"

local Script = MisL.newScript("https://raw.githubusercontent.com/SebasRomTen/Gears/main/OverseerShortSword/Script.lua", "server", Gear)
Script.Name = "Script"
