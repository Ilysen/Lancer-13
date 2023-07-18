/datum/job/cetacean_passenger
	title = "Passenger"
	total_positions = -1
	spawn_positions = -1
	supervisors = "the crew"
	outfit_type = /decl/hierarchy/outfit/job/generic/assistant
	department_types = list(/decl/department/noncrew)
	economic_power = 1
	access = list()
	minimal_access = list()

/datum/job/tradeship_deckhand/get_access()
	if(config.assistant_maint)
		return list(access_maint_tunnels)
	else
		return list()
