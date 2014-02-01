function onUse(cid, item, fromPosition, itemEx, toPosition)
	if math.random(1, 6) <= 3 then
		doSendMagicEffect(fromPosition, CONST_ME_MAGIC_RED)
		doTransformItem(item.uid, 7591)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'It turned into a great health potion.')
	else
		doSendMagicEffect(fromPosition, CONST_ME_MAGIC_BLUE)
		doTransformItem(item.uid, 7590)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'It turned into a great mana potion.')
	end
	return TRUE
end