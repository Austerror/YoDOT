function onUse(cid, item, fromPosition, itemEx, toPosition)
	math.randomseed( os.time() )
	math.random(); math.random(); math.random()
	local craftChance = math.random(1, 100)
	local clayId = item.id
	if craftChance <= 30 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You work the clay.')
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, clayId + 1)
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'The clay broke.')
		doRemoveItem(item.uid, 1)
	end
	return TRUE
end