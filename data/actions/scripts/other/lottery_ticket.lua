function onUse(cid, item, fromPosition, itemEx, toPosition)
	math.randomseed( os.time() )
	math.random(); math.random(); math.random()
	local ticketNumber = math.random(1, 100)
	if ticketNumber <= 5 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You got a winning lottery ticket.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 5958)
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You were unlucky this time.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 5956)
	end
	return TRUE
end