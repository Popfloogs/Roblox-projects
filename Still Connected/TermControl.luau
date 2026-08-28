--[[


local termStart = game.ReplicatedStorage.Events.Terminal.TerminalStart

local plr = game.Players.LocalPlayer
local tcCool = false
local dCool = false
local f1Cool = false
local pCool = false

local termFuncs = require(game.ReplicatedStorage.Events.TermFuncs)
local iService = require(game.ReplicatedStorage.startupServices.InteractionController)
local TCC = require(game.ReplicatedStorage.Interactables.TCC)
local file1 = require(game.ReplicatedStorage.Interactables.file1)
local pinPad = require(game.ReplicatedStorage.Interactables.PinPad)
local termEnd1 = game.ReplicatedStorage.Events.Terminal.TerminalEnd1
local termEnd2 = game.ReplicatedStorage.Events.Terminal.TerminalEnd2
local termEndFalse = game.ReplicatedStorage.Events.Terminal.TerminalEndFalse

local Note1 = require(game.ReplicatedStorage.Interactables.Notes.note1)
local Note2 = require(game.ReplicatedStorage.Interactables.Notes.note2)
local Note3 = require(game.ReplicatedStorage.Interactables.Notes.note3)
local Note4 = require(game.ReplicatedStorage.Interactables.Notes.note4)
local Note5 = require(game.ReplicatedStorage.Interactables.Notes.note5)
local Note6 = require(game.ReplicatedStorage.Interactables.Notes.note6)
local Note7 = require(game.ReplicatedStorage.Interactables.Notes.note7)
local Note8 = require(game.ReplicatedStorage.Interactables.Notes.note8)
local Note9 = require(game.ReplicatedStorage.Interactables.Notes.note9)
local Note10 = require(game.ReplicatedStorage.Interactables.Notes.note10)


local actionGUI = plr.PlayerGui:WaitForChild("Action")

local terminalHistory = {}

local function entranceTerm()
	
	print("entranceTerm")
	local plr = game.Players.LocalPlayer
	local char = plr.Character or plr.CharacterAdded:Wait()
	local HRP = char:WaitForChild("HumanoidRootPart")

	if tcCool then return end
	termFuncs.promptUpdate(plr, "Welcome to #### Inc.")
	termFuncs.promptUpdate(plr, "Please proceed to time clock")
end

local function camRestart()

	print("Cam Restarting")
	local plr = game.Players.LocalPlayer
	local char = plr.Character or plr.CharacterAdded:Wait()
	local HRP = char:WaitForChild("HumanoidRootPart")

	if tcCool then return end
	termFuncs.promptUpdate(plr, "Unauthorized break detected")
	termFuncs.promptUpdate(plr, "Please return to work station")
end

local function fullTerm(termRuns)

	local maingui = plr.PlayerGui:WaitForChild("TerminalGui").main

	maingui.Enabled = true

	local mainFrame = maingui:WaitForChild("Frame")
	local outputFrame = mainFrame:WaitForChild("OutputFrame")
	local outputLabel = outputFrame:WaitForChild("OutputLabel")
	local inputFrame = mainFrame:WaitForChild("InputFrame")
	local inputBox = inputFrame:WaitForChild("InputBox")

	local terminalHistory = {}
	local terminalState = "idle"

	local function getTimeString()
		return os.date("%H:%M:%S")
	end

	local function addLine(speaker, message)
		if #terminalHistory == 4 then
			table.remove(terminalHistory, 1)
		end
		local line = string.format("[%s] %s > %s", getTimeString(), speaker, message)
		table.insert(terminalHistory, line)
		outputLabel.Text = table.concat(terminalHistory, "\n")
	end

	local function systemMessage(message)
		addLine("System", message)
	end

	local function userMessage(message)
		addLine("User", message)
	end

	inputBox.FocusLost:Connect(function(enterPressed)
		if not enterPressed then return end

		local text = inputBox.Text
		if text == "" then return end

		local lowered = string.lower(text)

		userMessage(text)
		inputBox.Text = ""

		if lowered == "exit" then
			maingui.Enabled = false

			if termRuns == 1 then
				termEnd1:FireServer()
			elseif termRuns == 2 then
				termEnd2:FireServer()
			else
				termEndFalse:FireServer()
			end
			return
		end

		systemMessage("Unknown command.")
	end)

	systemMessage("Terminal online.\n Hello User 4812,\n Begin work.")
	systemMessage("Awaiting record insertion.")
	if termRuns == 1 then
		systemMessage("Insert record:\n 1.) File One\n 2.)\n 3.)\n 4.)\n")
	elseif termRuns == 2 then
		systemMessage("Insert record:\n 1.) File One\n 2.) File Two\n 3.)\n 4.)\n")
	else
		systemMessage("No records found... Please close terminal")
	end
end

local function TCTerm()
	if tcCool then return end
	termFuncs.promptUpdate(plr, "Press 'Action Button' to punch in")
	termFuncs.promptUpdate(plr, "Tip: Action buttons include: PC - E, console x/circle, mobile - tap")
	TCC.start()
	tcCool = true
end

local function File1()
	if f1Cool then return end
	termFuncs.promptUpdate(plr, "Misplaced file found. Please collect and bring to workspace")
	local pl = game.Workspace.Rooms.Lounge.File1.Case.PointLight
	pl.Enabled = true
	file1.start()
	f1Cool = true
end

local function pinpad()
	if f1Cool then return end
	termFuncs.promptUpdate(plr, "Enter the code to continue")
	pinPad.start()
	pCool = true
end

local function discrepancy()
	if dCool then return end
	termFuncs.promptUpdate(plr, "Discrepancy detected. Employee #: 4812.")
	task.wait(1)
	termFuncs.promptUpdate(plr, "Unauthorized Access detected: Beginning Security Patrol.")
	dCool = true
end

local function TermClose()
	termFuncs.termClose(plr)
end



--Begin Note Actuation--
local function note1()
	Note1.start()
end

local function note2()
	Note2.start()
end

local function note3()
	Note3.start()
end

local function note4()
	Note4.start()
end

local function note5()
	Note5.start()
end

local function note6()
	Note6.start()
end

local function note7()
	Note7.start()
end

local function note8()
	Note8.start()
end

local function note9()
	Note9.start()
end

local function note10()
	Note10.start()
end



--End Note Actuation--


termStart.OnClientEvent:Connect(function(mode, termRuns)
	print("Terminal Mode received: " .. tostring(mode))
	if mode == "Cam" then
		entranceTerm()
	elseif mode == "restartCam" then
		camRestart()
	elseif mode == "TC" then
		TCTerm()
	elseif mode == "Anomaly" then
		discrepancy()
	elseif mode == "file" then
		File1()
	elseif mode == "Off" then
		TermClose()
	elseif mode == "Term" then
		fullTerm(termRuns)
	elseif mode == "pinpad" then
		pinpad()
	elseif mode == "note1" then
		note1()
	elseif mode == "note2" then
		note2()
	elseif mode == "note3" then
		note3()
	elseif mode == "note4" then
		note4()
	elseif mode == "note5" then
		note5()
	elseif mode == "note6" then
		note6()
	elseif mode == "note7" then
		note7()
	elseif mode == "note8" then
		note8()
	elseif mode == "note9" then
		note9()
	elseif mode == "note10" then
		note10()
	end
	
end)
]]--