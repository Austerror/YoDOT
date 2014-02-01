local holes = {468}
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if isInArray(holes, itemEx.itemid) == TRUE then
		doTransformItem(itemEx.uid, itemEx.itemid + 1)
		doDecayItem(itemEx.uid)
		doTransformItem(item.uid, 2554)
	else
		return FALSE
	end
	return TRUE
end