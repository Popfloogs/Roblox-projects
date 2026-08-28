local NoteRegistry = {}

local DetectionRegistry = require(game.ServerScriptService.Registries.DetectionRegistry)

local Notes ={
	["Note10"]= {
		name = "note10",

		modeTrigger = "note10",

		switchTrigger = workspace.Rooms.OfficePark.OfficePark.Office1.note10:WaitForChild("prompt"),

		cam = {
			name = "Office_1 Cam",
			anchor = workspace.Rooms.OfficePark.OfficePark.Office1:WaitForChild("CameraAnchor1"),
			cameraSubject = workspace.Rooms.OfficePark.OfficePark.Office1.CameraAnchor1.CameraSubject,
		},

		priority = 2,

		trap = nil,

		trapCool = nil,

		setDetect = false,
	},
	["Note1"]= {
		name = "note1",

		modeTrigger = "note1",

		switchTrigger = workspace.Rooms.Entrance.note1:WaitForChild("prompt"),

		cam = { 
			name = "Entrance Cam",
			anchor = workspace.Rooms.Entrance:WaitForChild("CameraAnchor1"),
			cameraSubject = workspace.Rooms.Entrance.CameraAnchor1.CameraSubject,
		},

		priority = 2,

		trap = nil,

		trapCool = nil,

		setDetect = false,
	},
	["Note2"]= {
		name = "note2",

		modeTrigger = "note2",

		switchTrigger = workspace.Rooms.Hallway.note2:WaitForChild("prompt"),

		cam = {
			name = "Hallway_1 Cam",
			anchor = workspace.Rooms.Hallway:WaitForChild("CameraAnchor1"),
			cameraSubject = workspace.Rooms.Hallway.CameraAnchor1.CameraSubject,

		},

		priority = 2,

		trap = nil,

		trapCool = nil,

		setDetect = false,
	},
	["Note3"]= {
		name = "note3",

		modeTrigger = "note3",

		switchTrigger = workspace.Rooms.Hallway.note3:WaitForChild("prompt"),

		cam = {
			name = "Hallway_1 Cam",
			anchor = workspace.Rooms.Hallway:WaitForChild("CameraAnchor1"),
			cameraSubject = workspace.Rooms.Hallway.CameraAnchor1.CameraSubject,

		},

		priority = 2,

		trap = nil,

		trapCool = nil,

		setDetect = false,
	},
	["Note4"]= {
		name = "note4",

		modeTrigger = "note4",

		switchTrigger = workspace.Rooms.Lounge.Lounge.note4:WaitForChild("prompt"),

		cam = {
			name = "Breakroom_1 Cam",
			anchor = workspace.Rooms.Lounge.Lounge:WaitForChild("CameraAnchor1"),
			cameraSubject = workspace.Rooms.Lounge.Lounge.CameraAnchor1.CameraSubject,

		},

		priority = 2,

		trap = nil,

		trapCool = nil,

		setDetect = false,
	},
	["Note5"]= {
		name = "note5",

		modeTrigger = "note5",

		switchTrigger = workspace.Rooms.Lounge.Lounge.note5:WaitForChild("prompt"),

		cam = {
			name = "Breakroom_1 Cam",
			anchor = workspace.Rooms.Lounge.Lounge:WaitForChild("CameraAnchor1"),
			cameraSubject = workspace.Rooms.Lounge.Lounge.CameraAnchor1.CameraSubject,

		},

		priority = 2,

		trap = nil,

		trapCool = nil,

		setDetect = false,
	},
	["Note6"]= {
		name = "note6",

		modeTrigger = "note6",

		switchTrigger = workspace.Rooms.OfficePark.OfficePark.Office4.note6:WaitForChild("prompt"),

		cam = {
			name = "Office_1 Cam",
			anchor = workspace.Rooms.OfficePark.OfficePark.Office4:WaitForChild("CameraAnchor1"),
			cameraSubject = workspace.Rooms.OfficePark.OfficePark.Office4.CameraAnchor1.CameraSubject,
		},

		priority = 2,

		trap = nil,

		trapCool = nil,

		setDetect = false,
	},
	["Note7"]= {
		name = "note7",

		modeTrigger = "note7",

		switchTrigger = workspace.Rooms.OfficePark.OfficePark.Office7.note7:WaitForChild("prompt"),

		cam = {
			name = "Office_1 Cam",
			anchor = workspace.Rooms.OfficePark.OfficePark.Office7:WaitForChild("CameraAnchor1"),
			cameraSubject = workspace.Rooms.OfficePark.OfficePark.Office7.CameraAnchor1.CameraSubject,
		},

		priority = 2,

		trap = nil,

		trapCool = nil,

		setDetect = false,
	},
	["Note8"]= {
		name = "note8",

		modeTrigger = "note8",

		switchTrigger = workspace.Rooms.OfficePark.OfficePark.Office6.note8:WaitForChild("prompt"),

		cam = {
			name = "Office_1 Cam",
			anchor = workspace.Rooms.OfficePark.OfficePark.Office6:WaitForChild("CameraAnchor1"),
			cameraSubject = workspace.Rooms.OfficePark.OfficePark.Office6.CameraAnchor1.CameraSubject,
		},

		priority = 2,

		trap = nil,

		trapCool = nil,

		setDetect = false,
	},
	["Note9"]= {
		name = "note9",

		modeTrigger = "note9",

		switchTrigger = workspace.Rooms.OfficePark.OfficePark.Office3.note9:WaitForChild("prompt"),

		cam = {
			name = "Office_1 Cam",
			anchor = workspace.Rooms.OfficePark.OfficePark.Office3:WaitForChild("CameraAnchor1"),
			cameraSubject = workspace.Rooms.OfficePark.OfficePark.Office3.CameraAnchor1.CameraSubject,
		},

		priority = 2,

		trap = nil,

		trapCool = nil,

		setDetect = false,
	},
}

function NoteRegistry.setNotes(notes)
	for _, i in pairs(Notes) do
		for _, j in pairs(notes) do
			if i.name == j.name then
				i.setDetect = true
				DetectionRegistry.detectables[i.name] = i
			end
		end
	end
	print(DetectionRegistry.detectables)
end

return NoteRegistry
