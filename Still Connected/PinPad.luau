local PinPad = {}

local pinEvent = game.ReplicatedStorage.Events.Actions.PinPad
local iService = require(game.ReplicatedStorage.startupServices.InteractionController)

function PinPad.start()
	iService.setTarget(PinPad)
end

local function complete()
	iService.clearTarget(PinPad)
end

function PinPad:Interact(plr)
	
	plr.PlayerGui.pinpad.Enabled = true
	local char = plr.Character
	local hum = char:WaitForChild("Humanoid")
	
	hum.WalkSpeed = 0
	
	complete()
end

function PinPad.Result(plr, pBool)
	pinEvent:FireClient(plr, pBool)
end

return PinPad
