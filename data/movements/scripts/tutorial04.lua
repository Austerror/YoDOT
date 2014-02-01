function onStepIn(cid, item, position, fromPosition)
	queststatus = getPlayerStorageValue(cid,2003)
	if queststatus == 1 then
		doSendMagicEffect({x = 1022, y = 985, z = 6, stackpos = 1}, 56)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"Hold Ctrl and click the chest to 'open' it and receive your items.")
		setPlayerStorageValue(cid,2003,2)
	end
	return TRUE
end