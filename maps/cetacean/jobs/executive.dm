/datum/job/captain
	title = "Captain"
	head_position = TRUE
	department_types = list(/decl/department/executive)
	total_positions = 1
	spawn_positions = 1
	supervisors = "Access Corridor and company regulations"
	selection_color = "#1d1d4f"
	req_admin_notify = TRUE
	access = list() 			//See get_access()
	minimal_access = list() 	//See get_access()
	minimal_player_age = 14
	economic_power = 20
	ideal_character_age = 90
	outfit_type = /decl/hierarchy/outfit/job/captain
	guestbanned = TRUE
	must_fill = TRUE
	not_random_selectable = TRUE
	min_skill = list(
		SKILL_LITERACY    = SKILL_ADEPT,
		SKILL_PILOT       = SKILL_ADEPT
	)
	max_skill = list(
		SKILL_PILOT       = SKILL_MAX
	)
	skill_points = 30
	software_on_spawn = list(
		/datum/computer_file/program/comm,
		/datum/computer_file/program/card_mod,
		/datum/computer_file/program/camera_monitor,
		/datum/computer_file/program/reports
	)

/datum/job/captain/get_access()
	return get_all_station_access()
