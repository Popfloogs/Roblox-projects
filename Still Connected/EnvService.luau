local EnvironmentControl = {}

--local RoomService = require(script.Parent.RoomService)local EnvPositions = require(script.Parent.EnvPositions).posTable
--local EnvDoors = require(script.Parent.EnvPositions).doorsTable
local detectRegistry = require(script.Parent.Registries.DetectionRegistry)
local RoomsRegistry = require(script.Parent.Registries.RoomsRegistry)
local oPT = require(workspace.Rooms.OfficePark.OfficePark.OfficeParkTransform)

local currEnv = {}

local completed = {}


-------------------------------------------------------------------------
---------------------------------Re-write--------------------------------
-------------------------------------------------------------------------
local function nextExitNode(room)
	local newNode

	local exitNodes = {}

	local ExitNode1
	local ExitNode2
	local ExitNode3

	if room.Nodes.Node1 then

		if room.Nodes.Node3 then

			exitNodes[1] = room.Nodes.Node1
			exitNodes[2] = room.Nodes.Node2
			exitNodes[3] = room.Nodes.Node3
			
			if room.Name == "OfficePark" then
				table.remove(exitNodes, 1)
				local selector = math.random(1, 2)
				newNode = exitNodes[selector]
			else

				local selector = math.random(1, 3)


				newNode = exitNodes[selector]
				print(newNode)
			end

		elseif room.Nodes.Node2 then

			exitNodes[1] = room.Nodes.Node1
			exitNodes[2] = room.Nodes.Node2

			local selector = math.random(1, 2)

			newNode = exitNodes[selector]
			print(newNode)
		end
	end
	return newNode
end

local function fillNodes(fileRooms, nodes)

	local unusedNodes = {}
	print(nodes)

	for _, room in ipairs(fileRooms) do
		for k, j in pairs(nodes) do
			if j.Used == true then continue end

			local exitNodeData = j.Node
			if not exitNodeData then break end


			local physicalRoom = room.Model
			local Node = room.Nodes.Node.Node

			local pivot = physicalRoom:GetPivot()
			local offset = pivot:ToObjectSpace(Node.CFrame)

			physicalRoom:PivotTo(exitNodeData.CFrame * offset:Inverse())

			currEnv[room.Name] = room.Data
			j.Used = true
			table.remove(nodes, k)
			break
		end
	end
end

local function populateEndRooms(endRooms)
	local endNode
	
	for j, i in pairs(endRooms) do
		print(i.Name)
		local node = i.Nodes.Node.Node
		local model = i.Model
		local pivot = i.Model:GetPivot()
		if node.CFrame == nil then return end
		local offset = pivot:ToObjectSpace(node.CFrame)
		
		if j == 1 then
			endNode = workspace.Rooms.OfficePark.OfficePark.Nodes.Node1

			model:PivotTo(endNode.CFrame * offset:Inverse())
			currEnv[i.Name] = i.Data
		elseif j == 2 then
			endNode = workspace.Rooms.DarkHall.DarkHall.Nodes.Node3
			model:PivotTo(endNode.CFrame * offset:Inverse())
			currEnv[i.Name] = i.Data
		end
	end
end

local function fillDoors(nodes, usedNodes)
	if nodes == nil then return end
	for _, node in ipairs(nodes) do

		if node.Node == nil then continue end
		--print("CHECK NODE:", node.Node:GetFullName())
		--print("DOOR PARTS:", #node.Doors:GetDescendants())
		if node.Doors == nil then continue end
		for _, door in ipairs(node.Doors:GetDescendants()) do
			if door:IsA("BasePart") then
				door.Transparency = 0
				door.CanCollide = true
				--print("AFTER:", door.Name, door.Transparency, door.CanCollide)
			end
		end
	end
end

local function snapToRooms(passThroughRoomNodes, endRooms)
	
---------------------------------------------------------------------
----------------------------snapToRoomsLoop--------------------------
---------------------------------------------------------------------
	local unusedNodes = {}
	local exitNode = workspace.Rooms.Hallway.Nodes
	
	for _, i in pairs(passThroughRoomNodes) do
		local room = i
		local model = room.Model
		local pivot = model:GetPivot()
		local pivotNode = room.Nodes.Node
		print(room.Name)
		
		local offset = pivot:ToObjectSpace(pivotNode.Node.CFrame)
		model:PivotTo(exitNode.Node.CFrame * offset:Inverse())
		
		currEnv[room.Name] = room.Data
		
		if exitNode ~= workspace.Rooms.Hallway.Nodes then exitNode.Used = true end
		pivotNode.Used = true
		
		exitNode = nextExitNode(room)
	end
	
	local unusedNodes = {}
	
	for _, i in pairs(passThroughRoomNodes) do
		for name, j in pairs(i.Nodes) do
			if j.Used == false and j.Node ~= game.Workspace.Rooms.OfficePark.OfficePark.Nodes.Node1 then
				table.insert(unusedNodes, j)
			end
		end
	end
	return unusedNodes
end
-------------------------------------------------------------------------
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
-------------------------------------------------------------------------
local function shuffle(list)
	for i = #list, 2, -1 do
		local j = math.random(1, i)
		list[i], list[j] = list[j], list[i]
	end
end

-------------------------------------------------------------------------
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
-------------------------------------------------------------------------

function EnvironmentControl.Init(fileLocation)
		------------------------------------
		-----------shuffleLists-------------
	local function shuffle(list)
		for i = #list, 2, -1 do
			local j = math.random(1, i)
			list[i], list[j] = list[j], list[i]
		end
	end
	
---------------------------------------------------------------
-----------------------------Init()----------------------------
---------------------------------------------------------------
	
	local passThroughRoomNodes = RoomsRegistry.requestRooms()
	local fileRooms = RoomsRegistry.requestFileRooms()
	local endRooms = RoomsRegistry.requestEndRooms()
	
	print(fileRooms)
	
	shuffle(passThroughRoomNodes)
	shuffle(fileRooms)
	
	
	
	local unusedNodes = snapToRooms(passThroughRoomNodes, endRooms)
	
	
	local usedNodes = fillNodes(fileRooms, unusedNodes)
	
	populateEndRooms(endRooms)
	
	for i = 1, #unusedNodes do
		i += 1
	end
	
	
	fillDoors(unusedNodes, usedNodes)
	
	print(currEnv)
	RoomsRegistry.receiveActiveRooms(currEnv)
	
	return "Initialization complete: Environment Service"
end

return EnvironmentControl
