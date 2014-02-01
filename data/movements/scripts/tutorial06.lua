function onStepOut(cid, item, position, fromPosition)
	queststatus = getPlayerStorageValue(cid,2005)
	if queststatus == -1 then
		doSendMagicEffect({x = 1020, y = 990, z = 7, stackpos = 1}, 55)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"These are the weapon and armor racks Elwynn was talking about. Use both of them like you did the chest in the house.")
		setPlayerStorageValue(cid,2005,1)
	end
	return TRUE
end