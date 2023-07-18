/obj/machinery/cryopod/stasis
	name = "stasis sarcophagus"
	desc = "A heavy chamber used to hold personnel in short- or long-term stasis sleep. These are ubiquitious, and necessary to reduce the ravages of time dilation."
	icon = 'icons/obj/cryogenics_coffin.dmi'
	icon_state = "pod"
	base_icon_state = "pod"
	occupied_icon_state = "pod"
	on_store_message = "has entered stasis."
	on_store_name = "Stasis Oversight"
	on_enter_occupant_message = "You feel a hiss of air as the sarcophagus seals. Dim amber lights flick on as it begins delayed activation."

/obj/machinery/cryopod/stasis/Process()
	. = ..()
	update_icon()

/obj/machinery/cryopod/stasis/set_occupant(mob/living/carbon/occupant, silent)
	. = ..()
	update_icon()

/obj/machinery/cryopod/stasis/on_update_icon()
	cut_overlays()
	if (occupant) // Copy-pasted from sleepers, for now
		if (ishuman(occupant))
			var/mob/living/carbon/human/H = occupant
			var/mutable_appearance/pickle = new /mutable_appearance(occupant)
			var/list/icon_scale_values = H.get_icon_scale_mult()
			var/desired_scale_x = icon_scale_values[1]
			var/desired_scale_y = icon_scale_values[2]

			var/matrix/M = matrix()
			M.Scale(desired_scale_x, desired_scale_y)
			M.Translate(0, (1.5 * world.icon_size) * (desired_scale_y - 1))
			pickle.transform = M

			pickle.layer = FLOAT_LAYER
			pickle.pixel_z = 12
			add_overlay(pickle)
		add_overlay(image(icon, "lid1"))
	else
		add_overlay(image(icon, "lid0"))
