local GMM = {} --Game Mode Manager

local camService = require(script.Parent.CamService)
local fileService = require(script.Parent.FileService)
local noteService = require(script.Parent.NoteService)
local envService = require(script.Parent.EnvService)
local trapService = require(script.Parent.TrapService)
local termService = require(script.Parent.TermService)
local chrisService = require(workspace.Chris.ChrisService)
local droneService = require(workspace.Rooms.Lounge.Lounge.Drone1.DroneService)

function GMM.StartGame()
	local loaded = false
	local result = envService.Init()
	print(result)
	result = fileService.Init()
	print(result)
	result = noteService.Init()
	print(result)
	
	loaded = true
	return loaded
end

local playerState = {}

local function getState(plr)
	playerState[plr.UserId] = playerState[plr.UserId] or {
		mode = nil,
		cam = nil,
		trap = nil,
		trapCool = nil,
		horrorLock = false,
		termLock = false,
		FPVLock = false,
	}

	return playerState[plr.UserId]
end

local Modes = { --Modes key/value pairs for abstraction
	["Security"] = {
		name = "Cam",
		termMode = "Cam",
		env = "Corporate",
	},
	["Security2"] = {
		name = "Cam",
		termMode = "restartCam",
		env = "Corporate"
	},
	["fpv"] = {
		["Horror"] = {
			env = "Horror",
			name = "FPV",
			termMode = "Off",
		},
		["FPV"] = {
			env = "Combo",
			name = "FPV",
			termMode = "Off",
		},
	},
	["Terminal"] = {
		name = "Term",
		termMode = "Term",
		env = nil,
	},
	["TimeClock"] = {
		name = "TimeClock",
		termMode = "TC",
		env = "Corporate",
	},
	["file"] = {
		name = "File",
		termMode = "file",
		env = "Corporate",
	},
	["pinpad"] = {
		name = "pinpad",
		termMode = "pinpad",
		env = "Corporate",
	},
	["Discrep"] = {
		name = "Cam",
		termMode = "Anomaly",
		env = "Corporate"
	},
	["note1"] = {
		name = "note1",
		termMode = "note1",
		env = "Corporate"
	},
	["note2"] = {
		name = "note2",
		termMode = "note2",
		env = "Corporate"
	},
	["note3"] = {
		name = "note3",
		termMode = "note3",
		env = "Corporate"
	},
	["note4"] = {
		name = "note4",
		termMode = "note4",
		env = "Corporate"
	},
	["note5"] = {
		name = "note5",
		termMode = "note5",
		env = "Corporate"
	},
	["note6"] = {
		name = "note6",
		termMode = "note6",
		env = "Corporate"
	},
	["note7"] = {
		name = "note7",
		termMode = "note7",
		env = "Corporate"
	},
	["note8"] = {
		name = "note8",
		termMode = "note8",
		env = "Corporate"
	},
	["note9"] = {
		name = "note9",
		termMode = "note9",
		env = "Corporate"
	},
	["note10"] = {
		name = "note10",
		termMode = "note10",
		env = "Corporate"
	},
}



local function updateCam(plr, cam, mode) --private function for passing compiled data to CamService
	if plr:GetAttribute("Cam") == nil then 	plr:SetAttribute("Cam", cam.name) end

	camService.updateCam(plr, cam, mode)
end -- sending info

--[[local function updateEnvironment(plr, env, horrorLock) --private function for passing compiled data to EnvService
	if plr:GetAttribute("env") == env then return end 
	horrorLock = envService.updateEnvironment(plr, env, horrorLock)
	return horrorLock
end -- sending info]]--




local function FPVMode(plr, state, room)
	local state = getState(plr)

	state.mode = Modes["fpv"].FPV
	state.cam = {
		name = "FPV",
		anchor = nil,
		cameraSubject = nil,
	}

	state.trap = plr:GetAttribute("trapSwitch")
	state.trapCool = nil

	if state.trap ~= nil then
		trapService.actuateTrap(plr, state.trap)
	end

	updateCam(plr, state.cam, state.mode.name)
	termService.startTerminal(plr, state.mode)
	--updateEnvironment(plr, state.mode.env)
end



local function TermMode(plr, state, room)
	local state = getState(plr)

	state.mode = Modes["Terminal"]
	state.cam = {
		name = "Terminal",
		anchor = nil,
		cameraSubject = nil,
	}
	state.trap = nil
	state.trapCool = nil

	if state.trap ~= nil then
		room.trapCool = trapService.actuateTrap(plr, state.trap, state.trapCool)
	end

	updateCam(plr, state.cam, state.mode.name)
	termService.startTerminal(plr, state.mode)
	--updateEnvironment(plr, state.mode.env)
	plr:SetAttribute("OfficetrapCool", false)
	plr:SetAttribute("trapSwitch", "oDo")
	local termRuns = plr:GetAttribute("FilesFound")
	if termRuns == 1 then
		local file2 = game.Workspace.Rooms.Entrance.File2
		for _, obj in ipairs(file2:GetDescendants()) do
			if obj:IsA("BasePart") or obj:IsA("Decal") then
				obj.Transparency = 0
			end
		end

		file2.Top.ProximityPrompt.Enabled = true
		file2.Case.PointLight.Enabled = true
	end
end



function GMM.HorrorMode(plr)
	local state = getState(plr)

	state.mode = Modes["fpv"].Horror
	state.cam = {
		name = "FPV",
		anchor = nil,
		cameraSubject = nil,
	}

	updateCam(plr, state.cam, state.mode.name)
	termService.startTerminal(plr, state.mode)
	--updateEnvironment(plr, state.mode.env)
	chrisService.StartChris()
end



local function updateRoom(plr, state, roomData) --private function that updates the room based on data received by RoomService

	--if plr:GetAttribute("FPVMode") ~= nil then return end

	state.mode = Modes[roomData.modeTrigger]
	state.cam = roomData.cam
	state.trap = roomData.trap


	if state.trap ~= nil then
		plr:SetAttribute("trapSwitch", state.trap)
		roomData.trapCool = trapService.actuateTrap(plr, state.trap)
	end

	updateCam(plr, state.cam, state.mode.name)
	termService.startTerminal(plr, state.mode)
	--updateEnvironment(plr, state.mode.env)

end --receiving info


function GMM.receive(plr, room) -- this is the exposed function that RoomService interacts with

	local state = getState(plr)

	if plr:GetAttribute("FPVMode") == 'FPV' or room.name == "Switch2Fp" then
		--plr:SetAttribute("FPVMode", "FPV")FPVMode(plr, state, room)

	elseif room.name == "Switch2Term" then
		--plr:SetAttribute("FPVMode", "Terminal")
		--TermMode(plr, state, room)

	elseif room.Name == "Lounge" then
		updateRoom(plr, state, room)
		task.spawn(droneService.StartDrone, plr)
	else 
		plr:SetAttribute("FPVMode", nil)
	end


	updateRoom(plr, state, room)


end -- receiving info




function GMM.EndGame(plr)
	local state = getState(plr)
	state.horrorLock = false
	state.termLock = false
	state.trapCool = false
	state.cam = nil
	state.trap = nil
	state.mode = nil

	GameOver.FireClient(plr)
end


return GMM
