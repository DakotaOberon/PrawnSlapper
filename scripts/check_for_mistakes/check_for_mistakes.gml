/**
* Checks for letter presses that aren't assigned to a prawn
*
* @function		check_for_mistakes()
*/
function check_for_mistakes() {
	// Loop over each letter to check for mistakes
	// Letters not in this array are attached to a prawn
	for (var l = 0; l < array_length(letters); l++) {
		// Check if key was pressed
		if (keyboard_check_pressed(ord(letters[l]))) {
			if (points > 0) {
				// Reduce points
				points -= points_lost_on_fail;
			}

			// Indicate point loss to user through visual and audio cues
			audio_play_sound(sFail, 0, false);
			draw_red = true;
			alarm[0] = 10;
		}
	}
}
