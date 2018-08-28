// Species for the opaque appearance
// Due to sprite construction, they have to have separate limb lists

/datum/species/shapeshifter/promethean/avatar/human
	name = "Virtual Reality Human"
	icobase = 'icons/mob/human_races/r_human.dmi'
	deform = 'icons/mob/human_races/r_def_human.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_SKIN_TONE | HAS_LIPS | HAS_UNDERWEAR | HAS_EYE_COLOR
	has_limbs = list(
			BP_TORSO =  list("path" = /obj/item/organ/external/chest),
			BP_GROIN =  list("path" = /obj/item/organ/external/groin),
			BP_HEAD =   list("path" = /obj/item/organ/external/head),
			BP_L_ARM =  list("path" = /obj/item/organ/external/arm),
			BP_R_ARM =  list("path" = /obj/item/organ/external/arm/right),
			BP_L_LEG =  list("path" = /obj/item/organ/external/leg),
			BP_R_LEG =  list("path" = /obj/item/organ/external/leg/right),
			BP_L_HAND = list("path" = /obj/item/organ/external/hand),
			BP_R_HAND = list("path" = /obj/item/organ/external/hand/right),
			BP_L_FOOT = list("path" = /obj/item/organ/external/foot),
			BP_R_FOOT = list("path" = /obj/item/organ/external/foot/right)
		)
	has_organ = list(								// which required-organ checks are conducted.
			O_HEART =		/obj/item/organ/internal/heart,
			O_LUNGS =		/obj/item/organ/internal/lungs,
			O_VOICE = 		/obj/item/organ/internal/voicebox,
			O_LIVER =		/obj/item/organ/internal/liver,
			O_KIDNEYS =		/obj/item/organ/internal/kidneys,
			O_BRAIN =		/obj/item/organ/internal/brain,
			O_APPENDIX = 	/obj/item/organ/internal/appendix,
			O_EYES =		/obj/item/organ/internal/eyes
		)

/datum/species/shapeshifter/promethean/avatar/unathi
	name = "Virtual Reality Unathi"
	icobase = 'icons/mob/human_races/r_lizard.dmi'
	deform = 'icons/mob/human_races/r_def_lizard.dmi'
	tail = "sogtail"
	tail_animation = 'icons/mob/species/unathi/tail.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR
	has_limbs = list(
			BP_TORSO =  list("path" = /obj/item/organ/external/chest/unathi),
			BP_GROIN =  list("path" = /obj/item/organ/external/groin/unathi),
			BP_HEAD =   list("path" = /obj/item/organ/external/head/unathi),
			BP_L_ARM =  list("path" = /obj/item/organ/external/arm),
			BP_R_ARM =  list("path" = /obj/item/organ/external/arm/right),
			BP_L_LEG =  list("path" = /obj/item/organ/external/leg),
			BP_R_LEG =  list("path" = /obj/item/organ/external/leg/right),
			BP_L_HAND = list("path" = /obj/item/organ/external/hand),
			BP_R_HAND = list("path" = /obj/item/organ/external/hand/right),
			BP_L_FOOT = list("path" = /obj/item/organ/external/foot),
			BP_R_FOOT = list("path" = /obj/item/organ/external/foot/right)
		)
	has_organ = list(
			O_HEART =    /obj/item/organ/internal/heart/unathi,
			O_LUNGS =    /obj/item/organ/internal/lungs/unathi,
			O_LIVER =    /obj/item/organ/internal/liver/unathi,
			O_BRAIN =    /obj/item/organ/internal/brain/unathi,
			O_EYES =     /obj/item/organ/internal/eyes,
		)


/datum/species/shapeshifter/promethean/avatar/tajaran
	name = "Virtual Reality Tajaran"
	icobase = 'icons/mob/human_races/r_tajaran.dmi'
	deform = 'icons/mob/human_races/r_def_tajaran.dmi'
	tail = "tajtail"
	tail_animation = 'icons/mob/species/tajaran/tail.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR
	has_limbs = list(
			BP_TORSO =  list("path" = /obj/item/organ/external/chest),
			BP_GROIN =  list("path" = /obj/item/organ/external/groin),
			BP_HEAD =   list("path" = /obj/item/organ/external/head),
			BP_L_ARM =  list("path" = /obj/item/organ/external/arm),
			BP_R_ARM =  list("path" = /obj/item/organ/external/arm/right),
			BP_L_LEG =  list("path" = /obj/item/organ/external/leg),
			BP_R_LEG =  list("path" = /obj/item/organ/external/leg/right),
			BP_L_HAND = list("path" = /obj/item/organ/external/hand),
			BP_R_HAND = list("path" = /obj/item/organ/external/hand/right),
			BP_L_FOOT = list("path" = /obj/item/organ/external/foot),
			BP_R_FOOT = list("path" = /obj/item/organ/external/foot/right)
		)
	has_organ = list(    //No appendix.
			O_HEART =    /obj/item/organ/internal/heart,
			O_LUNGS =    /obj/item/organ/internal/lungs,
			O_VOICE = 		/obj/item/organ/internal/voicebox,
			O_LIVER =    /obj/item/organ/internal/liver,
			O_KIDNEYS =  /obj/item/organ/internal/kidneys,
			O_BRAIN =    /obj/item/organ/internal/brain,
			O_EYES =     /obj/item/organ/internal/eyes
		)

/datum/species/shapeshifter/promethean/avatar/skrell
	name = "Virtual Reality Skrell"
	icobase = 'icons/mob/human_races/r_skrell.dmi'
	deform = 'icons/mob/human_races/r_def_skrell.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR
	has_limbs = list(
			BP_TORSO =  list("path" = /obj/item/organ/external/chest),
			BP_GROIN =  list("path" = /obj/item/organ/external/groin),
			BP_HEAD =   list("path" = /obj/item/organ/external/head/skrell),
			BP_L_ARM =  list("path" = /obj/item/organ/external/arm),
			BP_R_ARM =  list("path" = /obj/item/organ/external/arm/right),
			BP_L_LEG =  list("path" = /obj/item/organ/external/leg),
			BP_R_LEG =  list("path" = /obj/item/organ/external/leg/right),
			BP_L_HAND = list("path" = /obj/item/organ/external/hand),
			BP_R_HAND = list("path" = /obj/item/organ/external/hand/right),
			BP_L_FOOT = list("path" = /obj/item/organ/external/foot),
			BP_R_FOOT = list("path" = /obj/item/organ/external/foot/right)
		)
	has_organ = list(								// which required-organ checks are conducted.
			O_HEART =		/obj/item/organ/internal/heart,
			O_LUNGS =		/obj/item/organ/internal/lungs,
			O_VOICE = 		/obj/item/organ/internal/voicebox,
			O_LIVER =		/obj/item/organ/internal/liver,
			O_KIDNEYS =		/obj/item/organ/internal/kidneys,
			O_BRAIN =		/obj/item/organ/internal/brain,
			O_APPENDIX = 	/obj/item/organ/internal/appendix,
			O_EYES =		/obj/item/organ/internal/eyes
		)

/datum/species/shapeshifter/promethean/avatar/teshari
	name = "Virtual Reality Teshari"
	icobase = 'icons/mob/human_races/r_seromi.dmi'
	deform = 'icons/mob/human_races/r_seromi.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_SKIN_COLOR | HAS_EYE_COLOR
	has_limbs = list(
			BP_TORSO =  list("path" = /obj/item/organ/external/chest),
			BP_GROIN =  list("path" = /obj/item/organ/external/groin),
			BP_HEAD =   list("path" = /obj/item/organ/external/head/seromi),
			BP_L_ARM =  list("path" = /obj/item/organ/external/arm),
			BP_R_ARM =  list("path" = /obj/item/organ/external/arm/right),
			BP_L_LEG =  list("path" = /obj/item/organ/external/leg),
			BP_R_LEG =  list("path" = /obj/item/organ/external/leg/right),
			BP_L_HAND = list("path" = /obj/item/organ/external/hand/seromi),
			BP_R_HAND = list("path" = /obj/item/organ/external/hand/right/seromi),
			BP_L_FOOT = list("path" = /obj/item/organ/external/foot/seromi),
			BP_R_FOOT = list("path" = /obj/item/organ/external/foot/right/seromi)
		)
	has_organ = list(
			O_HEART =    /obj/item/organ/internal/heart,
			O_LUNGS =    /obj/item/organ/internal/lungs,
			O_VOICE = 	/obj/item/organ/internal/voicebox,
			O_LIVER =    /obj/item/organ/internal/liver,
			O_KIDNEYS =  /obj/item/organ/internal/kidneys,
			O_BRAIN =    /obj/item/organ/internal/brain,
			O_EYES =     /obj/item/organ/internal/eyes
		)


/datum/species/shapeshifter/promethean/avatar/diona
	name = "Virtual Reality Diona"
	icobase = 'icons/mob/human_races/r_diona.dmi'
	deform = 'icons/mob/human_races/r_def_plant.dmi'
	appearance_flags = 0
	has_limbs = list(
			BP_TORSO =  list("path" = /obj/item/organ/external/diona/chest),
			BP_GROIN =  list("path" = /obj/item/organ/external/diona/groin),
			BP_HEAD =   list("path" = /obj/item/organ/external/head/no_eyes/diona),
			BP_L_ARM =  list("path" = /obj/item/organ/external/diona/arm),
			BP_R_ARM =  list("path" = /obj/item/organ/external/diona/arm/right),
			BP_L_LEG =  list("path" = /obj/item/organ/external/diona/leg),
			BP_R_LEG =  list("path" = /obj/item/organ/external/diona/leg/right),
			BP_L_HAND = list("path" = /obj/item/organ/external/diona/hand),
			BP_R_HAND = list("path" = /obj/item/organ/external/diona/hand/right),
			BP_L_FOOT = list("path" = /obj/item/organ/external/diona/foot),
			BP_R_FOOT = list("path" = /obj/item/organ/external/diona/foot/right)
		)
	has_organ = list(
			O_NUTRIENT = /obj/item/organ/internal/diona/nutrients,
			O_STRATA =   /obj/item/organ/internal/diona/strata,
			O_RESPONSE = /obj/item/organ/internal/diona/node,
			O_GBLADDER = /obj/item/organ/internal/diona/bladder,
			O_POLYP =    /obj/item/organ/internal/diona/polyp,
			O_ANCHOR =   /obj/item/organ/internal/diona/ligament
		)

