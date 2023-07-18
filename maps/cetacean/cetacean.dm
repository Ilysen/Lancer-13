#if !defined(USING_MAP_DATUM)

	#include "../../mods/content/lancer/_lancer.dme"
	#include "../../mods/content/mundane.dm"
	#include "../../mods/content/mouse_highlights/_mouse_highlight.dme"
	#include "../../mods/content/psionics/_psionics.dme"
	#include "../../mods/content/scaling_descriptors.dm"

	#include "cetacean_areas.dm"
	#include "cetacean_departments.dm"
	#include "cetacean_factions.dm"
	#include "cetacean_jobs.dm"
	#include "cetacean_spawnpoints.dm"

	#include "jobs/noncrew.dm"

	#include "cetacean.dmm"

	#define USING_MAP_DATUM /datum/map/cetacean

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Cetacean

#endif
