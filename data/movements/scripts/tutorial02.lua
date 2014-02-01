function onStepOut(cid, item, position, fromPosition)
	queststatus = getPlayerStorageValue(cid,2001)
	if queststatus == -1 then
		doSendMagicEffect({x = 1011, y = 991, z = 7, stackpos = 1}, 55)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"Simply walk towards the stairs to use them.")
		setPlayerStorageValue(cid,2001,1)
	end
	return TRUE
end