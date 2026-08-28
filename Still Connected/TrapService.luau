local trapService = {}

local dStart = require(game.Workspace.Rooms.Lounge.Lounge.Drone1.DroneService)


local function loungeDoorOpen(plr)
	local img = "rbxassetid://88661947820723"
	local trapScreen = game.ReplicatedStorage.Events.Traps.Door.DoorScreen
	trapScreen:FireClient(plr, img)

	local door = workspace.Rooms.Lounge.Lounge.Assets:WaitForChild("Door")
	local closed = door.Closed:GetChildren()
	local open = door.Open:GetChildren()
	local light = door.Keypad.Light

	for _, i in pairs(closed) do
		i.Transparency = 1
		i.CanCollide = false
	end

	for _, i in pairs(open) do
		i.Transparency = 0
		i.CanCollide = true
	end
	light.Color = Color3.fromRGB(0, 255, 0)
	light.SpotLight.Color = Color3.fromRGB(0, 255, 0)
end

local function officeDoor(plr)
	if not plr:GetAttribute("OfficetrapCool") then
		local door1 = workspace.Rooms.OfficePark.OfficePark.Assets.Office.OfficeDoor1
		local door2 = workspace.Rooms.OfficePark.OfficePark.Assets.Office.OfficeDoor2				
		local sound = game.ReplicatedStorage.Events.Traps.Door["Door Shut/Close [High Quality]"]:Clone()
		sound.Parent = door1

		door2.Transparency = 1
		door2.CanCollide = false
		door1.Transparency = 0
		door1.CanCollide = true
		plr:SetAttribute("OfficetrapCool", true)
	end
end

local function officeDoorOpen(plr)
	if not plr:GetAttribute("OfficetrapOpenCool") then
		local door1 = workspace.Rooms.OfficePark.OfficePark.Assets.Office.OfficeDoor1
		local door2 = workspace.Rooms.OfficePark.OfficePark.Assets.Office.OfficeDoor2				

		door2.Transparency = 0
		door2.CanCollide = true
		door1.Transparency = 1
		door1.CanCollide = false
		plr:SetAttribute("OfficetrapOpenCool", true)
	end
end


function trapService.actuateTrap(plr, trap)
	print("Trap Fired: ".. trap)
		
	if trap == "oD" then
		officeDoor(plr)
		
	elseif trap == "oDO" then
		officeDoorOpen(plr)
		
	elseif trap == "lDo" then
		loungeDoorOpen(plr)
	end
	
end

return trapService