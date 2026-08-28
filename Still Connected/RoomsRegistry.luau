local RoomsRegistry = {}

local detectionRegistry = require(game.ServerScriptService.Registries.DetectionRegistry)

local Nodes = {

	[1] = {
		Name = "Lounge",

		Model = workspace.Rooms.Lounge.Lounge,

		Nodes = {
			Node = {
				Node = workspace.Rooms.Lounge.Lounge.Nodes:WaitForChild("Node"),
				Used = false,
			},
			Node1 = {
				Node = workspace.Rooms.Lounge.Lounge.Nodes:WaitForChild("Node1"),
				Doors = workspace.Rooms.Lounge.Lounge.Nodes.Node1.Doors,
				Used = false,
			},
			Node2 = {
				Node = workspace.Rooms.Lounge.Lounge.Nodes:WaitForChild("Node2"),
				Doors = workspace.Rooms.Lounge.Lounge.Nodes.Node2.Doors,
				Used = false,
			},
			Node3 = {
				Node = workspace.Rooms.Lounge.Lounge.Nodes:WaitForChild("Node3"),
				Doors = workspace.Rooms.Lounge.Lounge.Nodes.Node3.Doors,
				Used = false,
			},
		},

		Data = {

			modeTrigger = 'Security',

			switchTrigger = workspace.Rooms.Lounge.Lounge:WaitForChild("CameraSwitchTrigger"),

			cam = {
				name = "Breakroom_1 Cam",
				anchor = workspace.Rooms.Lounge.Lounge:WaitForChild("CameraAnchor1"),
				cameraSubject = workspace.Rooms.Lounge.Lounge.CameraAnchor1.CameraSubject,

			},

			priority = 1,

			trap = "lD",

			trapCool = false,

			setDetect = true,
		},
	},

	[2]= {
		Name = "OfficePark",

		Model = workspace.Rooms.OfficePark.OfficePark,

		Nodes = {
			Node = {
				Node =workspace.Rooms.OfficePark.OfficePark.Nodes:WaitForChild("Node"),
				Doors = workspace.Rooms.OfficePark.OfficePark.Nodes.Node.Doors,
				Used = false,
			},
			Node1 = {
				Node = workspace.Rooms.OfficePark.OfficePark.Nodes:WaitForChild("Node1"),
				Doors = workspace.Rooms.OfficePark.OfficePark.Nodes.Node1.Doors,
				Used = false,
			},
			Node2 = {
				Node = workspace.Rooms.OfficePark.OfficePark.Nodes:WaitForChild("Node2"),
				Doors = workspace.Rooms.OfficePark.OfficePark.Nodes.Node2.Doors,
				Used = false,
			},
			Node3 = {
				Node = workspace.Rooms.OfficePark.OfficePark.Nodes:WaitForChild("Node3"),
				Doors = workspace.Rooms.OfficePark.OfficePark.Nodes.Node3.Doors,
				Used = false,
			},
		},

		Data ={

			modeTrigger = nil,

			switchTrigger = nil,

			cam = {
				name = "Office_1 Cam",
				anchor = nil,
				cameraSubject = nil,
			},

			priority = nil,

			trap = nil,

			trapCool = nil,

			setDetect = nil,
		},
	},
}

local auxillaryRooms = {
	["OfficePark"] = {
		["Office1"]= {
			Name = "Office1",

			modeTrigger = "Security",

			switchTrigger = workspace.Rooms.OfficePark.OfficePark.Office1:WaitForChild("CameraSwitchTrigger"),

			cam = {
				name = "Office_1 Cam",
				anchor = workspace.Rooms.OfficePark.OfficePark.Office1:WaitForChild("CameraAnchor1"),
				cameraSubject = workspace.Rooms.OfficePark.OfficePark.Office1.CameraAnchor1.CameraSubject,
			},

			priority = 1,

			trap = nil,

			trapCool = nil,

			setDetect = true,
		},

		["Office2"]= {
			Name = "Office2",

			modeTrigger = 'Security',

			switchTrigger = workspace.Rooms.OfficePark.OfficePark.Office2:WaitForChild("CameraSwitchTrigger"),

			cam = {
				name = "Office_2 Cam",
				anchor = workspace.Rooms.OfficePark.OfficePark.Office2:WaitForChild("CameraAnchor1"),
				cameraSubject = workspace.Rooms.OfficePark.OfficePark.Office2.CameraAnchor1.CameraSubject,
			},

			priority = 1,

			trap = nil,

			trapCool = nil,

			setDetect = true,
		},

		["Office3"]= {
			Name = "Office3",

			modeTrigger = 'Security',

			switchTrigger = workspace.Rooms.OfficePark.OfficePark.Office3:WaitForChild("CameraSwitchTrigger"),

			cam = {
				name = "Office_3 Cam",
				anchor = workspace.Rooms.OfficePark.OfficePark.Office3:WaitForChild("CameraAnchor1"),
				cameraSubject = workspace.Rooms.OfficePark.OfficePark.Office3.CameraAnchor1.CameraSubject,
			},

			priority = 1,

			trap = nil,

			trapCool = nil,

			setDetect = true,
		},

		["Office4"]= {
			Name = "Office4",

			modeTrigger = 'Security',

			switchTrigger = workspace.Rooms.OfficePark.OfficePark.Office4:WaitForChild("CameraSwitchTrigger"),

			cam = {
				name = "Office_4 Cam",
				anchor = workspace.Rooms.OfficePark.OfficePark.Office4:WaitForChild("CameraAnchor1"),
				cameraSubject = workspace.Rooms.OfficePark.OfficePark.Office4.CameraAnchor1.CameraSubject,
			},

			priority = 1,

			trap = nil,

			trapCool = nil,

			setDetect = true,
		},

		["Office5"]= {
			Name = "Office5",

			modeTrigger = 'Security',

			switchTrigger = workspace.Rooms.OfficePark.OfficePark.Office5:WaitForChild("CameraSwitchTrigger"),

			cam = {
				name = "Office_5 Cam",
				anchor = workspace.Rooms.OfficePark.OfficePark.Office5:WaitForChild("CameraAnchor1"),
				cameraSubject = workspace.Rooms.OfficePark.OfficePark.Office5.CameraAnchor1.CameraSubject,
			},

			priority = 1,

			trap = nil,

			trapCool = nil,

			setDetect = true,
		},

		["Office6"]= {
			Name = "Office6",

			modeTrigger = 'Security',

			switchTrigger = workspace.Rooms.OfficePark.OfficePark.Office6:WaitForChild("CameraSwitchTrigger"),

			cam = {
				name = "Office_6 Cam",
				anchor = workspace.Rooms.OfficePark.OfficePark.Office6:WaitForChild("CameraAnchor1"),
				cameraSubject = workspace.Rooms.OfficePark.OfficePark.Office6.CameraAnchor1.CameraSubject,
			},

			priority = 1,

			trap = nil,

			trapCool = nil,

			setDetect = true,
		},

		["Office7"]= {
			Name = "Office7",

			modeTrigger = 'Security',

			switchTrigger = workspace.Rooms.OfficePark.OfficePark.Office7:WaitForChild("CameraSwitchTrigger"),

			cam = {
				name = "Office_7 Cam",
				anchor = workspace.Rooms.OfficePark.OfficePark.Office7:WaitForChild("CameraAnchor1"),
				cameraSubject = workspace.Rooms.OfficePark.OfficePark.Office7.CameraAnchor1.CameraSubject,
			},

			priority = 1,

			trap = nil,

			trapCool = nil,

			setDetect = true,
		},

		["Office8"]= {
			Name = "Office8",

			modeTrigger = 'Security',

			switchTrigger = workspace.Rooms.OfficePark.OfficePark.Office8:WaitForChild("CameraSwitchTrigger"),

			cam = {
				name = "Office_8 Cam",
				anchor = workspace.Rooms.OfficePark.OfficePark.Office8:WaitForChild("CameraAnchor1"),
				cameraSubject = workspace.Rooms.OfficePark.OfficePark.Office8.CameraAnchor1.CameraSubject,
			},

			priority = 1,

			trap = nil,

			trapCool = nil,

			setDetect = true,
		},
	},

	["Storage"] = {
		["Storage1"]= {
			Name = "Storage1",

			modeTrigger = 'Security',

			switchTrigger = workspace.Rooms.Storage.Storage.Cam1:WaitForChild("CameraSwitchTrigger"),

			cam = {
				name = "Storage_1 Cam",
				anchor = workspace.Rooms.Storage.Storage.Cam1:WaitForChild("CameraAnchor1"),
				cameraSubject = workspace.Rooms.Storage.Storage.Cam1.CameraAnchor1.CameraSubject,
			},

			priority = 1,

			trap = nil,

			trapCool = nil,

			setDetect = true,
		},
		["Storage2"]= {
			Name = "Storage2",

			modeTrigger = 'Security',

			switchTrigger = workspace.Rooms.Storage.Storage.Cam2:WaitForChild("CameraSwitchTrigger"),

			cam = {
				name = "Storage_2 Cam",
				anchor = workspace.Rooms.Storage.Storage.Cam2:WaitForChild("CameraAnchor1"),
				cameraSubject = workspace.Rooms.Storage.Storage.Cam2.CameraAnchor1.CameraSubject,
			},

			priority = 1,

			trap = "oDO",

			trapCool = nil,

			setDetect = true,
		},

		["PinPad"] = {
			Name = "PinPad",

			modeTrigger = "pinpad",

			switchTrigger = workspace.Rooms.Storage.Storage.Door.Keypad.prompt,

			cam = {
				name = nil,
				anchor = nil,
				cameraSubject = nil,

			},

			priority = 2,

			trap = nil,

			trapCool = nil,

			setDetect = true,
		},
	},
	["Conference"] = {
		["CardReader"]
	}
}

local endRooms = {
	[1] = {
		Name = "DarkHall",

		Model = workspace.Rooms.DarkHall.DarkHall,

		Atmosphere = 0.9,

		Nodes = {
			Node = {
				Node = workspace.Rooms.DarkHall.DarkHall.Nodes:WaitForChild("Node"),
				Used = false,
			},

			Node1 = {
				Node1 = workspace.Rooms.DarkHall.DarkHall.Nodes:WaitForChild("Node1"),
				Used = false,
			},
			Node2 = {
				Node2 = workspace.Rooms.DarkHall.DarkHall.Nodes:WaitForChild("Node2"),
				Used = false,
			},
			Node3 = {
				Node1 = workspace.Rooms.DarkHall.DarkHall.Nodes:WaitForChild("Node3"),
				Used = false,
			},
		},

		Data ={

			modeTrigger = "Security",

			switchTrigger = workspace.Rooms.DarkHall.DarkHall.CameraSwitchTrigger,

			cam = {
				name = nil,
				anchor = nil,
				cameraSubject = nil,
			},

			priority = nil,

			trap = nil,

			trapCool = nil,

			setDetect = nil,
		},
	},

	[2] = {
		Name = "DarkLounge",

		Model = workspace.Rooms.DarkLounge.DarkLounge,

		Nodes = {
			Node = {
				Node = workspace.Rooms.DarkLounge.DarkLounge.Nodes:WaitForChild("Node"),
				Used = false,
			},
			Node1 = {
				Node = workspace.Rooms.DarkLounge.DarkLounge.Nodes:WaitForChild("Node1"),
				Doors = workspace.Rooms.DarkLounge.DarkLounge.Nodes.Node1.Doors,
				Used = false,
			},
		},
		Data ={

			modeTrigger = "Security",

			switchTrigger = workspace.Rooms.DarkHall.DarkHall.CameraSwitchTrigger,

			cam = {
				name = nil,
				anchor = nil,
				cameraSubject = nil,
			},

			priority = nil,

			trap = nil,

			trapCool = nil,

			setDetect = nil,
		}
	}
}

local fileRooms = {
	[1] = {
		Name = "Storage",

		Model = workspace.Rooms.Storage.Storage,

		Atmosphere = 0.6,

		Nodes = {
			Node = {
				Node = workspace.Rooms.Storage.Storage.Nodes:WaitForChild("Node"),
				Used = false,
			},
		},

		filePositions = {
			model1 = workspace.Rooms.Storage.Storage:WaitForChild("FileSpawn"),

		},

		Data ={

			modeTrigger = nil,

			switchTrigger = nil,

			cam = {
				name = nil,
				anchor = nil,
				cameraSubject = nil,
			},

			priority = nil,

			trap = nil,

			trapCool = nil,

			setDetect = nil,
		},
	},
	[2] = {
		Name = "Records",

		Model = workspace.Rooms.Records.Records,

		Atmosphere = 0.9,

		Nodes = {
			Node = {
				Node = workspace.Rooms.Records.Records.Nodes:WaitForChild("Node"),
				Used = false,
			},
		},

		filePositions = {
			model1 = workspace.Rooms.Records.Records.Assets.fileCabinets.fileSpawnCabinet:WaitForChild("FileSpawn"),
		},

		Data ={

			modeTrigger = "Security",

			switchTrigger = workspace.Rooms.Records.Records.CameraSwitchTrigger,

			cam = {
				name = "Human_Resources",
				anchor = workspace.Rooms.Records.Records.CameraAnchor1,
				cameraSubject = workspace.Rooms.Records.Records.CameraAnchor1.CameraSubject,
			},

			priority = 1,

			trap = nil,

			trapCool = nil,

			setDetect = nil,
		},
	},
	[3] = {
		Name = "Conference",

		Model = game.Workspace.Rooms.Conference.Conference,

		Atmosphere = 0.6,

		Nodes = {
			Node = {
				Node = game.Workspace.Rooms.Conference.Conference.Nodes.Node,
				Used = false,
			},
		},

		filePositions = {
			model1 = game.Workspace.Rooms.Conference.Conference:WaitForChild("FileSpawn"),

		},

		Data ={

			modeTrigger = "Security",

			switchTrigger = game.Workspace.Rooms.Conference.Conference.CameraSwitchTrigger,

			cam = {
				name = "Conference_Room",
				anchor = game.Workspace.Rooms.Conference.Conference.CameraAnchor1,
				cameraSubject = game.Workspace.Rooms.Conference.Conference.CameraAnchor1.CameraSubject,
			},

			priority = 1,

			trap = nil,

			trapCool = nil,

			setDetect = nil,
		},
	},
	[4] = {
		Name = "ServerRoom",

		Model = game.Workspace.Rooms.ServerRoom.ServerRoom,

		Atmosphere = 0.9,

		Nodes = {
			Node = {
				Node = game.Workspace.Rooms.ServerRoom.ServerRoom.Nodes.Node,
				Used = false,
			},
		},

		filePositions = {
			model1 = game.Workspace.Rooms.ServerRoom.ServerRoom:WaitForChild("FileSpawn"),
		},

		Data ={

			modeTrigger = "Security",

			switchTrigger = game.Workspace.Rooms.ServerRoom.ServerRoom.CameraSwitchTrigger,

			cam = {
				name = "Server_Room",
				anchor = game.Workspace.Rooms.ServerRoom.ServerRoom.CameraAnchor1,
				cameraSubject = game.Workspace.Rooms.ServerRoom.ServerRoom.CameraAnchor1.CameraSubject,
			},

			priority = 1,

			trap = nil,

			trapCool = nil,

			setDetect = nil,
		},
	},
}

function RoomsRegistry.requestRooms()
	return Nodes
end

function RoomsRegistry.requestFileRooms()
	return fileRooms
end

function RoomsRegistry.requestEndRooms()
	return endRooms
end

function RoomsRegistry.receiveActiveRooms(activeRooms)
	for name, i in pairs(activeRooms) do
		print(name)
		if auxillaryRooms[name] then
			for _, j in pairs(auxillaryRooms[name]) do
				detectionRegistry.detectables[j.Name] = j
			end
		else
			detectionRegistry.detectables[name] = i
		end
	end
	print(detectionRegistry.detectables)
end

return RoomsRegistry
