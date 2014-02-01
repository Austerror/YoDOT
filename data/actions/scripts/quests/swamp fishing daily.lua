local swampIds = {4691, 4692, 4693, 4694, 4695, 4696, 4697, 4698, 4699, 4700, 4701, 4702, 4703, 4704, 4705, 4706, 4707, 4708, 4709, 4710, 4711, 4712}
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if isInArray(swampIds, itemEx.itemid) == TRUE then
		if getPlayerStorageValue(cid,2328) == 4 then -- is on swamp daily
			if getPlayerStorageValue(cid,2329) == 1 then -- is active on the daily
				doRemoveItem(item.uid) -- remove swamp fish
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have successfully released the swamp fish. It\'s time to return to Rex.")
				doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN)
				setPlayerStorageValue(cid,2329,2) -- daily set to complete
			end
		end
	return true
	end
end