function onUse(cid, item, fromPosition, itemEx, toPosition)
	keyPos = {x = 1015, y = 1234, z = 11, stackpos=255}
	playerPos = {x = 1016, y = 1234, z = 11}
	playertoPos = {x = 1005, y = 1247, z = 11}
	player = getTopCreature(playerPos)
	key = getThingFromPos(keyPos)
	
	if key.itemid == 15422 then
		doRemoveItem(key.uid,1)
		doTeleportThing(player.uid, playertoPos)
	end
	return true
end