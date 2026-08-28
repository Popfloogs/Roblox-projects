local pService = {}

local pinP = game.ReplicatedStorage.Events.Actions.PinPad
local pPModule = require(game.ReplicatedStorage.Interactables.PinPad)
--local tService = require(game.ServerScriptService.TrapService)


pService.Pin = nil
pService.pBool = false

local function pinSpawn()
	local pinSpawns = {
		["1"] = workspace.Rooms.Entrance.PINSPawn,
		["2"] = workspace.Rooms.Hallway.PINSPawn,
		["3"] = workspace.Rooms.Lounge.PINSPawn,
		["4"] = workspace.Rooms.OfficePark.PINSPawn,
	}
	
	local random = math.random(1, 4)
	
	local pinSurface = pinSpawns[tostring(random)]
	
	pinSurface.SurfaceGui.Enabled = true
	pinSurface.SurfaceGui.TextLabel.Text = pService.Pin
end

function pService.GeneratePin()
	if pService.Pin ~= nil then return end
	local pin = math.random(1000, 9999)
	pService.Pin = tostring(pin)
	--***REMOVE THE LINE BELOW THIS***--
	print(pService.Pin)
	
	return pService.Pin
end

pinP.OnServerEvent:Connect(function(plr, pin)
	
	if pService.Pin == nil then return end
	
	if pin == pService.Pin then
		--tService.actuateTrap(plr, "lDo")
		pService.pBool = true
		pService.Pin = nil
	else
		pService.pBool = false
	end
	pPModule.Result(plr, pService.pBool)
	
end)



return pService