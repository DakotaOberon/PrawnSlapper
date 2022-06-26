/**
* description goes here
*
* @function		submit_score(points)
* @param		{real}    points    Points earned by player
* @return		{type}
* @see			gxc_get_query_param, gxc_challenge_submit_score
*/
function submit_score(points) {
	if (global.prawn_slap_score == undefined) {
		return;
	}

	if (gxc_get_query_param("challenge") == global.prawn_slap_score) {
		gxc_challenge_submit_score(points);
	}

	return;
}
