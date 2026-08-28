local CamService = {}

local camUpdate = game.ReplicatedStorage.Events.Cams.CamUpdate

function CamService.updateCam(plr, cam, mode) -- received from GMM
	plr:SetAttribute("Cam", cam.name) --verifier
	
	print(cam)
	
	if cam.cameraSubject == nil then 
		camUpdate:FireClient(plr, nil, nil, nil, mode)
	else
		camUpdate:FireClient(plr, cam.cameraSubject.Position, cam.anchor.Position, cam.name, mode) -- unpacked camera data sent to client [may potentially contain nil values]
	end
end

return CamService
