global.CLIENT = network_create_socket(network_socket_tcp);
var connection = network_connect(global.CLIENT, "127.0.0.1", 6510);

if (connection < 0) {
	show_message("Fallo conectando al servidor");
	exit;
}

global.IS_SERVER = false;
room_goto(Room2);