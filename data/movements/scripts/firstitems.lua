function onStepIn(cid, item, position, fromPosition)
	queststatus = getPlayerStorageValue(cid,2008)
	if queststatus == -1 then
		doSendMagicEffect({x = 1065, y = 1067, z = 7, stackpos = 1}, 56)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"Hold shift and click the sign with your left mouse button.")
		setPlayerStorageValue(cid,2008,1)
	end
	return TRUE
end