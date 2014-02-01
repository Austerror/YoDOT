--taming monsters by ruda from otland
local function tameMonster(cid, item, itemEx, tame, run, broken)
	n = math.random(100)
	if n <= broken then
		doCreatureSay(cid, "You did not manage to feed the donkey enough apple slices.", TALKTYPE_ORANGE_1)
		doRemoveItem(item.uid)
	elseif n > broken and n <= (tame+broken) then
		doRemoveItem(item.uid)
		doCreatureSay(cid, "Munching a large pile of apple slices tamed the donkey.", TALKTYPE_ORANGE_1)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Munching a large pile of apple slices tamed the donkey.")
		return true
	elseif n > (tame+broken) and n <= (tame+broken+run) then
		doCreatureSay(cid, "The donkey transformation suddenly wears off.", TALKTYPE_ORANGE_1)
		doRemoveCreature(itemEx.uid)
	else
		doCreatureSay(cid, "Try again", TALKTYPE_ORANGE_1)
	end
	return false
end


function onUse(cid, item, fromPosition, itemEx, toPosition)
	isDonkey = getCreatureOutfit(itemEx.uid)
	if isMonster(itemEx.uid) then
		if isDonkey.lookType == 399 then
			if not getPlayerMount(cid, 13) then
				if tameMonster(cid, item, itemEx, 50, 30, 10) then
					doSendMagicEffect(fromPosition, CONST_ME_MAGIC_BLUE)
					doRemoveCreature(itemEx.uid)
					doPlayerAddMount(cid, 13)
				else
					doSendMagicEffect(toPosition, CONST_ME_POFF)
				end
			end
		end
	end
	return true
end