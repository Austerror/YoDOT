function onStepIn(cid, item, position, fromPosition)
	queststatus = getPlayerStorageValue(cid,2002)
	if queststatus == -1 then
		doSendMagicEffect({x = 1016, y = 992, z = 6, stackpos = 1}, 56)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"Hold Ctrl and click the gate with your left mouse button to 'use' it.")
		setPlayerStorageValue(cid,2002,1)
	end
	return TRUE
end