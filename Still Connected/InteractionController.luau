local CAS = game:GetService("ContextActionService")
local DeviceController = require(script.Parent.DeviceController)

local InteractionController = {}

local currentTarget = nil

local plr

function InteractionController.getPlayer(Player)
	plr = Player
	InteractionController.start()
end

function InteractionController.setTarget(target)
	currentTarget = target
end

function InteractionController.clearTarget(target)
	if currentTarget == target then
		currentTarget = nil
	end
end

function InteractionController.Interact(actionName, inputState, inputObject)

	if inputState ~= Enum.UserInputState.Begin then
		return
	end

	if currentTarget and currentTarget.Interact then
		currentTarget:Interact(plr)
	end
end

function InteractionController.start()
	local device = DeviceController.getDevice()

	CAS:BindAction(
		"Interact",
		InteractionController.Interact,
		device == "Mobile",
		Enum.KeyCode.E,
		Enum.KeyCode.ButtonX
	)

	if device == "Mobile" then
		CAS:SetTitle("Interact", "Use")
		CAS:SetPosition("Interact", UDim2.new(0.80, 0, 0.50, 0))
	end
	
end

return InteractionController