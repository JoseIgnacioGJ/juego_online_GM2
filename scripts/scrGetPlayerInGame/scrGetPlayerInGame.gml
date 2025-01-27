function scrGetPlayerInGame(serverId){
	for(var i=0; i<instance_number(objNPC);i++){
		var npc = instance_find(objNPC, i);
		
		if(npc.serverId == serverId) {
			return npc;
		}
	}
	
	return noone;
}