if(global.IS_SERVER){
	instance_destroy();
	exit;
}

var playerName = get_string("Ingrese su nombre de usuario", "");
scrRegisterUser(playerName);
global.PLAYER_NAME = playerName;

instance_create_layer(128, 384, "Instances", objPlayer);