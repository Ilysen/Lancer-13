/datum/map/cetacean
	name = "Cetacean"
	full_name = "ACO Cetacean"
	path = "cetacean"
	ground_noun = "deck"

	station_name  = "ACO Cetacean"
	station_short = "Cetacean"

	dock_name     = "FTS Capitalist's Rest"
	boss_name     = "Access Corridor"
	boss_short    = "ACO"
	company_name  = "Access Corridor"
	company_short = "ACO"
	lobby_screens = list('maps/example/example_lobby.png')
	overmap_ids = list(OVERMAP_ID_SPACE)
	emergency_shuttle_leaving_dock = "Attention all hands: the escape pods have been launched, maintaining burn for %ETA%."
	emergency_shuttle_called_message = "Attention all hands: emergency evacuation procedures are now in effect. Escape pods will launch in %ETA%"
	emergency_shuttle_recall_message = "Attention all hands: emergency evacuation sequence aborted. Return to normal operating conditions."
	evac_controller_type = /datum/evacuation_controller/lifepods

	starting_money = 5000
	department_money = 0
	salary_modifier = 0.2

	radiation_detected_message = "High levels of radiation have been detected in proximity of the %STATION_NAME%. Please move to a shielded area such as the cargo bay, dormitories or medbay until the radiation has passed."
	default_telecomms_channels = list(COMMON_FREQUENCY_DATA)
