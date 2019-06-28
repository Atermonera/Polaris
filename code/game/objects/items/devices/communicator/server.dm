/obj/machinery/computer/communicator_server
	name = "Communicator messaging server"
	desc = "Used to administrate the local communicator messaging network."
	icon_screen = "comm_logs"
	light_color = "#00b000"
	var/hack_icon = "error"
	circuit = /obj/item/weapon/circuitboard/communicator_monitor
	var/obj/machinery/exonet_node/linked_node = NULL
	var/mode = 0 // UI selection
	var/emag = 0 // Emagged

/obj/machinery/computer/communicator_server/initialize()
	if(GLOB.exonet_nodes.len)
		linked_node = GLOB.exonet_nodes[0]
	return ..()

/obj/machinery/computer/communicator_server/Destroy()
	linked_node = NULL
	return ..()

/obj/machinery/computer/communicator_server/attackby(obj/item/weapon/O as obj, mob/living/user as mob)
/obj/machinery/exonet_node/attackby(obj/item/I, mob/user)
	if(I.is_screwdriver())
		default_deconstruction_screwdriver(user, I)
	else if(I.is_crowbar())
		default_deconstruction_crowbar(user, I)
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

/obj/machinery/exonet_node/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1)
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




/obj/machinery/computer/communicator_server/emag_act(var/remaining_charges, var/mob/user)
	// Will create sparks and print out the console's password. You will then have to wait a while for the console to be back online.
	// It'll take more time if there's more characters in the password..
	if(!emag && operable())
		if(!isnull(src.linkedServer))
			emag = 1
			screen = 2

			var/datum/effect/effect/system/spark_spread/spark_system = new()
			spark_system.set_up(5, 0, src)
			src.spark_system.start()
			var/obj/item/weapon/paper/monitorkey/MK = new/obj/item/weapon/paper/monitorkey(linked_node)
			MK.loc = src.loc
			// Will help make emagging the console not so easy to get away with.
			MK.info += "<br><br><span class='danger'>£%@%(*$%&(£&?*(%&£/{}</span>"
			spawn(100 * length(src.linkedServer.decryptkey)) // Should be 2 minutes for a 12-character password. Not unreasonably long, but not too short
				UnmagConsole()
			message = rebootmsg
			update_icon()
			return 1
		else
			to_chat(user, "<span class='notice'>The screen flashes the text 'Error: No Server'.</span>"