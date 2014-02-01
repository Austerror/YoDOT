function onUse(cid, item, fromPosition, itemEx, toPosition)
	--skullPos = {x = 1079, y = 1089, z = 8, stackpos=255}
	player1Pos = {x = 1063, y = 1093, z = 8}
	player2Pos = {x = 1060, y = 1097, z = 9}
	player1toPos = {x = 1060, y = 1093, z = 9}
	--player2toPos  = {x = 1060, y = 1097, z = 9}
	player1 = getTopCreature(player1Pos)
	player2 = getTopCreature(player2Pos)
	--skull = getThingFromPos(skullPos)
	
	--if skull.itemid == 2229 then
		if (isInParty(player1.uid) and isInParty(player2.uid)) and (getPlayerParty(player1.uid) == getPlayerParty(player2.uid)) then
			--doRemoveItem(skull.uid,1)
			doTeleportThing(player1.uid, player1toPos)
			--doTeleportThing(player2.uid, player2toPos)
		end
	--end
	return true
end