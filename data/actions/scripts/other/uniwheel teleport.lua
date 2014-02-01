function onUse(cid, item, fromPosition, itemEx, toPosition)

	local standPos = {x=1311,y=1010,z=5}
	local playerPos = getCreaturePosition(cid)
	local downFloor = {x=1311, y=1010,z=6}
	local coin1Pos = {x=1308,y=1007,z=5, stackpos=255}
	local coin2Pos = {x=1309,y=1008,z=5, stackpos=255}
	local coin3Pos = {x=1310,y=1009,z=5, stackpos=255}
	local coin4Pos = {x=1314,y=1007,z=5, stackpos=255}
	local coin5Pos = {x=1313,y=1008,z=5, stackpos=255}
	local coin6Pos = {x=1312,y=1009,z=5, stackpos=255}
	local coin7Pos = {x=1310,y=1011,z=5, stackpos=255}
	local coin8Pos = {x=1309,y=1012,z=5, stackpos=255}
	local coin9Pos = {x=1308,y=1013,z=5, stackpos=255}
	local coin10Pos = {x=1312,y=1011,z=5, stackpos=255}
	local coin11Pos = {x=1313,y=1012,z=5, stackpos=255}
	local coin12Pos = {x=1314,y=1013,z=5, stackpos=255}
	local c1 = getThingFromPos(coin1Pos)
	local c2 = getThingFromPos(coin2Pos)
	local c3 = getThingFromPos(coin3Pos)
	local c4 = getThingFromPos(coin4Pos)
	local c5 = getThingFromPos(coin5Pos)
	local c6 = getThingFromPos(coin6Pos)
	local c7 = getThingFromPos(coin7Pos)
	local c8 = getThingFromPos(coin8Pos)
	local c9 = getThingFromPos(coin9Pos)
	local c10 = getThingFromPos(coin10Pos)
	local c11 = getThingFromPos(coin11Pos)
	local c12 = getThingFromPos(coin12Pos)
	if playerPos.x == standPos.x and playerPos.y == standPos.y and playerPos.z == standPos.z then
		if c1.itemid == 2148 and c2.itemid == 2148 and c3.itemid == 2148 and c4.itemid == 2148 and c5.itemid == 2148 and c6.itemid == 2148 and c7.itemid == 2148 and c8.itemid == 2148 and c9.itemid == 2148 and c10.itemid == 2148 and c11.itemid == 2148 and c12.itemid == 2148 then
			doRemoveItem(c1.uid,1)
			doRemoveItem(c2.uid,1)
			doRemoveItem(c3.uid,1)
			doRemoveItem(c4.uid,1)
			doRemoveItem(c5.uid,1)
			doRemoveItem(c6.uid,1)
			doRemoveItem(c7.uid,1)
			doRemoveItem(c8.uid,1)
			doRemoveItem(c9.uid,1)
			doRemoveItem(c10.uid,1)
			doRemoveItem(c11.uid,1)
			doRemoveItem(c12.uid,1)
			doTeleportThing(cid, downFloor)
			if item.itemid == 9827 then
				doTransformItem(item.uid, 9828)
			else
				doTransformItem(item.uid, 9827)
			end
		end
	end
	return TRUE
end