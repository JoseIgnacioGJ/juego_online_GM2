var type = ds_map_find_value(async_load, "type");

if(type == network_type_data){
	var buffer =  ds_map_find_value(async_load, "buffer");
	var bufferType = buffer_read(buffer, buffer_string);
	var playerId =  ds_map_find_value(async_load, "id");
		
	if (bufferType == "register_user") {
		var playerName = buffer_read(buffer, buffer_string);
		var serverId = global.PLAYER_SERVER_ID++;
	
		var npc = instance_create_layer(128, 384, "Instances", objNPC);
		npc.name = playerName;
	
		array_push(global.PLAYERS, {
			"id": playerId,
			"name": playerName,
			"serverId": serverId,
			"instance": npc
		});
	
	
		scrAcceptUser(playerId, serverId);
		scrBroadcastUsers();
	} else if (bufferType == "client_input") {
		var hor = buffer_read(buffer, buffer_f16);
		
		for(var i=0; i<array_length(global.PLAYERS); i++) {
			var player = global.PLAYERS[i];
			if(player.id == playerId) {
				var instance = player.instance;
				
				instance.input.hor = hor;
				break;
			}
		}
	}
	
	buffer_delete(buffer);
} else if(type == network_type_disconnect) {
	var playerId =  ds_map_find_value(async_load, "socket");
	
	for(var i=0; i<array_length(global.PLAYERS); i++){
		var player = global.PLAYERS[i];
		if(player.id == playerId) {
			with (player.instance){
				instance_destroy();
			}
			array_delete(global.PLAYERS, i, 1);
			break;
		}
	}
	
	scrBroadcastUsers();
}