if (event_data[? "event_type"] == "sequence event") {
	// Sequence event variables
	var sequence = event_data[? "element_id"];
	var broadcast_message = event_data[? "message"]

	if (sequence == score_sequence) {
		// Run actions for score sequence
		switch (broadcast_message) {
			case ("CanAction"):
				// Allow player to action
				state = GameState.can_action;

				// Submit score
				submit_score(points);
			break;
		}
	} else {
		// Loop over each prawn on screen
		for (var i = 0; i < array_length(prawns); i++) {
			if (sequence == prawns[i].sequence) {
				// Run actions for prawn sequence
				switch (broadcast_message) {
					case "Done":
						var p = prawns[i];
						// Return used cell to cells array
						p.return_cell(cells);
	
						// Delete prawn
						array_delete(prawns, i, 1);
						delete p;

						// Create new prawn
						create_prawn();
					break;
					case "Slapped":
					case "OffCooldown":
						// Pause sequence
						layer_sequence_pause(sequence);
					break;
				}
			}
		}
	}
}
