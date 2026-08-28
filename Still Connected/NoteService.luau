local NoteService = {}

local NoteRegistry = require(game.ServerScriptService.Registries.NoteRegistry)
local pService = require(game.ServerScriptService.PinService)
local phraseRetrieve = game.ReplicatedStorage.Events.Actions.PhraseRetrieve
local PIN = pService.GeneratePin()

local NoteTable = {
	[1] = {
		name = "note1",
		note = workspace.Rooms.Entrance.note1,
		phrase = "",
	},
	[2] = {
		name = "note2",
		note = workspace.Rooms.Hallway.note2,
		phrase = "",
	},
	[3] = {
		name = "note3",
		note = workspace.Rooms.Hallway.note3,
		phrase = "",
	},
	[4] = {
		name = "note4",
		note = workspace.Rooms.Lounge.Lounge.note4,
		phrase = "",
	},
	[5] = {
		name = "note5",
		note = workspace.Rooms.Lounge.Lounge.note5,
		phrase = "",
	},
	[6] = {
		name = "note6",
		note = workspace.Rooms.OfficePark.OfficePark.Office4.note6,
		phrase = "",
	},
	[7] = {
		name = "note7",
		note = workspace.Rooms.OfficePark.OfficePark.Office7.note7,
		phrase = "",
	},
	[8] = {
		name = "note8",
		note = workspace.Rooms.OfficePark.OfficePark.Office6.note8,
		phrase = "",
	},
	[9] = {
		name = "note9",
		note = workspace.Rooms.OfficePark.OfficePark.Office3.note9,
		phrase = "",
	},
	[10] = {
		name = "note10",
		note = workspace.Rooms.OfficePark.OfficePark.Office1.note10,
		phrase = "",
	},
}

local phrases ={
	[1] = "rbxassetid://112732191081195",
	[2] = "rbxassetid://99942818644494",
	[3] = "rbxassetid://88915268903488",
	[4] = "rbxassetid://96020224430772",
}

local activeNotes = {}
local usedNotes = {}

local activePhrases = {}

function NoteService.Init()
	table.clear(activeNotes)
	table.clear(usedNotes)
	table.clear(activePhrases)
	print("Chosen Notes:\n")

	while #activeNotes < 5 do
		local choice = math.random(1, 10)

		if not usedNotes[choice] then
			usedNotes[choice] = true
			table.insert(activeNotes, NoteTable[choice])
			NoteTable[choice].note.Transparency = 0
			NoteTable[choice].note.prompt.Transparency = 0.98
			NoteTable[choice].note.prompt.Color = Color3.fromRGB(255, 255, 255)
			NoteTable[choice].note.prompt.Material = Enum.Material.Neon
			for _, i in pairs(NoteTable[choice].note.prompt:GetChildren()) do
				i.Enabled = true
			end
			NoteTable[choice].note.SurfaceGui.Enabled = true
		end
	end

	local pinIndex = math.random(1, #activeNotes)
	local noteCode
	
	for i, noteData in ipairs(activeNotes) do
		repeat
			noteCode = "N" .. tostring(math.random(1000, 9999))
		until not activePhrases[noteCode]
		
		if i == pinIndex then
			noteData[tostring(noteCode)] = "Storage access code: " .. PIN
			local bool = noteData["note"].phraseBool
			bool.Value = true
			print(tostring(noteData.name) .. ": " .. tostring(noteData[noteCode]))
			noteData.note:SetAttribute("noteCode", noteCode)
		else
			noteData[tostring(noteCode)] = phrases[math.random(1, #phrases)]
			print(tostring(noteData.name) .. ": " .. tostring(noteData[noteCode]))
			noteData.note:SetAttribute("noteCode", noteCode)
		end
	end
	
	NoteRegistry.setNotes(activeNotes)
	return "NoteService Init Success"
end

phraseRetrieve.OnServerInvoke = function(plr, noteCode)
	for code, i in activeNotes do
		if i[noteCode] then
			return i[noteCode]
		end
	end	
end

return NoteService