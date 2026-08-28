--[[local EnvPositions = {}

EnvPositions.posTable = {
	["breakTable1"] = {
		part = game.Workspace.Rooms.Lounge.Assets.table1,
		
		["Horror"] = {
			Position = CFrame.new(-65.426, 4.25, -82.369) * CFrame.Angles(0, math.rad(135), 0)
		},
		["Corporate"] = {
			Position = CFrame.new(-44.776, 3.9, -90.719) * CFrame.Angles(0, 0, 0)
		},
	},
	
	["breakTable2"] = {
		part = game.Workspace.Rooms.Lounge.Assets.table2,
		
		["Horror"] = {
			Position = CFrame.new(-68.008, 4.25, -96.313) * CFrame.Angles(0, math.rad(90), 0)
		},
		["Corporate"] = {
			Position = CFrame.new(-59.426, 3.9, -90.719) * CFrame.Angles(0, 0, 0)
		},
	},
	["entrancePoster"] = {
		part = game.Workspace.Rooms.Entrance.Sign1,
		
		["Horror"] = {
			Position = CFrame.new(-88.732, 2, -2.938) * CFrame.Angles(0, math.rad(10), math.rad(-90))
		},
		["Corporate"] = {
			Position = CFrame.new(-94.45, 6.7, 0.05) * CFrame.Angles(0, math.rad(-90), 0)
		}
	},
	["CorkBoard"] = {
		part = game.Workspace.Rooms.Hallway.CorkBoard,
		
		["Horror"] = {
			Position = CFrame.new(-41.6, 6.243, -21.774) * CFrame.Angles(math.rad(-17.5), 0, 0)
		},
		["Corporate"] = {
			Position = CFrame.new(-41.6, 7.257, -22.196) * CFrame.Angles(math.rad(-10), 0, 0)
		}
	},
	["Committee"] = {
		part = game.Workspace.Rooms.Hallway.CorkBoard.clipboard.Committee,

		["Horror"] = {
			Position = CFrame.new(-55.632, 2.158, -30.822) * CFrame.Angles(math.rad(2.089), math.rad(-55.026), math.rad(-90.369))
		},
		["Corporate"] = {
			Position = CFrame.new(-42.49, 8.713, -23.849) * CFrame.Angles(math.rad(-10), 0, 0)
		}
	},
	["Appreciate"] = {
		part = game.Workspace.Rooms.Hallway.CorkBoard.clipboard.Appreciate,
		
		["Horror"] = {
			Position = CFrame.new(-42.44, 4.923, -18.475) * CFrame.Angles(math.rad(10), 0, 0)
		},
		["Corporate"] = {
			Position = CFrame.new(-42.44, 6.449, -18.206) * CFrame.Angles(math.rad(10), 0, 0)
		}
	},
	["Page1"] = {
		part = game.Workspace.Rooms.Hallway.CorkBoard.clipboard.Page1,

		["Horror"] = {
			Position = CFrame.new(-50.929, 2.041, -10.757) * CFrame.Angles(0, math.rad(39.75), math.rad(90))
		},
		["Corporate"] = {
			Position = CFrame.new(-42.44, 8.341, -14.826) * CFrame.Angles(0, 0, 0)
		}
	},
	["EOTM"] = {
		part = game.Workspace.Rooms.Hallway.CorkBoard.clipboard.EOTM,

		["Horror"] = {
			Position = CFrame.new(-42.486, 4.842, -21.276) * CFrame.Angles(math.rad(-19.987), math.rad(-0.728), math.rad(2.128))
		},
		["Corporate"] = {
			Position = CFrame.new(-42.79, 6.382, -21.276) * CFrame.Angles(0, 0, 0)
		}
	},
	
}

EnvPositions.doorsTable = {
	["HideDoor1"] = {
		part = game.Workspace.Rooms.OfficePark.Assets.Cubicles.hidingDoors.Cubicle1.HideDoor1,
		
		["Horror"] = {
			Transparency = 1,
			CanCollide = false
		},
		["Corporate"] = {
			Transparency = 0,
			CanCollide = true
		}
	},
	["HideDoor1Open"] = {
		part = game.Workspace.Rooms.OfficePark.Assets.Cubicles.hidingDoors.Cubicle1.HideDoor1Open,
		
		["Horror"] = {
			Transparency = 0,
			CanCollide = true
		},
		["Corporate"] = {
			Transparency = 1,
			CanCollide = false
		}
	},
	["HideDoor2"] = {
		part = game.Workspace.Rooms.OfficePark.Assets.Cubicles.hidingDoors.Cubicle2.HideDoor2,
		
		["Horror"] = {
			Transparency = 1,
			CanCollide = false
		},
		["Corporate"] = {
			Transparency = 0,
			CanCollide = true
		}
	},
	["HideDoor2Open"] = {
		part = game.Workspace.Rooms.OfficePark.Assets.Cubicles.hidingDoors.Cubicle2.HideDoor2Open,
		
		["Horror"] = {
			Transparency = 0,
			CanCollide = true
		},
		["Corporate"] = {
			Transparency = 1,
			CanCollide = false
		}
	},
	["HideDoor3"] = {
		part = game.Workspace.Rooms.OfficePark.Assets.Cubicles.hidingDoors.Cubicle3.HideDoor3,
		
		["Horror"] = {
			Transparency = 1,
			CanCollide = false
		},
		["Corporate"] = {
			Transparency = 0,
			CanCollide = true
		}
	},
	["HideDoor3Open"] = {
		part = game.Workspace.Rooms.OfficePark.Assets.Cubicles.hidingDoors.Cubicle3.HideDoor3Open,
		
		["Horror"] = {
			Transparency = 0,
			CanCollide = true
		},
		["Corporate"] = {
			Transparency = 1,
			CanCollide = false
		}
	},
	["secretDoor"] = {
		part = game.Workspace.Rooms.OfficePark.Assets.Cubicles.hidingDoors.secretCubicle.secretDoor,
		
		["Horror"] = {
			Transparency = 1,
			CanCollide = false
		},
		["Corporate"] = {
			Transparency = 0,
			CanCollide = true
		}
	},
	["secretDoorOpen"] = {
		part = game.Workspace.Rooms.OfficePark.Assets.Cubicles.hidingDoors.secretCubicle.secretDoorOpen,
		
		["Horror"] = {
			Transparency = 0,
			CanCollide = true
		},
		["Corporate"] = {
			Transparency = 1,
			CanCollide = false
		}
	}
}

EnvPositions.lightsTable = {
	["Light1"] = {
		part = game.Workspace.Rooms.OfficePark.Assets.Cubicles.hidingDoors.Cubicle1.Computer["HST Monitor"].Other.Screen.SurfaceLight,
		
		["Horror"] = {
			Enabled = true,
		},
		["Corporate"] = {
			Enabled = false,
		}
	},
	["Light2"] = {
		part = game.Workspace.Rooms.OfficePark.Assets.Cubicles.hidingDoors.Cubicle2.Computer["HST Monitor"].Other.Screen.SurfaceLight,

		["Horror"] = {
			Enabled = true,
		},
		["Corporate"] = {
			Enabled = false,
		}
	},
	["Light3"] = {
		part = game.Workspace.Rooms.OfficePark.Assets.Cubicles.hidingDoors.Cubicle3.Computer["HST Monitor"].Other.Screen.SurfaceLight,

		["Horror"] = {
			Enabled = true,
		},
		["Corporate"] = {
			Enabled = false,
		}
	},
	["Light4"] = {
		part = game.Workspace.Rooms.OfficePark.Assets.Cubicles.hidingDoors.secretCubicle.Computer["HST Monitor"].Other.Screen.SurfaceLight,

		["Horror"] = {
			Enabled = true,
		},
		["Corporate"] = {
			Enabled = false,
		}
	},
	["Light5"] = {
		part = game.Workspace.Rooms.OfficePark.Assets.Office.Computer["HST Monitor"].Other.Screen.SurfaceLight,

		["Horror"] = {
			Enabled = false,
		},
		["Corporate"] = {
			Enabled = true,
		}
	},
	["Light6"] = {
		part = game.Workspace.Rooms.Hallway.Light.PointLight,
		bulb = game.Workspace.Rooms.Hallway.Light,

		["Horror"] = {
			Enabled = false,
			color = Color3.fromRGB(85, 85, 127),
			material = Enum.Material.Plastic
		},
		["Corporate"] = {
			Enabled = true,
			color = Color3.fromRGB(255, 255, 127),
			material = Enum.Material.Neon
		}
	},
	["Light7"] = {
		part = game.Workspace.Rooms.Lounge.Light.PointLight,
		bulb = game.Workspace.Rooms.Lounge.Light,

		["Horror"] = {
			Enabled = false,
			color = Color3.fromRGB(85, 85, 127),
			material = Enum.Material.Plastic
		},
		["Corporate"] = {
			Enabled = true,
			color = Color3.fromRGB(255, 255, 127),
			material = Enum.Material.Neon
		}
	},
	["Light8"] = {
		part = game.Workspace.Rooms.OfficePark.Light1.PointLight,
		bulb = game.Workspace.Rooms.OfficePark.Light1,


		["Horror"] = {
			Enabled = false,
			color = Color3.fromRGB(85, 85, 127),
			material = Enum.Material.Plastic
		},
		["Corporate"] = {
			Enabled = true,
			color = Color3.fromRGB(255, 255, 127),
			material = Enum.Material.Neon
		}
	},
	["Light9"] = {
		part = game.Workspace.Rooms.OfficePark.Light2.PointLight,
		bulb = game.Workspace.Rooms.OfficePark.Light2,

		["Horror"] = {
			Enabled = false,
			color = Color3.fromRGB(85, 85, 127),
			material = Enum.Material.Plastic
		},
		["Corporate"] = {
			Enabled = true,
			color = Color3.fromRGB(255, 255, 127),
			material = Enum.Material.Neon
		}
	},
}


return EnvPositions
]]--