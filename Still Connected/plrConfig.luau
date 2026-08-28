local iService = require(game.ReplicatedStorage.startupServices.InteractionController)
local plr = game.Players.LocalPlayer

local char = plr.Character or plr.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")

hum.UseJumpPower = true
hum.JumpPower = 0

iService.getPlayer(plr)


--[[local dE = game.ReplicatedStorage:WaitForChild("DroneEvent")

dE.OnClientEvent:Connect(function()
	local rE = game.ReplicatedStorage:WaitForChild("runner")
	local UIS = game:GetService("UserInputService")
	
	local plr = game.Players.LocalPlayer
	local w = 3
	while plr:GetAttribute("Scanning") do
		if UIS:IsKeyDown(Enum.KeyCode.W) or UIS:IsKeyDown(Enum.KeyCode.A) or UIS:IsKeyDown(Enum.KeyCode.S) or UIS:IsKeyDown(Enum.KeyCode.D) then
			rE:FireServer()
		end
		task.wait(0.5)
	end
end)]]--