randomize()
network_set_config(network_config_use_non_blocking_socket, 1);
display = false
player_info = ds_map_create();

//ds_map_add(player_info, "my_id", irandom_range(0,4000));

//calculate stars out of 3 based on global.total_score
//shell collect game: 5 pt -> 1, 10pt -> 2, anything over 15 --> 3!
var stars = 0
if global.total_score <= 5 {
	stars = 1
}
else if global.total_score <= 10 and global.total_score > 5 {
	stars = 2
}
else if global.total_score > 10 {
	stars = 3
}


ds_map_add(player_info, "my_score", stars);

data_to_send = json_encode(player_info);
url = "http://localhost:3030/data";

data = json_encode(player_info);

get = http_get("url");
display = true



_headers = ds_map_create();
ds_map_add(_headers, "Content-Type", "application/json");
request_id = http_request(url, "POST", _headers, data);
ds_map_destroy(_headers);