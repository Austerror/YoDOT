function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.itemid == 13937 and not getPlayerMount(cid, 15) then
		doRemoveItem(item.uid)
		doSendMagicEffect(fromPosition, CONST_ME_MAGIC_BLUE)
		doPlayerAddMount(cid, 15)
	end
	return true
end