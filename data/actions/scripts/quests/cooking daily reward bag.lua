function onUse(cid, item, fromPosition, itemEx, toPosition)
	math.randomseed( os.time() )
	math.random(); math.random(); math.random()
	local contents = math.random(1, 1000)
	if contents >= 985 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a hunting horn.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 13247)
	elseif contents >= 970 then
		doRemoveItem(item.uid, 1)
		mountBook = doPlayerAddItem(cid, 2217, 1)
		doSetItemActionId(mountBook,2450)
		doSetItemSpecialDescription(mountBook, "Using this book will teach you the Shadow Draptor mount.")
	elseif contents >= 955 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found some elemental spikes.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 13940)
	elseif contents >= 940 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a mages cap.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 13756)
	elseif contents >= 925 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found an old cape.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 12657)
	elseif contents >= 910 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a sedge hat.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 12656)
	elseif contents >= 895 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a voodoo doll.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 3955)
	elseif contents >= 880 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a training manual.')
		doRemoveItem(item.uid, 1)
		mountBook = doPlayerAddItem(cid, 2217, 1)
		doSetItemActionId(mountBook,2456)
		doSetItemSpecialDescription(mountBook, "Using this book will teach you the brown mare mount.")
	elseif contents >= 700 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found 10 rice balls.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 11246,10)
	elseif contents >= 600 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have 10 power cakes.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 6542,10)
	elseif contents >= 500 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found 10 magic cakes.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 6543,10)
	elseif contents >= 400 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found 10 shield cakes.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 6544,10)
	elseif contents >= 395 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a crystal coin.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 2160,10)
	elseif contents >= 350 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found 50 platinum coins.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 2152,50)
	elseif contents >= 100 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found some platinum coins.')
		pCoins = math.random(11, 24)
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 2152,pCoins)
	end
	return TRUE
end