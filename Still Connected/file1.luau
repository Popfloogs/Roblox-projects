local file1 = {}

local fileCollector = script.Parent.Parent.Events.Actions.FileCollector
local iService = require(game.ReplicatedStorage.startupServices.InteractionController)

local File1 = game.Workspace.Rooms.Lounge.File1

function file1.start()
	iService.setTarget(file1)
end

local function complete()
	iService.clearTarget(file1)
end

function file1:Interact(plr)
	
	for _, obj in ipairs(File1:GetDescendants()) do
		if obj:IsA("BasePart") or obj:IsA("Decal") then
			obj.Transparency = 1
		end
	end
	fileCollector:FireServer("file1")
	File1.Case.PointLight.Enabled = false
	complete()
end
return file1
