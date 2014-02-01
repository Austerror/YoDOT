function onUse(cid, item, fromPosition, itemEx, toPosition)
	floorPos1 = {x = 1083, y = 1063, z = 12, stackpos=0}
	floorPos2 = {x = 1083, y = 1062, z = 12, stackpos=0}
	floorToID1 = 9224
	floorToID2 = 9231
	floorEventGSV = 2461
	if getGlobalStorageValue(floorEventGSV) == -1 then
		floor1Pos = getThingFromPos(floorPos1)
		floor2Pos = getThingFromPos(floorPos2)
		
		doRemoveItem(floor1Pos.uid)
		doRemoveItem(floor2Pos.uid)
		doCreateItem(floorToID1, floorPos1)
		doCreateItem(floorToID2, floorPos2)
		doSendMagicEffect(toPosition, 12)
		setGlobalStorageValue(floorEventGSV,1)
		addEvent(floorBack,60000)
	end
	return true
end

function floorBack()
	floorPos1 = {x = 1083, y = 1063, z = 12, stackpos=0}
	floorPos2 = {x = 1083, y = 1062, z = 12, stackpos=0}
	floorID = 598
	floorEventGSV = 2461
	floor1Pos = getThingFromPos(floorPos1)
	floor2Pos = getThingFromPos(floorPos2)
	doRemoveItem(floor1Pos.uid)
	doRemoveItem(floor2Pos.uid)
	doCreateItem(floorID, floorPos1)
	doCreateItem(floorID, floorPos2)	
	setGlobalStorageValue(floorEventGSV,-1)
	return true
end