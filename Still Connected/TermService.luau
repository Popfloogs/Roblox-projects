local termService = {}

local termStart = game.ReplicatedStorage.Events.Terminal.TerminalStart
local termEnd1 = game.ReplicatedStorage.Events.Terminal.TerminalEnd1
local termEnd2 = game.ReplicatedStorage.Events.Terminal.TerminalEnd2
local termRuns = 0
local trapService = require(game.ServerScriptService.TrapService)

termService.termModes = {}




local function initTerminal(plr, termMode)
	termRuns = plr:GetAttribute("FilesFound")
	termService.termModes[plr.UserId] = termMode
	termStart:FireClient(plr, termMode, termRuns)
end

local function continueMode(plr)
	local sameMode = "Same"
	termStart:FireClient(plr, sameMode)
end


function termService.startTerminal(plr, mode)
		initTerminal(plr, mode.termMode)
end

return termService
