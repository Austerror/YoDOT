function onUse(cid, item, fromPosition, itemEx, toPosition)
	leftSkullIn = {x=966,y=1148,z=7}
	leftSkullOut = {x=968,y=1148,z=7}
	rightSkullIn = {x=983,y=1148,z=7}
	rightSkullOut = {x=981,y=1148,z=7}
	if item.actionid == 2407 and getPlayerStorageValue(cid,2405) == 1 then
		doTeleportThing(cid,leftSkullIn)
	elseif item.actionid == 2408 then
		doTeleportThing(cid,leftSkullOut)
	elseif item.actionid == 2409 and getPlayerStorageValue(cid,2406) == 1 then
		doTeleportThing(cid,rightSkullIn)
	elseif item.actionid == 2410 then
		doTeleportThing(cid,rightSkullOut)
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'Nothing happens.')
	end
	return true
end
