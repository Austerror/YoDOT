function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (itemEx.uid <= 65535 or itemEx.actionid > 0) and (itemEx.itemid == 354 or itemEx.itemid == 355) then
		doTransformItem(itemEx.uid, 392)
		doDecayItem(itemEx.uid)
		doSendMagicEffect(toPosition, CONST_ME_POFF)
		return TRUE
	elseif itemEx.itemid == 11227 then -- shiny stone
		math.randomseed( os.time() )
		math.random(); math.random(); math.random()
		local refined = math.random(1, 10000)
		if refined >= 9962 then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a crystal coin.')
			doRemoveItem(itemEx.uid, 1)
			doPlayerAddItem(cid, 2160)
		elseif refined >= 9418 then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a gold coin.')
			doRemoveItem(itemEx.uid, 1)
			doPlayerAddItem(cid, 2148)
		elseif refined >= 5076 then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a platinum coin.')
			doRemoveItem(itemEx.uid, 1)
			doPlayerAddItem(cid, 2152)
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a small diamond.')
			doRemoveItem(itemEx.uid, 1)
			doPlayerAddItem(cid, 2145)
		end
	end
	return FALSE
end