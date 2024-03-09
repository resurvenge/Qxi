# Qxi

A roblox hack client that I just started. I will be working on this client!

-----------------

# Usage

* Go to the loadstring file and copy it then paste it into executor

-----------------
# DEVLOGS

* Since roblox is deleting gotham and arial fonts i decided to add a font table to Qxi

```lua

local guilibraryT = { Font = Enum.Font.Arial } -- Can now change the value of the fonts

```
* Added reloading for roblox studio
```lua


local guilibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/resurvenge/Qxi/master/guilibrary.lua", true))()
_G.reload = function()
            -- IMPORT ALL OF THE CODE YOU WANT TO RELOAD

             return loadQxi(); -- MUST BE AT THE END
 end

```

* CURRENTLY WORKING ON RESTORING SHARED.ASSETS TABLE 
------------

* if you have any bugs please dm (discord: "kepwastaken" or if that doesnt work then its "2.ik.2")
