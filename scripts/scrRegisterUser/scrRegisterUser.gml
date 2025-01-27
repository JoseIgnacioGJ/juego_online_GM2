function scrRegisterUser(playerName){
	var buffer = buffer_create(0, buffer_grow, 1);
	
	buffer_write(buffer, buffer_string, "register_user");
	buffer_write(buffer, buffer_string, playerName);
	
	network_send_packet(global.CLIENT, buffer, buffer_get_size(buffer));
	
	buffer_delete(buffer);
}