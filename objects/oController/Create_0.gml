// Randomize
randomize();

state = GameState.started;

// Create array of letters
letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];

#region Room cells

// Empty cell array of where to spawn prawns
cells = [];

// Room is square, divide into 3 x 3
var divs = 3;

// Section size in pixels
var section = room_width / divs;

for (var i = 0; i < divs; i++) {
	for (var j = 0; j < divs; j++) {
		if (i == 1 and j == 1) {
			// Don't create cell in center
			break;
		}

		// Add new spawn cell
		array_push(
			cells,
			{
				x1: i * section,
				y1: j * section,
				size: section
			}
		);
	}
}

#endregion

#region Prawns

// Current prawns
prawns = [];

// Max prawns
var total_prawns = 5;

function create_prawn() {
	// Create new prawn object
	var _p = new Prawn(
		layer_sequence_create(
			"Seq",
			0,
			0,
			seqPrawnSlap
		)
	)

	// Add prawn to current prawns array
	array_push(
		prawns,
		_p
	);

	// When prawn is placed, pause sequence until slapped
	layer_sequence_pause(_p.sequence);

	// Add a letter to the prawn
	_p.get_letter(letters);

	// Place prawn on cell
	_p.get_cell(cells);
}

// Start game with max prawns
for (var i = 0; i < total_prawns; i++) {
	create_prawn();
}

#endregion

#region Points

// Store user points
points = 0;

// Points gained on proper slap
points_gained_on_success = 3;

// Points lost on failed slap
points_lost_on_fail = 1;

// Used for feedback on mistakes
draw_red = false;

// Create score display
score_display = instance_create_layer(room_width / 2, room_height / 2, "Back", oScore);

#endregion

#region Timer

// A second in ms
second = 1000000;

// Seconds before game ends
seconds_to_end = 12;

// Time before game ends in ms
time_to_end = seconds_to_end * second;

// How much time has passed
time_passed = 0;

// Total seconds passed
seconds_passed = 0;

// Boolean for timer started
//timer_started = false;

#endregion

#region Score Screen

// Button controls for score screen
menu_button = vk_escape;
retry_button = vk_space;

// Score screen related sequence
score_sequence = noone;

#endregion