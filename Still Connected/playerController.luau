local RoomService = require(game.ServerScriptService.RoomService)
local TCdetect = require(game.ReplicatedStorage.Interactables.TCC)
local GMM = require(game.ServerScriptService.GMM)
local fileCollector = game.ReplicatedStorage.Events.Actions.FileCollector
local termEnd1 = game.ReplicatedStorage.Events.Terminal.TerminalEnd1
local termEnd2 = game.ReplicatedStorage.Events.Terminal.TerminalEnd2
local termEndFalse = game.ReplicatedStorage.Events.Terminal.TerminalEndFalse
local nService = require(game.ServerScriptService.NoteService)

local gameLoaded = GMM:StartGame()

game.Players.PlayerAdded:Connect(function(plr)
	--[[plr:SetAttribute("Warnings", 0)
	plr:SetAttribute("FilesFound", 0)
	plr:SetAttribute("FPVMode", nil)
	plr:SetAttribute("trapSwitch", "oD")
	plr:SetAttribute("file1", false)
	plr:SetAttribute("file2", false)
	plr:SetAttribute("file3", false)
	plr:SetAttribute("file4", false)]]--

	while true do
		wait(1)
		if not gameLoaded then
			continue
		end
		if plr:GetAttribute("Warnings") == 3 then
			GMM.EndGame(plr)
		elseif plr:GetAttribute("FPVMode") == "Horror" then
			GMM.HorrorMode(plr)
		end
		
		RoomService.detectPlayer(plr) -- calls the room detection as the first function in the chain 	
	end
end)

fileCollector.OnServerEvent:Connect(function(plr, file)
	if file == "file1" then
		print("file1 collected")
		plr:SetAttribute("file1", true)
		plr:SetAttribute("FilesFound", plr:GetAttribute("FilesFound") + 1)
	end
end)

termEnd2.OnServerEvent:Connect(function(plr)
	plr:SetAttribute("FPVMode", "Horror") 
end)

termEnd1.OnServerEvent:Connect(function(plr)
	plr:SetAttribute("FPVMode", "FPV") 
	plr.Character.HumanoidRootPart.CFrame = workspace.Rooms.OfficePark.Office1.CameraSwitchTrigger.CFrame
end)

termEndFalse.OnServerEvent:Connect(function(plr)
	plr:SetAttribute('FPVMode', nil)
	plr.Character.HumanoidRootPart.CFrame = CFrame.new(-48.877, 8.85, -120.772)
end)