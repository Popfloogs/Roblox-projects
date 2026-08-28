local UIS = game:GetService("UserInputService")
local CAS = game:GetService("ContextActionService")

local DeviceController = {}

function DeviceController.getDevice()
	if UIS.TouchEnabled and not UIS.KeyboardEnabled then
		return "Mobile"
	elseif UIS.GamepadEnabled then
		return "Gamepad"
	else
		return "Desktop"
	end
end

return DeviceController
