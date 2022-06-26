/// @description Spawn falling shrimp

if (instance_number(oFallingPrawn) < active_shrimp) {
	instance_create_layer(random(room_width), -64, "Instances", oFallingPrawn);
}

alarm[0] = irandom_range(1, 60);
