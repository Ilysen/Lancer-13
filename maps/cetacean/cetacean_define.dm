/datum/map/cetacean
	name = "Cetacean"
	full_name = "Cetacean"
	path = "cetacean"
	ground_noun = "deck"

	station_name  = "Cetacean"
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
	default_currency = /decl/currency/manna

	available_cultural_info = list(
		TAG_HOMEWORLD = list(/decl/cultural_info/location/other),
		TAG_FACTION =   list(
			/decl/cultural_info/faction/access_corridor,
			/decl/cultural_info/faction/ktb,
			/decl/cultural_info/faction/harrison_armory,
			/decl/cultural_info/faction/smith_shimano,
			/decl/cultural_info/faction/ipsn,
			/decl/cultural_info/faction/horizon_collective,
			/decl/cultural_info/faction/other,
		),
		TAG_CULTURE =   list(
			/decl/cultural_info/culture/diasporan,
			/decl/cultural_info/culture/cosmopolitan,
			/decl/cultural_info/culture/metropolitan
		),
		TAG_RELIGION =  list(/decl/cultural_info/religion/other)
	)

	default_cultural_info = list(
		TAG_HOMEWORLD = /decl/cultural_info/location/other,
		TAG_FACTION =   /decl/cultural_info/faction/access_corridor,
		TAG_CULTURE =   /decl/cultural_info/culture/diasporan,
		TAG_RELIGION =  /decl/cultural_info/religion/other
	)

	radiation_detected_message = "High levels of radiation have been detected in proximity of \the %STATION_NAME%. Please move to a shielded area such as the cargo bay, dormitories or medbay until the radiation has passed."
	default_telecomms_channels = list(COMMON_FREQUENCY_DATA)

/datum/map/cetacean/get_map_info()
	return "You're aboard the <i>[station_name],</i> a weathered IPS-N tanker owned by Access Corridor - a growing transit/freight firm operating throughout the Diaspora. \
	It's the corpro's third-largest vessel, and its job is to collect, refine, and transport hydrogen fuel to distant stops and stations that nobody else can be bothered with. \
	Like its sister ships, it trends towards long and meandering trips far off the beaten path, often spending months or years in realtime along routes that never really end."

/datum/map/cetacean/setup_map()
	. = ..()
	game_year = 5016 // The canon year in Lancer is 5016u
