function onUse(cid, item, fromPosition, itemEx, toPosition)
	local itemWeight = 25.1
	local playerCap = getPlayerFreeCap(cid)	
	if getPlayerStorageValue(cid, 2492) == -1 then
		if playerCap >= itemWeight then
			container = doPlayerAddItem(cid, 11263, 1) -- backpack

			math.randomseed( os.time() )
			math.random(); math.random(); math.random()
			local contents = math.random(1, 3)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a fluffy santa backpack with something inside.')
			if contents == 1 then
				doAddContainerItem(container, 6512, 1) -- Santa Doll
			elseif contents == 2 then
				doAddContainerItem(container, 6531, 1) -- Santa Hat
			elseif contents == 3 then
				doAddContainerItem(container, 11255, 1) -- Santa Teddy
			end
			doAddContainerItem(container, 2160, 1) -- Crystal Coin
			
			christmasCard = doAddContainerItem(container, 6388, 1)
			doSetItemText(christmasCard, "Merry Christmas " .. getCreatureName(cid) .. "!\n\nMay 2012 bring you even more adventures.\n\nGM Yodot.")
			
			setPlayerStorageValue(cid, 2492, 1)
			doSendMagicEffect(getCreaturePosition(cid), 12) -- Magic effect on player to denote successful quest
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a fluffy santa backpack weighing 24 ounces, it is too heavy to pick up.')
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'There is nothing here.')
	end
	return true
end
