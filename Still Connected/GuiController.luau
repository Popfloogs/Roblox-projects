--[[local UIS = game:GetService("UserInputService")
local plr = game.Players.LocalPlayer

local doorScreen = game.ReplicatedStorage.Events.Traps.Door.DoorScreen

local screenEffectsGui = plr.PlayerGui:WaitForChild("ScreenEffects")
local actionGUI = plr.PlayerGui:WaitForChild("Action")
local camLabelName = actionGUI["Terminal/Cams"].CamName
local camLabelClock = actionGUI["Terminal/Cams"].CamClock
local overlay = plr.PlayerGui:WaitForChild("Overlay")
local pinPad = game.ReplicatedStorage.Events.Actions.PinPad



doorScreen.OnClientEvent:Connect(function(img)
	local screenEffect = screenEffectsGui.ScreenEffects.ScreenEffect
	screenEffect.Image = img
	
	screenEffectsGui.Enabled = true
	screenEffect.Parent.BackgroundTransparency = 0.5
	
	local i = 0
	while i ~= 5 do
		screenEffect.ImageTransparency = screenEffect.ImageTransparency + 0.4
		wait(0.05)
		screenEffect.Parent.BackgroundTransparency = 0.65
		screenEffect.ImageTransparency = screenEffect.ImageTransparency - 0.3
		i = i + 1
	end
	
	i = 0
	screenEffect.Parent.BackgroundTransparency = 0.55
	wait(0.05)
	screenEffect.Parent.BackgroundTransparency = 0.5
	
	while i ~= 5 do
		screenEffect.ImageTransparency = screenEffect.ImageTransparency + 0.3
		wait(0.05)
		screenEffect.Parent.BackgroundTransparency = 0.65
		screenEffect.ImageTransparency = screenEffect.ImageTransparency - 0.6
		i = i + 1
	end

	screenEffect.Parent.BackgroundTransparency = 0.2
	screenEffectsGui.Enabled = false
	
end)

pinPad.OnClientEvent:Connect(function(pBool)
	local char = plr.Character
	local hum = char:WaitForChild("Humanoid")
	print(plr.Name)

	if pBool then
		print("correct")
		plr.PlayerGui.pinpad.Frame.TextLabel.Text = "Correct"
		plr.PlayerGui.pinpad.Frame.TextLabel.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
		wait(0.3)
		plr.PlayerGui.pinpad.Enabled = false
		print(plr.PlayerGui.pinpad.Enabled)
		hum.WalkSpeed = 16
	else
		print("incorrect")
		plr.PlayerGui.pinpad.Frame.TextLabel.Text = "Incorrect"
		wait(0.3)
		plr.PlayerGui.pinpad.Frame.TextLabel.Text = ""
	end
end)

while true do
	wait(1)
	
	
	currenttime = DateTime.now()
	
	
	if plr:GetAttribute("Cam") ~= nil then camLabelName.Text = plr:GetAttribute("Cam") end
	camLabelClock.Text = currenttime:FormatLocalTime("LTS", "en-us")
	overlay:WaitForChild("Warnings").Text = "Warnings: " .. plr:GetAttribute("Warnings") .. "/3\nFiles Found: " .. plr:GetAttribute("FilesFound") .. "/4"
end
]]--