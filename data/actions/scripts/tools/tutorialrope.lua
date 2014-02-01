function onUse(cid, item, fromPosition, itemEx, toPosition)
	local groundTile = getThingfromPos(toPosition)
	if groundTile.itemid == 384 then
		doTeleportThing(cid, {x = toPosition.x, y = toPosition.y + 1, z = toPosition.z - 1}, FALSE)
		doTransformItem(item.uid, 2120)
	else
		return FALSE
	end
	return TRUE
end
