local detectionRegistry = {}

--local trapService = require(game.ServerScriptService.TrapService)


detectionRegistry.detectables = {
	
	["Hallway"] = {
		Name = "Hallway",
		
		modeTrigger = "Security",

		switchTrigger = workspace.Rooms.Hallway:WaitForChild("CameraSwitchTrigger"),

		cam = { 
			name = "Hallway Cam",
			anchor = workspace.Rooms.Hallway:WaitForChild("CameraAnchor1"),
			cameraSubject = workspace.Rooms.Hallway.CameraAnchor1.CameraSubject,
		},

		priority = 1,

		trap = nil,

		trapCool = nil,

		setDetect = true,
	},
	
	["Entrance"] = {
		Name = "Entrance",
		
		modeTrigger = "Security",

		switchTrigger = workspace.Rooms.Entrance:WaitForChild("CameraSwitchTrigger"),

		cam = { 
			name = "Entrance Cam",
			anchor = workspace.Rooms.Entrance:WaitForChild("CameraAnchor1"),
			cameraSubject = workspace.Rooms.Entrance.CameraAnchor1.CameraSubject,
		},

		priority = 1,

		trap = nil,

		trapCool = nil,

		setDetect = true,
	},
	
}


return detectionRegistry