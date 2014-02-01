function onUse(cid, item, fromPosition, itemEx, toPosition)
	math.randomseed( os.time() )
	math.random(); math.random(); math.random()
	local contents = math.random(1, 1000)
	if contents >= 980 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a titanica claw.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 13304)
	elseif contents >= 960 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a carrot on a stick.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 13298)
	elseif contents >= 930 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a superb fishing rod.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 10223)
	elseif contents >= 800 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a white pearl.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 2143)
	elseif contents >= 700 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a piece of iron ore.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 5880)
	elseif contents >= 600 then
		goldAmount = math.random(50, 200)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found ' .. goldAmount .. ' gold coins.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 2148, goldAmount)
	elseif contents >= 500 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a medicine pouch.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 13506)
	elseif contents >= 375 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a black pearl.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 2144)
	elseif contents >= 225 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a small amethyst.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 2150)
	elseif contents >= 150 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a slingshot.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 5907)
	elseif contents >= 110 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a spellwand.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 7735)
	elseif contents >= 10 then
		salmonAmount = math.random(3, 7)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found ' .. salmonAmount .. ' salmon.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 2668, salmonAmount)
	elseif contents >= 0 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a scorpion sceptre.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 13498)
	end
	return TRUE
end