// Falls on the menu

// Get random rotate direction
var rotation_direction = choose(-1, 1);

// Get random rotation speed
rotation_speed = random(4) * rotation_direction;

// Set image scales
image_yscale = random_range(1, 2);
image_xscale = image_yscale * choose(-1, 1);

// Set initial image angle
image_angle = irandom(359);
