function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.actionid == 2321 and getPlayerStorageValue(cid,2332) == -1 then -- first net
		--fire = doCreateItem(1493, 1, toPosition) -- add fire
		doDecayItem(doCreateItem(1493, 1, toPosition))
		setPlayerStorageValue(cid,2332,1)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_RED)
	elseif itemEx.actionid == 2322 and getPlayerStorageValue(cid,2333) == -1 then -- 2nd net
		--fire = doCreateItem(1493, 1, toPosition) -- add fire
		doDecayItem(doCreateItem(1493, 1, toPosition))
		setPlayerStorageValue(cid,2333,1)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_RED)
	elseif itemEx.actionid == 2323 and getPlayerStorageValue(cid,2334) == -1 then -- 3rd net
		--fire = doCreateItem(1493, 1, toPosition) -- add fire
		doDecayItem(doCreateItem(1493, 1, toPosition))
		setPlayerStorageValue(cid,2334,1)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_RED)
	elseif itemEx.actionid == 2324 and getPlayerStorageValue(cid,2335) == -1 then -- 4 net
		--fire = doCreateItem(1493, 1, toPosition) -- add fire
		doDecayItem(doCreateItem(1493, 1, toPosition))
		setPlayerStorageValue(cid,2335,1)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_RED)
	elseif itemEx.actionid == 2325 and getPlayerStorageValue(cid,2336) == -1 then -- 5 net
		--fire = doCreateItem(1493, 1, toPosition) -- add fire
		doDecayItem(doCreateItem(1493, 1, toPosition))
		setPlayerStorageValue(cid,2336,1)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_RED)
	end
	if getPlayerStorageValue(cid,2332) == 1 and getPlayerStorageValue(cid,2333) == 1 and getPlayerStorageValue(cid,2334) == 1 and getPlayerStorageValue(cid,2335) == 1 and getPlayerStorageValue(cid,2336) == 1 then
		setPlayerStorageValue(cid,2329,2)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "That's all 5 nets burned. It\'s time to return to Rex.")
	end
end