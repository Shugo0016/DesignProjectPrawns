randomize()
network_set_config(network_config_use_non_blocking_socket, 1);
display = false
player_info = ds_map_create();
ds_map_add(player_info, "my_id", irandom_range(0,4000));
ds_map_add(player_info, "my_score", global.total_score);

data_to_send = json_encode(player_info);
url = "http://localhost:3030/data";

data = json_encode(player_info);
//var request_id = http_request(url,"POST",player_info,"application/json")
//req = http_post_string(url, "dsagsda");
//http_set_request_header(request_id, "Content-Type", "application/json");


get = http_get("url");
display = true



_headers = ds_map_create();
ds_map_add(_headers, "Content-Type", "application/json");
request_id = http_request(url, "POST", _headers, data);
ds_map_destroy(_headers);