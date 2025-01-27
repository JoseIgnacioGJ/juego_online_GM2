global.SERVER = network_create_server(network_socket_tcp, 6510, 4);

if(global.SERVER < 0) {
	show_message("Fallo creando el servidor");
	exit;
}

global.IS_SERVER = true;
room_goto(Room2);