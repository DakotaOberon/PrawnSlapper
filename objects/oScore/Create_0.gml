draw_score = function(score_string) {
	// Draw score

	// To center score, get starting x
	var score_start_x = x - ((string_length(score_string) - 1) * (sprite_width / 2));

	for (var i = 0; i < string_length(score_string); i++) {
		// Get number value of char in score string
		var num_sub_img = real(string_char_at(score_string, i + 1));

		// Get score draw color
		var score_color = oController.draw_red? c_red : c_white;

		// Draw digit
		draw_sprite_ext(sNumbers, num_sub_img, score_start_x + (i * sprite_width), y, image_xscale, image_yscale, 0, score_color, 1);
	}
}
