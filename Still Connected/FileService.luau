local fileService = {}
local detectRegistry = require(game.ServerScriptService.Registries.DetectionRegistry)
local RoomsRegistry = require(game.ServerScriptService.Registries.RoomsRegistry)
local InteractablesRegistry = require(game.ServerScriptService.Registries.InteractablesRegistry)

fileService.activeFiles = {}

local function selectRoom(rooms)
	
	if #rooms == 0 then return end
	local randomPosition = rooms[math.random(1, #rooms)]
	print(tostring(randomPosition.Name) .. " : Selected Room for file")
	
	return randomPosition
end

local function populate(fileData, file)
	print(fileData.Name)
	local randomPosition = file["filePositions"]["model1"]
	for _, i in pairs(randomPosition:GetChildren()) do
		if i.Name == "Prompt" then continue end

		i.Transparency = 0
	end
	print(randomPosition)
	fileData["model"] = randomPosition
	fileData["switchTrigger"] = randomPosition["Prompt"]
	fileData["cam"] = file["Data"]["cam"]
	fileData["priority"] = file["Data"]["priority"]
	fileData["trap"] = file["Data"]["trap"]
	fileData["trapCool"] = file["Data"]["trapCool"]
	fileData["setDetect"] = file["Data"]["setDetect"]
	
	return fileData
end

function fileService.Init()
	local file1Positions = {}
	local file2Positions = {}
	
	local rooms = RoomsRegistry.requestFileRooms()
	local files = InteractablesRegistry.requestFiles()
	
	if #rooms == 0 then return end
	
	table.insert(file1Positions, rooms[1])
	table.insert(file1Positions, rooms[2])
	table.insert(file2Positions, rooms[3])
	table.insert(file2Positions, rooms[4])
	
	local file1 = selectRoom(file1Positions)
	local populatedFile = populate(files["file1"],file1)
	table.insert(fileService.activeFiles, populatedFile)
	
	local file2 = selectRoom(file2Positions)
	populatedFile = populate(files["file2"],file2)
	table.insert(fileService.activeFiles, populatedFile)
	
	InteractablesRegistry.receiveActiveFiles(fileService.activeFiles)
	
	return "FileService Init Success"
end

return fileService
