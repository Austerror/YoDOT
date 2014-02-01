function onUse(cid, item, fromPosition, itemEx, toPosition)

if item.uid == 2348 and getPlayerStorageValue(cid,2348) == -1 then
	doPlayerAddItem(cid,9694,1)
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a jester dolls head.")
	doSendMagicEffect(getCreaturePosition(cid), 12)
	setPlayerStorageValue(cid,2348,1)
elseif item.uid == 2349 and getPlayerStorageValue(cid,2349) == -1 then
	doPlayerAddItem(cid,9695,1)
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a jester dolls torso.")
	doSendMagicEffect(getCreaturePosition(cid), 12)
	setPlayerStorageValue(cid,2349,1)
elseif item.uid == 2350 and getPlayerStorageValue(cid,2350) == -1 then
	doPlayerAddItem(cid,9696,1)
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a jester dolls right arm.")
	doSendMagicEffect(getCreaturePosition(cid), 12)
	setPlayerStorageValue(cid,2350,1)
elseif item.uid == 2351 and getPlayerStorageValue(cid,2351) == -1 then
	doPlayerAddItem(cid,9697,1)
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a jester dolls left arm.")
	doSendMagicEffect(getCreaturePosition(cid), 12)
	setPlayerStorageValue(cid,2351,1)
elseif item.uid == 2352 and getPlayerStorageValue(cid,2352) == -1 then
	doPlayerAddItem(cid,9698,1)
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a jester dolls right leg.")
	doSendMagicEffect(getCreaturePosition(cid), 12)
	setPlayerStorageValue(cid,2352,1)
elseif item.uid == 2353 and getPlayerStorageValue(cid,2353) == -1 then
	doPlayerAddItem(cid,9699,1)
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a jester dolls left leg.")
	doSendMagicEffect(getCreaturePosition(cid), 12)
	setPlayerStorageValue(cid,2353,1)
else
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "There is nothing here.")
end

end