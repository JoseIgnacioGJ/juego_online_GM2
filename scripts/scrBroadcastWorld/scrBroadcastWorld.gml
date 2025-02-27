function scrBroadcastWorld(){
	var buffer = buffer_create(0, buffer_grow, 1);
	
	buffer_write(buffer, buffer_string, "update_world");
	buffer_write(buffer, buffer_s8, array_length(global.PLAYERS));
	
	for(var i=0; i<array_length(global.PLAYERS);i++){
		var player = global.PLAYERS[i];
		var instance = player.instance;
		
		buffer_write(buffer, buffer_s8, player.serverId);
		buffer_write(buffer, buffer_f16, instance.x);
		buffer_write(buffer, buffer_f16, instance.y);
		buffer_write(buffer, buffer_f16, instance.input.hor);
	}
	
	var bufferSize = buffer_get_size(buffer);
	for(var i=0; i<array_length(global.PLAYERS);i++){
		var player = global.PLAYERS[i];
		
		network_send_packet(player.id, buffer, bufferSize);
	}
	
	buffer_delete(buffer);
}