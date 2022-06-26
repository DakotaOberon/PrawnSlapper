if (keyboard_check_pressed(exit_prawn.button)) {
	// Quit game
	exit_prawn.func();
}

if (keyboard_check_pressed(start_prawn.button)) {
	// Start game
	start_prawn.func();
}
