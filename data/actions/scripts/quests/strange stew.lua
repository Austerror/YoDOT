function onUse(cid, item, fromPosition, itemEx, toPosition)

	if getPlayerStorageValue(cid,2440) == 3 and getPlayerStorageValue(cid,2608) == -1 and item.itemid == 12798 then
		doTransformItem(item.uid, 12801)
		addEvent(stewBack, 180000, {stew = item.uid})
		doPlayerAddItem(cid, 9992, 1)
		setPlayerStorageValue(cid,2608,1)
		setPlayerStorageValue(cid,2444,2)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You retrieved the hideous pot of stew from the stove. It\'s time to return to Joliver.")
	end
end

function stewBack(parameters)
	doTransformItem(parameters.stew, 12798)
end