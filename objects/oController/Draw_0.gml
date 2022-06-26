var b = c_black;
switch (state) {
	case GameState.timer_running:
	case GameState.started:
		// Draw prawns
		for (var i = 0; i < array_length(prawns); i++) {
			if (prawns[i].letter != noone) {
				var seq = prawns[i].sequence

				// Draw Prawn letters
				var x1 = layer_sequence_get_x(seq);
				var y1 = layer_sequence_get_y(seq);
				draw_sprite(sLetterBack, 0, x1, y1);
				draw_text_color(x1 - 2, y1 + 1, prawns[i].letter, b, b, b, b, 1);
				draw_text_color(x1 + 2, y1 - 1, prawns[i].letter, b, b, b, b, 1);
				draw_text(x1, y1, prawns[i].letter);
			}
		}
	break;
	case GameState.score_screen:
	case GameState.can_action:
		// Draw Score Screen text
		var sx = layer_sequence_get_x(score_sequence);
		var sy = layer_sequence_get_y(score_sequence) + 82;
		var tx1 = sx - 96;
		var tx2 = sx + 96;

		var escStr = "Escape -> To Menu";
		draw_text_color(tx1 - 2, sy + 1, escStr, b, b, b, b, 1);
		draw_text(tx1, sy, escStr);

		var retStr = "Space -> Retry";
		draw_text_color(tx2 - 2, sy + 1, retStr, b, b, b, b, 1);
		draw_text(tx2, sy, retStr);
	break;
}
