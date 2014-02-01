function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.itemid == 2782 then
		doTransformItem(itemEx.uid, 2781)
		doDecayItem(itemEx.uid)
		return TRUE
	elseif itemEx.itemid == 3985 then
		doTransformItem(itemEx.uid, 3984)
		doDecayItem(itemEx.uid)
		return TRUE
	elseif itemEx.itemid == 1499 then
		doRemoveItem(itemEx.uid)
	end
	return destroyItem(cid, itemEx, toPosition)
end