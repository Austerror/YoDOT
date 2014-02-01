function onUse(cid, item, fromPosition, itemEx, toPosition)
	leverPos = {x = 1150, y = 1047, z = 11, stackpos=2}
	wallPos1 = {x = 1147, y = 1063, z = 11, stackpos=1}
	wallPos2 = {x = 1148, y = 1063, z = 11, stackpos=1}
	switchClosed = 9827
	switchOpen = 9828
	switchEventGSV = 2482
	if getGlobalStorageValue(switchEventGSV) == -1 then
		wall1Pos = getThingFromPos(wallPos1)
		wall2Pos = getThingFromPos(wallPos2)
		doRemoveItem(wall1Pos.uid)
		doRemoveItem(wall2Pos.uid)
		doTransformItem(item.uid, switchOpen)
		setGlobalStorageValue(switchEventGSV,1)
		addEvent(wallBack,180000)
	end
	return true
end

function wallBack()
	leverPos = {x = 1150, y = 1047, z = 11, stackpos=2}
	wallPos1 = {x = 1147, y = 1063, z = 11, stackpos=1}
	wallPos2 = {x = 1148, y = 1063, z = 11, stackpos=1}
	switchClosed = 9827
	switchOpen = 9828
	switchEventGSV = 2482
	wall1id = 6396
	wall2id = 6398
	switchThing = getThingFromPos(leverPos)
	doCreateItem(wall1id, wallPos1)
	doCreateItem(wall2id, wallPos2)
	doTransformItem(switchThing.uid, switchClosed)
	setGlobalStorageValue(switchEventGSV,-1)
	return true
end