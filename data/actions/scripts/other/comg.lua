function onUse(cid, item, fromPosition, itemEx, toPosition)

	if itemEx.itemid == 2700 then
		math.randomseed( os.time() )
		math.random(); math.random(); math.random()
		if math.random(100) <= 7 then
			doRemoveItem(item.uid,1)
			doPlayerAddItem(cid,13539,1)
			doSendMagicEffect(getCreaturePosition(cid), 12)
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You receive a golden fir cone.")
		else
			doRemoveItem(item.uid,1)
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"Drizzling all over a fir cone you picked from the tree, the molten gold only covers about half of it - not enough.")
		end
	end
	return TRUE
end