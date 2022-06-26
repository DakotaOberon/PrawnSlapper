switch (state) {
	case GameState.timer_running:
		// Increment time
		time_passed += delta_time;

		// Get current seconds passed
		seconds_passed = time_passed % second;

		if (time_passed >= time_to_end) {
			// Display score screen
			score_sequence = layer_sequence_create("Seq", room_width / 2, room_height / 2, seqScoreScreen);
			state = GameState.score_screen;
			instance_destroy(score_display);
		}
	// No break here allows the GameState.started code to also run whenever state is GameState.timer_running
	case GameState.started:
		check_for_mistakes();

		// Loop over each prawn to check for slaps
		for (var i = 0; i < array_length(prawns); i++) {
			check_prawn(prawns[i]);
		}
	break;
	case GameState.can_action:
		// Allow player to press action controls
		if (keyboard_check_pressed(menu_button)) {
			// Go to room menu
			room_goto_previous();
		} else if (keyboard_check_pressed(retry_button)) {
			// Restart current room
			room_restart();
		}
	case GameState.score_screen:
	break;
}
