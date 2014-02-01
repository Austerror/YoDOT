function onUse(cid, item, fromPosition, itemEx, toPosition)
	trollBarrels = {
		2436, 2437,
		2438, 2439,
		2440, 2441,
		2442
		}
	if isInArray(trollBarrels, itemEx.uid) == true and itemEx.itemid == 7706 and getPlayerStorageValue(cid,2444) ~=2 then -- Hasn't destroyed 3 barrels
		if getPlayerStorageValue(cid,2438) == -1 then -- First barrel.
			setPlayerStorageValue(cid,2438,1) -- set to 1
		else
			setPlayerStorageValue(cid,2438,(getPlayerStorageValue(cid,2438) + 1)) -- do math
		end
		if getPlayerStorageValue(cid,2438) >= 3 then
			setPlayerStorageValue(cid,2444,2)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have destroyed 3 barrels. It\'s time to return to Joliver.")
		end
		addEvent(remakeBarrels, 120000, {barrelPos = toPosition, barrelUID = itemEx.uid}) -- barrel event
		doTransformItem(itemEx.uid, 7701) -- change barrel to rubbish
		doSendMagicEffect(toPosition, CONST_ME_POFF) -- POFF on rubbish
		return true
	end
	if getPlayerStorageValue(cid,2438) >= 3 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have destroyed 3 barrels. It\'s time to return to Joliver.")
		return true
	end
end

function remakeBarrels(parameters)
	doTransformItem(parameters.barrelUID, 7706)
end