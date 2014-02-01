TILE_SNOW = 670
TILE_FOOTPRINT = 6594
LEAVING_TRACKS_PSV = 30028

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	if(isPlayerGhost(cid)) then
		return true
	end
	if (item.itemid == TILE_SNOW) then
		doTransformItem(item.uid, TILE_FOOTPRINT)
		doDecayItem(item.uid)
	else
		doTransformItem(item.uid, (item.itemid + 15))
		doDecayItem(item.uid)
	end
	if (getPlayerStorageValue(cid, LEAVING_TRACKS_PSV) < 10000) then
		setPlayerStorageValue(cid, LEAVING_TRACKS_PSV, getPlayerStorageValue(cid, LEAVING_TRACKS_PSV)+1)
	elseif (getPlayerStorageValue(cid, LEAVING_TRACKS_PSV) == 10000) then
		doPlayerAddAchievement(cid, 278, true)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_GIFT_WRAPS)
		setPlayerStorageValue(cid, LEAVING_TRACKS_PSV, getPlayerStorageValue(cid, LEAVING_TRACKS_PSV)+1)
	end
	return true
end
