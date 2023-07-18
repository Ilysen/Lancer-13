/obj/item/modular_computer/pda
	name = "slate"
	desc = "A pocket-sized device, optionally comp/con-enabled, used for everyday tasks. Alternatively called a PDA."

/obj/item/storage/box/PDAs
	name = "box of spare slates"
	desc = "A box of spare slates."

/decl/uplink_source/pda
	name = "slate"

/decl/uplink_source/pda/Initialize()
	. = ..()
	desc = "Installs an uplink into a slate if, and only if, found on your person. Has no TC cost."

/decl/species/human
	description = "At your core, you're human - one of trillions. Since the Fall so many generations past, humanity has grown and thrived, widely expanding throughout the Orion Arm. Though individuals may bear varying degrees of resemblance to the folks of Old Humanity thanks to aesthetic biomods or augmentation, they can always trace a line back to their roots.<br/><br/>\
	Without augmentations or significant bioengineering, the average human lives anywhere between 120 and 220 years, depending on a variety of factors. With the most advanced medicine and bionics available in the modern day, humans can live to a maximum subjective age of around 300 years.<br/><br/>\
	Humans are the only known intelligent species in existence."
	age_descriptor = /datum/appearance_descriptor/age/cetacean_human

/datum/appearance_descriptor/age/cetacean_human
	standalone_value_descriptors = list(
		"an infant" =      1,
		"a toddler" =      3,
		"a child" =        7,
		"a teenager" =    13,
		"a young adult" = 18,
		"an adult" =      25,
		"middle-aged" =   100,
		"aging" =         150,
		"elderly" =       180
	)
