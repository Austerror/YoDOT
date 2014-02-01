function onUse(cid, item, fromPosition, itemEx, toPosition)
	math.randomseed( os.time() )
	math.random(); math.random(); math.random()
	local contents = math.random(1, 1000)
	if contents >= 998 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a slug drug.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 13508)
	elseif contents >= 995 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a fish fin.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 5895)
	elseif contents >= 991 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a plague mask.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 13925)
	elseif contents >= 986 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a book of prayers.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 10563)
	elseif contents >= 981 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a piece of iron ore.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 5880)
	elseif contents >= 976 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a doll.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 2110)
	elseif contents >= 969 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a piggy bank.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 2114)
	elseif contents >= 961 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a spiders silk.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 5879)
	elseif contents >= 953 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a white pearl.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 2143)
	elseif contents >= 944 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a plague bell.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 13926)
	elseif contents >= 931 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a garlic necklace.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 2199, 150)
	elseif contents >= 916 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a scarf.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 2661)
	elseif contents >= 895 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found spider fangs.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 8859)
	elseif contents >= 863 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a knife.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 2403)
	elseif contents >= 830 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a turtle shell.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 5899)
	elseif contents >= 795 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a white mushroom.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 2787)
	elseif contents >= 757 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a bat wing.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 5894)
	elseif contents >= 719 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a honeycomb.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 5902)
	elseif contents >= 681 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found some worms.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 3976,4)
	elseif contents >= 642 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a chicken feather.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 5890)
	elseif contents >= 602 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a bunch of troll hair.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 10606)
	elseif contents >= 562 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found some gold coins.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 2148,6)
	elseif contents >= 507 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found an egg.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 2695)
	elseif contents >= 363 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a broken piggy bank.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 2115)
	elseif contents >= 201 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a dirty cape.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 2237)
	elseif contents >= 30 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found some worn leather boots.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 2238)
	elseif contents >= 0 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'There was nothing inside.')
		doRemoveItem(item.uid, 1)
	end
	return TRUE
end