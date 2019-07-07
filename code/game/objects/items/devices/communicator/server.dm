/obj/machinery/computer/communicator_server
	name = "Communicator messaging server"
	desc = "Used to administrate the local communicator messaging network."
	icon_screen = "comm_logs"
	light_color = "#00b000"
	var/hack_icon = "error"
	circuit = /obj/item/weapon/circuitboard/communicator_monitor
	var/obj/machinery/exonet_node/linked_node = null
	var/datum/exonet_protocol/exonet = null
	var/mode = 0 					// UI selection
	var/emag = 0 					// Emagged
	var/edit_logs = 0				// If the logged in user is actively auditing the logs or just viewing them
	var/list/sort_conditions = list(// Conditions to sort the list by,
			"sender" = -1,
			"receiver" = -1,
			"type" = -1,
			"start_time" = -1,
			"end_time" = -1,
			"contents" = -1
		)
	var/username					// Username for current login attempt
	var/password					// Passkey for current login attempt

/obj/machinery/computer/communicator_server/Initialize()
	linked_node = get_exonet_node()
	exonet = new(src)
	exonet.make_arbitrary_address("1000:0000:0000:0001") // Default gateway address, so sayeth ater
	return ..()

/obj/machinery/computer/communicator_server/Destroy()
	linked_node = null
	return ..()

/obj/machinery/computer/communicator_server/attackby(obj/item/O as obj, mob/living/user as mob)
	if(O.is_screwdriver())
		default_deconstruction_screwdriver(user, O)
	else if(O.is_crowbar())
		default_deconstruction_crowbar(user, O)
	else
		..()
	if(!istype(user))
		return
	if(O.is_screwdriver() && emag)
		//Stops people from just unscrewing the monitor and putting it back to get the console working again.
		to_chat(user, "<span class='warning'>It is too hot to mess with!</span>")
		return

	..()
	return

/obj/machinery/computer/message_monitor/update_icon()
	if(emag)
		icon_screen = hack_icon
	else
		icon_screen = initial(icon_screen)
	..()

/obj/machinery/computer/communicator_server/attack_hand(var/mob/user)
	ui_interact(user)

/obj/machinery/computer/communicator_server/attack_ai(var/mob/user)
	ui_interact(user)

/obj/machinery/computer/communicator_server/attack_robot(var/mob/user)
	ui_interact(user)

/obj/machinery/computer/communicator_server/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1)
	if(stat & (NOPOWER|BROKEN))
		..()
		return

	var/data[0] // this is the data which will be sent to the ui

	data["on"] =					linked_node.toggle ? 1 : 0
	data["allowPDAs"] =				linked_node.allow_external_PDAs
	data["allowCommunicators"] =	linked_node.allow_external_communicators
	data["allowNewscasters"] =		linked_node.allow_external_newscasters
	data["logs"] =					linked_node.logs
	data["mode"] =					mode
	data["sort_conditions"] = 		sort_conditions
	data["edit_logs"] = 			edit_logs
	data["username"] = 				username
	data["password"] = 				password

	// Adds sender and receiver names
	for(var/list/L in data["logs"])
		L["sender"] = exonet.get_atom_from_address(L["from_address"])
		L["receiver"] = exonet.get_atom_from_address(L["to_address"])

	// update the ui if it exists, returns null if no ui is passed/found
	ui = SSnanoui.try_update_ui(user, src, ui_key, ui, data, force_open)
	if(!ui)
		// the ui does not exist, so we'll create a new() one
        // for a list of parameters and their descriptions see the code docs in \code\modules\nano\nanoui.dm
		ui = new(user, src, ui_key, "exonet_server.tmpl", "Exonet Node #157", 400, 400)
		// when the ui is first opened this is the data it will use
		ui.set_initial_data(data)
		// open the new ui window
		ui.open()
		// auto update every Master Controller tick
		ui.set_auto_update(1)

//obj/machinery/computer/communicator_server/Topic(href, href_list)
//	if(href_list[""])

/obj/machinery/computer/communicator_server/emag_act(var/remaining_charges, var/mob/user)
	// Will create sparks and print out the console's password. You will then have to wait a while for the console to be back online.
	// It'll take more time if there's more characters in the password..
	if(!emag && operable())
		if(!isnull(src.linked_node))
			emag = 1
		//	screen = 2

			var/datum/effect/effect/system/spark_spread/spark_system = new()
			spark_system.set_up(5, 0, src)
			spark_system.start()
			// Will help make emagging the console not so easy to get away with.
			spawn(100 * length(linked_node.decryptkey)) // Should be 2 minutes for a 12-character password. Not unreasonably long, but not too short
				var/obj/item/weapon/paper/monitorkey/MK = new/obj/item/weapon/paper/monitorkey(linked_node)
				MK.loc = src.loc
				MK.info += "<br><br><span class='danger'>£%@%(*$%&(£&?*(%&£/{}</span>"
		//	message = rebootmsg
			update_icon()
			return 1
		else
			to_chat(user, "<span class='notice'>The screen flashes the text 'Error: No Server'.</span>")