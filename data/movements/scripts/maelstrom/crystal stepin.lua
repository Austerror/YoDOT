function onStepIn(cid, item, position, fromPosition)
	crystalPos = {x = 1065, y = 1063, z = 15, stackpos=1}
	crystalThing = getThingFromPos(crystalPos)
	doTransformItem(crystalThing.uid, 8638)
	return true
end

function onStepOut(cid, item, position, fromPosition)
	crystalPos = {x = 1065, y = 1063, z = 15, stackpos=1}
	crystalThing = getThingFromPos(crystalPos)
	doTransformItem(crystalThing.uid, 8637)
	return true
end