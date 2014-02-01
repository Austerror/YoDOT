function onUse(cid, item, fromPosition, itemEx, toPosition)
		local playerCap = getPlayerFreeCap(cid)
		local playerVoc = getPlayerVocation(cid)
   		queststatus = getPlayerStorageValue(cid,2346)
   		if queststatus == -1 then
			if playerVoc == 1 or playerVoc == 5 then -- Sorc (WoI)
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a Wand of Inferno.")
				doPlayerAddItem(cid, 2187, 1)
			elseif playerVoc == 2 or playerVoc == 6 then -- Druid (Hailstorm Rod)
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a Hailstorm Rod.")
				doPlayerAddItem(cid, 2183, 1)
			elseif playerVoc == 3 or playerVoc == 7 then -- Pally (Elvish Bow)
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found an Elvish Bow.")
				doPlayerAddItem(cid, 7438, 1)
			elseif (getPlayerSkill(cid, 1) > getPlayerSkill(cid, 2)) and (getPlayerSkill(cid, 1) > getPlayerSkill(cid, 3)) then -- Club Fighter (Skull Staff)
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a Skull Staff.")
				doPlayerAddItem(cid, 2436, 1)
			elseif (getPlayerSkill(cid, 2) > getPlayerSkill(cid, 1)) and (getPlayerSkill(cid, 2) > getPlayerSkill(cid, 3)) then -- Sword Fighter (Bright Sword)
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a Bright Sword.")
				doPlayerAddItem(cid, 2407, 1)
			elseif (getPlayerSkill(cid, 3) > getPlayerSkill(cid, 1)) and (getPlayerSkill(cid, 3) > getPlayerSkill(cid, 2)) then -- Axe Fighter (Knight Axe)
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a Knight Axe.")
				doPlayerAddItem(cid, 2430, 1)
			end
			doSendMagicEffect(getCreaturePosition(cid), 12)
   			setPlayerStorageValue(cid,2346,1)
   		else
   			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"It is empty.")
   		end
end