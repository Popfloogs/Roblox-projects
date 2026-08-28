local TermFuncs = {}

local terminalHistory = {}

function TermFuncs.promptUpdate(plr, message)
	
	if #terminalHistory == 2 then
		table.remove(terminalHistory, 1)
	end
	
	local actionGUI = plr.PlayerGui:WaitForChild("Action")
	local currenttime = DateTime.now()
	local output = actionGUI["Terminal/Cams"].output
	
	table.insert(terminalHistory, currenttime:FormatLocalTime("LTS", "en-us") .. "> " .. message)
	output.Text = table.concat(terminalHistory, "\n")
end

function TermFuncs.termClose(plr)
	local actionGUI = plr.PlayerGui:WaitForChild("Action")
	
	actionGUI.Enabled = false
	
end

return TermFuncs
