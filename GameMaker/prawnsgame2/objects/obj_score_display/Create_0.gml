/// @description Insert description here
// You can write your code in this editor
randomize()
network_set_config(network_config_use_non_blocking_socket, 1);
display = false
player_info = ds_map_create();

session_id = irandom(10000000)
gameid = 2
level_id = 2001
completed = true;
//score = global score

//adding data to the map - port 8888
//session_id,student_id,game_id,level_id,
//score,time_spent,completed

if room == ScoreRoom {

	ds_map_add(player_info, "session_id", session_id);
	ds_map_add(player_info, "game_id", gameid);
	ds_map_add(player_info, "level_id", level_id);
	ds_map_add(player_info, "score", global.total_score);
	ds_map_add(player_info, "time_spent", "0:05:00");
	ds_map_add(player_info, "completed", true);




	data_to_send = json_encode(player_info);
	url = "http://localhost:8888/data";
	data = json_encode(player_info);
	get = http_get("url");
	display = true



	//html request
	_headers = ds_map_create();
	ds_map_add(_headers, "Content-Type", "application/json");
	request_id = http_request(url, "POST", _headers, data);
	ds_map_destroy(_headers);
}