function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == 2785 then
		doTransformItem(item.uid, 2767)
		doCreateItem(2677, 3, fromPosition)
		addEvent(transformBack, 300000, {position = fromPosition})
	end
	return TRUE
end

function transformBack(parameters)
	parameters.position.stackpos = STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE
	local topThing = getThingfromPos(parameters.position)
	if topThing.itemid == 2677 then
		addEvent(transformBack, 300000, parameters)
	else
		for i = STACKPOS_FIRST_ITEM_ABOVE_GROUNDTILE, STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE do
			parameters.position.stackpos = i
			topThing = getThingfromPos(parameters.position)
			if topThing.itemid == 2767 then
				doTransformItem(topThing.uid, 2785)
				break
			end
		end
	end
end