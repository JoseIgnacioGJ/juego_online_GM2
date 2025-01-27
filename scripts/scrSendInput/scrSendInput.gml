function scrSendInput(){
	var buffer = buffer_create(0, buffer_grow, 1);
	
	buffer_write(buffer, buffer_string, "client_input");
	buffer_write(buffer, buffer_f16, input.hor);
	
	network_send_packet(global.CLIENT, buffer, buffer_get_size(buffer));
	
	buffer_delete(buffer);
}