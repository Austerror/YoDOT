function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid <= 9978 then
		doTransformItem(item.uid, (item.itemid + 1))
	else
		doTransformItem(item.uid, (item.itemid - 3))
	end
	return TRUE
end