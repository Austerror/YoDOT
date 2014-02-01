function onStepIn(cid, item, position, fromPosition)
	if item.actionid == 1001 and getPlayerVocation(cid) ~= 1 then
		doTeleportThing(cid, fromPosition, FALSE)
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "This path is for sorcerers only!")
	elseif item.actionid == 1002 and getPlayerVocation(cid) ~= 2 then
		doTeleportThing(cid, fromPosition, FALSE)
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "This path is for druids only!")
	elseif item.actionid == 1003 and getPlayerVocation(cid) ~= 3 then
		doTeleportThing(cid, fromPosition, FALSE)
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "This path is for paladins only!")
	elseif item.actionid == 1004 and getPlayerVocation(cid) ~= 4 then
		doTeleportThing(cid, fromPosition, FALSE)
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "This path is for knights only!")
	end
	return TRUE
end