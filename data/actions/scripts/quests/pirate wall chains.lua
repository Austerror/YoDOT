function onUse(cid, item, fromPosition, itemEx, toPosition)
	abbeyPos = {x=1115,y=1165,z=7,stackpos=255}
	abbey = getThingfromPos {x=1115,y=1165,z=7,stackpos=255}
	if isCreature(abbey.uid) then
		if getPlayerStorageValue(cid,2341) == 4 then
			if getCreatureName(abbey.uid) == 'Abbey' then
				doRemoveCreature(abbey.uid)
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"You have rescued Abbey, use your Hearth Stone to return home and tell Leruno.")
				setPlayerStorageValue(cid,2341,5)
				doSendMagicEffect(abbeyPos, 10)
				--addEvent(spawnAbbey, 120000)
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"Abbey is not here.")
			end
		end
	end
	return true
end

--function spawnAbbey()
	--doSummonCreature("Abbey", {x=1115,y=1165,z=7,stackpos=255})
--end