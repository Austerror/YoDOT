function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == 5096 then
		doTransformItem(item.uid, 2726)
		doCreateItem(2678, 5, fromPosition)
		addEvent(palmBack, 300000, {palmPos = fromPosition})
	end
	return TRUE
end

function palmBack(parameters)
	palmThing = getThingFromPos(parameters.palmPos)
	if palmThing.itemid == 2726 then
		doTransformItem(palmThing.uid, 5096)
	else
		addEvent(palmBack, 300000, parameters)
	end
end