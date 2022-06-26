// Timer
// Percentage of time passed
var time = oController.time_passed / oController.time_to_end;

// Darken background based on time passed
draw_set_alpha(0.15);
draw_rectangle_color(0, 0, room_width, (room_height * time), c_black, c_black, c_black, c_black, 0);
draw_set_alpha(1);

// Draw points
draw_score(string(oController.points));
