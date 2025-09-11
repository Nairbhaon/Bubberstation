/obj/item/gun/energy/laser/modular_laser
	name = "Modular Laser Rifle Base"
	desc = "You shouldn't see this."
	icon = 'icons/obj/weapons/guns/energy.dmi'
	icon_state = "protolaser"
	inhand_icon_state = "protolaserkill4"
	lefthand_file = 'icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/guns_righthand.dmi'
	w_class = WEIGHT_CLASS_NORMAL
	ammo_type = list(/obj/item/ammo_casing/energy/laser/modular_laser)

	///Stored diode
	var/obj/item/stock_parts/micro_laser/diode
	var/diode_type
	///Stored capacitor
	var/obj/item/stock_parts/capacitor/cap
	var/cap_type

	///lens part
	var/obj/item/modular_laser_attachment/lens/lens
	var/lens_type
	///rail part
	var/obj/item/modular_laser_attachment/rail/rail
	var/rail_type
	///stock part
	var/obj/item/modular_laser_attachment/stock/stock
	var/stock_type


/obj/item/gun/energy/laser/modular_laser/Initialize(mapload)
	. = ..()
	if(diode_type)
		diode = new diode_type(src)
	else
		diode = new(src)
	if(cap_type)
		cap = new cap_type(src)
	else
		cap = new(src)
	if(lens_type)
		lens = new lens_type(src)
	else
		lens = new(src)
	if(rail_type)
		rail = new rail_type(src)
	else
		rail = new(src)
	if(stock_type)
		stock = new stock_type(src)
	else
		stock = new(src)
	recharge_newshot(FALSE)

/obj/item/gun/energy/laser/modular_laser/Destroy()
	if(diode)
		QDEL_NULL(diode)
	if(cap)
		QDEL_NULL(cap)
	if(lens)
		QDEL_NULL(lens)
	if(rail)
		QDEL_NULL(rail)
	if(stock)
		QDEL_NULL(stock)
	return ..()

/obj/item/gun/energy/laser/modular_laser/screwdriver_act(mob/living/user, obj/item/tool)
	. = ..()
	var/removed_something = FALSE
	if (diode)
		tool.play_tool_sound(src, 50)
		user.balloon_alert(user, "diode removed")
		diode.forceMove(drop_location())
		diode = null
		removed_something = TRUE
	if (cap)
		tool.play_tool_sound(src, 50)
		user.balloon_alert(user, "diode removed")
		cap.forceMove(drop_location())
		cap = null
		removed_something = TRUE
	return removed_something


/obj/item/gun/energy/laser/modular_laser/attackby(obj/item/attacking_item, mob/user, params)
	if(istype(attacking_item, /obj/item/stock_parts/micro_laser))
		if (diode)
			balloon_alert(user, "already has a diode!")
			return TRUE
		user.transferItemToLoc(attacking_item, src)
		diode = attacking_item
		balloon_alert(user, "inserted the [attacking_item]")
		return TRUE
	if(istype(attacking_item, /obj/item/stock_parts/capacitor))
		if (cap)
			balloon_alert(user, "already has a capacitor!")
			return TRUE
		user.transferItemToLoc(attacking_item, src)
		cap = attacking_item
		balloon_alert(user, "inserted the [attacking_item]")
		return TRUE
	return ..()


/obj/item/gun/energy/laser/modular_laser/recharge_newshot(no_cyborg_drain)
	..(no_cyborg_drain)
	if (chambered.loaded_projectile && diode && cap)
		chambered.loaded_projectile.damage = 25 * cap.get_part_rating()



/obj/item/gun/modular_laser/professional
	name = "Modular Laser Rifle"
	desc = "A design of laser rifle with emphasis placed on modularity and versatility."





/obj/item/gun/modular_laser/makeshift
	name = "Makeshift Modular Laser Rifle"
	desc = "A makeshift version of the Modular Laser Rifle."

