function onUse(cid, item)

	if item.uid == 2405 and getPlayerStorageValue(cid,2405) == -1 then
		doCreatureSay(cid, "FEED MEEEEEE!", TALKTYPE_ORANGE_1)
	elseif item.uid == 2406 and getPlayerStorageValue(cid,2406) == -1 then
		doCreatureSay(cid, "FEED MEEEEEE!", TALKTYPE_ORANGE_1)
	elseif item.uid == 2407 and getPlayerStorageValue(cid,2412) == -1 then
		doCreatureSay(cid, "FEED MEEEEEE!", TALKTYPE_ORANGE_1)
	end
	return ture
end