// Alien larva are quite simple.
/mob/living/carbon/alien/Life()

	set invisibility = 0
	set background = 1

	if (HAS_TRANSFORMATION_MOVEMENT_HANDLER(src))	return
	if(!loc)			return

	..()

	blinded = null

	//Status updates, death etc.
	update_icon()

/mob/living/carbon/alien/handle_mutations_and_radiation()
	..()
	if(radiation)
		var/rads = radiation/25
		radiation -= rads
		adjust_nutrition(rads)
		heal_overall_damage(rads,rads)
		adjustOxyLoss(-(rads))
		adjustToxLoss(-(rads))

/mob/living/carbon/alien/handle_regular_status_updates()

	if(status_flags & GODMODE)	return 0

	if(stat == DEAD)
		blinded = 1
		set_status(STAT_SILENCE, 0)
	else
		updatehealth()
		if(health <= 0)
			death()
			blinded = 1
			set_status(STAT_SILENCE, 0)
			return 1

		if(HAS_STATUS(src, STAT_PARA))
			blinded = 1
			set_stat(UNCONSCIOUS)
			if(getHalLoss() > 0)
				adjustHalLoss(-3)

		if(HAS_STATUS(src, STAT_ASLEEP))
			adjustHalLoss(-3)
			if (mind)
				if(mind.active && client != null)
					ADJ_STATUS(src, STAT_ASLEEP, -1)
			blinded = 1
			set_stat(UNCONSCIOUS)
		else if(resting)
			if(getHalLoss() > 0)
				adjustHalLoss(-3)

		else
			set_stat(CONSCIOUS)
			if(getHalLoss() > 0)
				adjustHalLoss(-1)

		// Eyes and blindness.
		if(!check_has_eyes())
			set_status(STAT_BLIND, 1)
			blinded = 1
			set_status(STAT_BLURRY, 1)
		else if(GET_STATUS(src, STAT_BLIND))
			ADJ_STATUS(src, STAT_BLIND, -1)
			blinded = 1

		update_icon()

	return 1

/mob/living/carbon/alien/handle_regular_hud_updates()
	update_sight()
	if (healths)
		if(stat != DEAD)
			switch(health)
				if(100 to INFINITY)
					healths.icon_state = "health0"
				if(80 to 100)
					healths.icon_state = "health1"
				if(60 to 80)
					healths.icon_state = "health2"
				if(40 to 60)
					healths.icon_state = "health3"
				if(20 to 40)
					healths.icon_state = "health4"
				if(0 to 20)
					healths.icon_state = "health5"
				else
					healths.icon_state = "health6"
		else
			healths.icon_state = "health7"

	if(stat != DEAD)
		if(blinded)
			overlay_fullscreen("blind", /obj/screen/fullscreen/blind)
		else
			clear_fullscreen("blind")
			set_fullscreen(disabilities & NEARSIGHTED, "impaired", /obj/screen/fullscreen/impaired, 1)
			set_fullscreen(GET_STATUS(src, STAT_BLURRY), "blurry", /obj/screen/fullscreen/blurry)
			set_fullscreen(GET_STATUS(src, STAT_DRUGGY), "high", /obj/screen/fullscreen/high)
		if(machine)
			if(machine.check_eye(src) < 0)
				reset_view(null)
	return 1

/mob/living/carbon/alien/handle_environment(var/datum/gas_mixture/environment)
	..()
	// Both alien subtypes survive in vaccum and suffer in high temperatures,
	// so I'll just define this once, for both (see radiation comment above)
	if(environment && environment.temperature > (T0C+66))
		adjustFireLoss((environment.temperature - (T0C+66))/5) // Might be too high, check in testing.
		if (fire) fire.icon_state = "fire2"
		if(prob(20))
			to_chat(src, "<span class='danger'>You feel a searing heat!</span>")
	else
		if (fire) fire.icon_state = "fire0"

/mob/living/carbon/alien/handle_fire()
	if(..())
		return
	bodytemperature += BODYTEMP_HEATING_MAX //If you're on fire, you heat up!
	return
