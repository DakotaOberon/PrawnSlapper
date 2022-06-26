// Font used in the game
draw_set_font(fntReadable);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Number of falling shrimp on menu
active_shrimp = 20;

// Spawn falling shrimp
alarm[0] = 15;

// Start music if music isn't currently playing
if (!variable_global_exists("music")) {
	global.music = audio_play_sound(sMusic, 100, true);
}

// Quit game button
exit_prawn = {
	text: "Escape",
	button: vk_escape,
	x1: 64,
	y1: room_height - 64,
	func: game_end
}

// Start game button
start_prawn = {
	text: "Space",
	button: vk_space,
	x1: room_width - 64,
	y1: room_height - 64,
	func: room_goto_next
}

// Draw menu control prawns
draw_control_prawn = function(prawn) {
	// Set text border color
	var border = c_black;

	// Draw prawn sprite
	draw_sprite_ext(sPrawn, 1, prawn.x1, prawn.y1, 1, 1, 0, c_white, 1);

	// Draw text
	draw_text_color(prawn.x1 - 2, prawn.y1 + 1, prawn.text, border, border, border, border, 1);
	draw_text(prawn.x1, prawn.y1, prawn.text);
}
