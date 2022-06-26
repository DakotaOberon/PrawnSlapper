// Fall at a rate based on scale
y += (2 * image_yscale);

// Rotate by rotation speed
image_angle += rotation_speed;

// Destroy prawn once it is out of view
if (y > room_height + sprite_height) {
	instance_destroy();
}
