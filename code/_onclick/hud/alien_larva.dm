/datum/hud/proc/larva_hud()

	src.adding = list()
	src.other = list()

	var/obj/screen/using

	using = new /obj/screen()
	using.name = "mov_intent"
	using.set_dir(SOUTHWEST)
	using.icon = 'icons/mob/screen1_alien.dmi'
	using.icon_state = (mymob.m_intent == "run" ? "running" : "walking")
	using.screen_loc = ui_acti
	using.layer = HUD_LAYER
	src.adding += using
	move_intent = using

	mymob.healths = new /obj/screen()
	mymob.healths.icon = 'icons/mob/screen1_alien.dmi'
	mymob.healths.icon_state = "health0"
	mymob.healths.name = "health"
	mymob.healths.screen_loc = ui_alien_health

	mymob.client.screen = list()
	mymob.client.screen += list( mymob.healths) //, mymob.rest, mymob.sleep, mymob.mach )
	mymob.client.screen += src.adding + src.other
	mymob.client.screen += mymob.client.void