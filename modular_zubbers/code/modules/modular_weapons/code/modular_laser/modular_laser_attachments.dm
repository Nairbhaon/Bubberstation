obj/item/modular_laser_attachment
	name = "modular laser attachment"
	desc = "shouldn't see this"
	//icon = ''
	w_class = WEIGHT_CLASS_SMALL

	var/slot = GUN_SLOT_UNIQUE

obj/item/modular_laser_attachment/lens
	slot = GUN_SLOT_LENS
	var/projectile_override
	var/new_fire_sound

obj/item/modular_laser_attachment/rail
	slot = GUN_SLOT_RAIL

obj/item/modular_laser_attachment/stock
	slot = GUN_SLOT_STOCK

obj/item/modular_laser_attachment/rail/scope
	name = "laser scope attachment"
	desc = "It's a scope."