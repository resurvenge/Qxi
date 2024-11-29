local Debris = game:GetService("Debris")
local playerService = game:GetService("Players")
local uilib = loadstring(game:HttpGet("https://raw.githubusercontent.com/resurvenge/Qxi/master/guilibrary.lua", true))()
if uilib then
	print("ok")
	print(uilib.title)
	print(uilib.VERSION)
end


print("script ver. 1")

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
			   for _, player in pairs(playerService:GetChildren()) do
				       if player then
						      if player.Character then
								     local HighlightInstance = Instance.new("Highlight")
									 HighlightInstance.Parent = player.Character
							  end
					   end
			   end
			else
				for _, player in pairs(playerService:GetChildren()) do
					if player then
						   if player.Character then
								  for _, obj in pairs(player.Character:GetChildren()) do
									     if obj:IsA("Highlight") then
											    obj:Destroy()
										 end
								  end
						   end
					end
			end
		end
end})
