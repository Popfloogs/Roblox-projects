local TCC = {}

local iService = require(game.ReplicatedStorage.startupServices.InteractionController)

local tcCool
local TCActionPart = workspace.Rooms.Hallway.TimeClock:WaitForChild("TCPrompt")

function TCC.start()
	iService.setTarget(TCC)
end

local function complete()
	iService.clearTarget(TCC)
end



function TCC:Interact(plr)
	local TCCool = false

	local termUpdate = require(game.ReplicatedStorage.Events.TermFuncs)

	local currenttime = DateTime.now()

	local timeCheckStart
	local timeCheckPunch
	
	local light = TCActionPart.Parent.light
	timeCheckStart = currenttime.UnixTimestamp		
	light.Color = Color3.fromRGB(0, 255, 0)
	light.SpotLight.Color = Color3.fromRGB(0, 255, 0)
	currenttime = DateTime.now()
	timeCheckPunch = currenttime.UnixTimestamp

	if (currenttime.UnixTimestamp - timeCheckStart) < 30 then
		termUpdate.promptUpdate(plr, "Punch Accepted")
		
	elseif (currenttime.UnixTimestamp - timeCheckStart) > 30 then
		termUpdate.promptUpdate(plr, "Punch Accepted... late...")

	end

	task.delay(2, function()
		termUpdate.promptUpdate(plr, "Employee #: 4812 Please proceed to workstation")
		light.Color = Color3.fromRGB(255, 0, 0)
		light.SpotLight.Color = Color3.fromRGB(255, 0, 0)
	end)
	complete()
end



return TCC
