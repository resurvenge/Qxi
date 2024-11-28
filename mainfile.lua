
local uilib = loadstring(game:HttpGet("https://raw.githubusercontent.com/resurvenge/Qxi/master/guilibrary.lua", true))()



local category = uilib.CreateCategory({ Name =  "Diego Hub", })
local window = category.CreateWindow({ Name =  "Blatant"})

local button = window.CreateButton({ Name = "cLICK ME", Function = function() print ("alr") end})
