function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == 4006 then
		doTransformItem(item.uid, 4008)
		doCreateItem(2675, 5, fromPosition)
		addEvent(treeBack, 300000, {treePos = fromPosition})
	end
	return TRUE
end

function treeBack(parameters)
	--treePos = {x = 1065, y = 1066, z = 15, stackpos=1}
	treeThing = getThingFromPos(parameters.treePos)
	if treeThing.itemid == 4008 then
		doTransformItem(treeThing.uid, 4006)
	else
		addEvent(treeBack, 300000, parameters)
	end
end