local InteractablesRegistry = {}

local detectionRegistry = require(game.ServerScriptService.Registries.DetectionRegistry)

local interactables = {
	["TimeClock"] = {
		Name = "TimeClock",

		modeTrigger = "TimeClock",

		switchTrigger = workspace.Rooms.Hallway.TimeClock.TCPrompt,

		cam = {
			name = "Hallway_1 Cam",
			anchor = workspace.Rooms.Hallway:WaitForChild("CameraAnchor1"),
			cameraSubject = workspace.Rooms.Hallway.CameraAnchor1.CameraSubject,

		},

		priority = 2,

		trap = nil,

		trapCool = nil,

		setDetect = true,
	},

	["file1"] = {
		Name = "File1",

		modeTrigger = "file",

		model = nil,

		switchTrigger = nil,

		cam = {
			name = nil,
			anchor = nil,
			cameraSubject = nil,

		},

		priority = 1,

		trap = nil,

		trapCool = nil,

		setDetect = true,
	},
	
	["file2"] = {
		Name = "File2",

		modeTrigger = "file",

		model = nil,

		switchTrigger = nil,

		cam = {
			name = nil,
			anchor = nil,
			cameraSubject = nil,

		},

		priority = 1,

		trap = nil,

		trapCool = nil,

		setDetect = true,
	},
	['CardReader'] = {
		Name = "CardReader",

		modeTrigger = "CardReader",

		model = nil,

		switchTrigger = nil,

		cam = {
			name = nil,
			anchor = nil,
			cameraSubject = nil,

		},

		priority = 1,

		trap = nil,

		trapCool = nil,

		setDetect = true,
	},
}

function InteractablesRegistry.requestFiles()
	local files = {}
	files["file1"] = interactables["file1"]
	files["file2"] = interactables["file2"]
	return files
end



function InteractablesRegistry.receiveActiveFiles(activeFiles)
	for _, i in pairs(activeFiles) do
		detectionRegistry.detectables[i.Name] = i
	end
	print(detectionRegistry.detectables)
end

return InteractablesRegistry
