/**
* Check for letter press of prawn
*
* @function		check_prawn(prawn)
* @param		{Prawn}		prawn		Prawn struct to check
* @return
*/
function check_prawn(p) {
	if (p.state == PrawnState.cooldown) {
		if (p.cooldown > 0) {
			// Reduce cooldown timer by 1
			p.cooldown -= 1;
			return;
		}

		// Assign a new letter
		p.next(letters);
		return;
	}

	if (p.letter == noone) {
		return;
	}

	// If prawn has a letter check for button press
	if (keyboard_check_released(ord(p.letter))) {
		// Add points on successful slap
		points += points_gained_on_success;

		// Play slap sound
		var slap = audio_play_sound(sSuccess, 0, false);
		// Adjust pitch for slight variation
		audio_sound_pitch(slap, random_range(0.8, 1.2));

		// Grab a new letter
		p.next(letters);

		// Make sure rooms timer has started after first successful slap
		if (state != GameState.timer_running) {
			state = GameState.timer_running;
		}
	}

	return;
}
