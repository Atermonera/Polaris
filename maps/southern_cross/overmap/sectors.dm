// Overmap object for Sif, hanging in the void of space
/obj/effect/overmap/visitable/planet/Sif
	name = "Sif"
	map_z = list(Z_LEVEL_SURFACE, Z_LEVEL_SURFACE_MINE, Z_LEVEL_SURFACE_WILD)
	in_space = 0
	start_x  = 10
	start_y  = 10
	skybox_offset_x = 128
	skybox_offset_y = 128

/obj/effect/overmap/visitable/planet/Sif/Initialize()
	atmosphere = new(CELL_VOLUME)
	atmosphere.adjust_gas("oxygen", MOLES_O2STANDARD, 0)
	atmosphere.adjust_gas("nitrogen", MOLES_N2STANDARD)

	. = ..()

/obj/effect/overmap/visitable/planet/Sif/get_skybox_representation()
	. = ..()
	(.).pixel_x = skybox_offset_x
	(.).pixel_y = skybox_offset_y

/obj/effect/overmap/visitable/Southern_Cross
	name = "Southern Cross"
	icon_state = "object"
	base = 1
	in_space = 1
	start_x =  10
	start_y =  10
	map_z = list(Z_LEVEL_STATION_ONE, Z_LEVEL_STATION_TWO, Z_LEVEL_STATION_THREE)