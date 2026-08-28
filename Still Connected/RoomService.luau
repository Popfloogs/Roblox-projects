local RoomService = {}

local detectRegistry = require(game.ServerScriptService.Registries.DetectionRegistry)
local GMM = require(game.ServerScriptService.GMM)

while GMM.loaded == false do
	task.wait()
end

local roomTable = detectRegistry.detectables
--[[RoomService.currRoom = roomTable['Entrance']           --Deprecated
RoomService.prevRoom = roomTable['Entrance']]--



--[[local function setRoom(currRoom)                       --Deprecated
	RoomService.prevRoom = RoomService.currRoom
	if currRoom == nil then 
		RoomService.currRoom = RoomService.prevRoom 
	else RoomService.currRoom = currRoom 
		
	end
end]]--

RoomService.currRoom = {}
RoomService.contestedRoom = {}

local S2FP = game.Workspace.Rooms.OfficePark.OfficePark.Assets.Office.SwitchtoFP
local S2Term = game.Workspace.Rooms.OfficePark.OfficePark.Assets.Office.SwitchtoTerm

local function SendRoom(plr)
	local room = RoomService.currRoom[plr.UserId]
	if not room then return end

	--plr:SetAttribute("room", room.name)
	--plr:SetAttribute("Atmosphere", room.Atmosphere)
	print(room)
	GMM.receive(plr, room)
end


function RoomService.detectPlayer(plr)
	local char = plr.Character or plr.CharacterAdded:Wait()
	local HRP = char:WaitForChild("HumanoidRootPart")

	local candidates = {}
	
	table.clear(candidates)

	for _, room in pairs(roomTable) do
		local parts = workspace:GetPartsInPart(room.switchTrigger)

		for _, part in pairs(parts) do
			if part == HRP then
				table.insert(candidates, room)
				break
			end
		end
	end

	if #candidates == 0 then return end

	table.sort(candidates, function(a, b)
		return (a.priority or 0) > (b.priority or 0)
	end)

	local winningRoom = candidates[1]
	
	if winningRoom.setDetect ~= true then return end

	if winningRoom ~= RoomService.currRoom[plr.UserId] then
		RoomService.currRoom[plr.UserId] = winningRoom
		SendRoom(plr)
	end
end

--[[function RoomService.getRoom()                          --Deprecated
	return RoomService.currRoom
end]]--



return RoomService