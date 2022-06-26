enum PrawnState {
	waiting,
	cooldown,
	waiting2,
	done,
	length
}

#region Prawn struct

// Prawn constructor
function Prawn(seq) constructor {
	self.sequence = seq;
	self.state = PrawnState.waiting;
	self.letter = noone;
	self.cell = noone;
	self.cooldown = 60;

	self.get_letter = choose_letter;
	self.return_letter = return_letter;
	self.next = next_state;

	self.get_cell = choose_cell;
	self.return_cell = return_cell;
}

#endregion

#region choose_cell

/**
* Set personal prawn cell to available cell slot
*
* @function		choose_cell(cells)
* @param		{array}		cells		Array of Cell structs
* @return		{self}
*/
function choose_cell(cells) {
	// Get random available index
	var index = irandom(array_length(cells) - 1);

	// Set cell
	self.cell = cells[index];

	// Remove cell from cell array so it is no longer available
	array_delete(cells, index, 1);

	// Set sequence
	var border = 24;
	layer_sequence_x(self.sequence, irandom_range(self.cell.x1 + border, self.cell.x1 + self.cell.size - border));
	layer_sequence_y(self.sequence, irandom_range(self.cell.y1 + border, self.cell.y1 + self.cell.size - border));

	return self;
}

#endregion

#region return_cell

/**
* Return cell to available cells
*
* @function		return_cell(cells)
* @param		{array}		cells		Array of Cell structs
* @return		{self}
*/
function return_cell(cells) {
	// Exit early if prawn doesn't have a cell to return
	if (self.cell == noone) {
		return self;
	}

	// Add prawn cell to available cells
	array_push(cells, self.cell);

	// Remove cell address from self
	self.cell = noone;

	return self;
}

#endregion

#region choose_letter

/**
* Retrieve an available letter
*
* @function		choose_letter(letters)
* @param		{array}		letters		Array of available letters
* @return		{self}
*/
function choose_letter(letters) {
	// Get random available index
	var index = irandom(array_length(letters) - 1);

	// Set letter
	self.letter = letters[index];

	// Remove letter from letters array so it is no longer available
	array_delete(letters, index, 1);

	return self;
}

#endregion

#region return_letter

/**
* Return letter to available letters
*
* @function		return_letter(letters)
* @param		{array}		letters		Array of available letters
* @return		{self}
*/
function return_letter(letters) {
	// Exit early if prawn doesn't have a letter to return
	if (self.letter == noone) {
		return self;
	}

	// Add prawn cell to available cells
	array_push(letters, self.letter);

	// Remove cell address from self
	self.letter = noone;

	return self;
}

#endregion

#region next_state

/**
* Increment state
*
* @function		next_state(letters)
* @param		{array}		letters		Array of available letters
* @return		{self}
*/
function next_state(letters) {
	// Increment state by 1
	if (self.state < PrawnState.done) {
		self.state += 1;
	}

	switch (self.state) {
		case (PrawnState.cooldown):
		case (PrawnState.done):
			// Return letter
			self.return_letter(letters);
		break;
		case (PrawnState.waiting2):
			// Get a new letter
			self.get_letter(letters);
		break;
	}

	// Play sequence
	layer_sequence_play(self.sequence);

	return self;
}

#endregion
