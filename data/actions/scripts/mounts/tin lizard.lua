function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.itemid == 13306 and not getPlayerMount(cid, 8) then
		doRemoveItem(item.uid)
		doSendMagicEffect(fromPosition, CONST_ME_MAGIC_BLUE)
		doPlayerAddMount(cid, 8)
	end
	return true
end