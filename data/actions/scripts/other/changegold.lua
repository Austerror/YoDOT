function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == ITEM_GOLD_COIN and item.type == ITEMCOUNT_MAX then
		doChangeTypeItem(item.uid, item.type - item.type)
		doPlayerAddItem(cid, ITEM_PLATINUM_COIN, 1)
		doCreatureSay(cid, "$$$", TALKTYPE_ORANGE_1)
	elseif item.itemid == ITEM_PLATINUM_COIN and item.type == ITEMCOUNT_MAX then
		doChangeTypeItem(item.uid, item.type - item.type)
		doPlayerAddItem(cid, ITEM_CRYSTAL_COIN, 1)
		doCreatureSay(cid, "$$$", TALKTYPE_ORANGE_1)
	elseif item.itemid == ITEM_PLATINUM_COIN and item.type < ITEMCOUNT_MAX then
		doChangeTypeItem(item.uid, item.type - 1)
		doPlayerAddItem(cid, ITEM_GOLD_COIN, ITEMCOUNT_MAX)
		doCreatureSay(cid, "$$$", TALKTYPE_ORANGE_1)
	elseif item.itemid == ITEM_CRYSTAL_COIN then
		doChangeTypeItem(item.uid, item.type - 1)
		doPlayerAddItem(cid, ITEM_PLATINUM_COIN, ITEMCOUNT_MAX)
		doCreatureSay(cid, "$$$", TALKTYPE_ORANGE_1)
	else
		return FALSE
	end
	return TRUE
end