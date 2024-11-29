local Debris = game:GetService("Debris")

local uilib = loadstring(game:HttpGet("https://raw.githubusercontent.com/resurvenge/Qxi/master/guilibrary.lua", true))()
if uilib then
	print("ok")
	print(uilib.title)
	print(uilib.VERSION)
end

local BlatantCategory = uilib.CreateCategory({ Name =  "Blatant", })
local WorldCategory = uilib.CreateCategory({ Name =  "World", })

local Blatant = BlatantCategory.CreateWindow({ Name =  "Blatant"})
local World = WorldCategory.CreateWindow({ Name =  "World", })

Blatant.CreateButton({ Name = "jumpHeight", Function = function()
	   game.Players.LocalPlayer.Character.Humanoid.JumpHeight = 30
end})

Blatant.CreateButton({ Name = "Speed {dont try in bedwars]", Function = function()
	  local old = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
	  game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50
end})

World.CreateButton({ Name = "ESP", Function = function(toggle)
	    if toggle then
			   print("sucessful")
		end
end})
