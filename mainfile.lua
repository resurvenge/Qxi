local Debris = game:GetService("Debris")
local playerService = game:GetService("Players")
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
	   game.Players.LocalPlayer.Character.Humanoid.JumpHeight = 40
end})



Blatant.CreateButton({ Name = "Speed {dont try in bedwars]", Function = function(toggle)
	local old = playerService.LocalPlayer.Character.Humanoid.WalkSpeed
	  if toggle then
		   playerService.LocalPlayer.Character.Humanoid.WalkSpeed = 100
	  else
	  	  playerService.LocalPlayer.Character.Humanoid.WalkSpeed = old
	  end
end})


local espConnection
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
			   espConnection = playerService.ChildAdded:Connect(function(plr)
					 plr.ChildAdded:Connect(function()
							local HighlightInstance = Instance.new("Highlight")
							HighlightInstance.Parent = plr.Character
					 end)
			   end)
			else
				for _, player in pairs(playerService:GetChildren()) do
					if player then
						   if player.Character then
								  for _, obj in pairs(player.Character:GetChildren()) do
									     if obj:IsA("Highlight") then
											    obj:Destroy()
												espConnection:Disconnect()
										 end
								  end
						   end
					end
			end
		end
end})
