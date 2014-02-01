function onCastSpell(cid, var)
	local summons = getCreatureSummons(cid) -- get player pet (if out)
	-- heal pet for 20% of HP with a cost of 20% player mana
	if table.maxn(summons) > 0 then -- check if player has pet out.
		local pet = getCreatureSummons(cid)[1] -- get pet
		local petPos = getCreaturePosition(pet) -- get pet position
		local playerPos = getCreaturePosition(cid) -- get player position
		local healAmount = (getCreatureMaxHealth(pet) * .2) -- set amount to heal (20%)
		local spellCost = (getCreatureMaxMana(cid) * .15) -- set spell mana cost (15%)
		local playerMana = getCreatureMana(cid) -- get players current mana
		local effect = CONST_ME_MAGIC_GREEN -- set spell effect
		if playerMana >= spellCost then
			doCreatureAddHealth(pet, healAmount, true) -- heal pet
			doCreatureAddMana(cid, -spellCost) -- remove player mana
			doSendMagicEffect(petPos, effect) -- send spell effect
			doSendAnimatedText(petPos, healAmount, TEXTCOLOR_BLUE) -- show heal amount
			return true
		else
			local effect = CONST_ME_POFF -- set spell effect
			doSendMagicEffect(playerPos, effect) -- send spell effect
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "You do not have enough mana.")
			return false
		end
	end
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "You do not have a pet.")
	return false
end