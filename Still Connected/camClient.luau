local plr = game.Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local H = char:WaitForChild("Humanoid")

local camUpdate = game.ReplicatedStorage.Events.Cams.CamUpdate

camUpdate.OnClientEvent:Connect(function(lV, anchor, name, mode)
	
	
	print("Cam received: camClient")
	if mode == "Cam" then
		if anchor == nil then return end
		local cam = workspace.CurrentCamera
		cam.CameraType = Enum.CameraType.Scriptable
		cam.CFrame = CFrame.lookAt(anchor, lV)
		cam.FieldOfView = 70
		
		
	elseif mode == 'FPV' then
		local cam = workspace.CurrentCamera
		cam.CameraType = Enum.CameraType.Custom
		task.wait()
		cam.CameraSubject = H
		cam.FieldOfView = 70

		plr.CameraMode = Enum.CameraMode.LockFirstPerson
		
	elseif mode == 'Term' then
		local cam = workspace.CurrentCamera
		cam.CameraType = Enum.CameraType.Custom
		task.wait()
		cam.CameraSubject = H
		cam.FieldOfView = 70
		
		plr.CameraMode = Enum.CameraMode.Classic
		plr.CameraMaxZoomDistance = 20
		plr.CameraMinZoomDistance = 20
	end
end)