function onStepOut(cid, item, position, fromPosition)
	queststatus = getPlayerStorageValue(cid,2004)
	if queststatus == -1 then
		doSendMagicEffect({x = 1019, y = 988, z = 6, stackpos = 1}, 55)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"Say \'hi\' to NPC\'s to talk with them. Elwynn has a mission for you, walk up to him and say \'hi\'.")
		setPlayerStorageValue(cid,2004,1)
	end
	return TRUE
end