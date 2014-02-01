local config = {
	savePlayersOnAdvance = true
}

function onAdvance(cid, skill, oldLevel, newLevel)
	if(config.savePlayersOnAdvance) then
		doPlayerSave(cid, true)
		
		if (skill == SKILL__LEVEL) and (oldLevel < newLevel) then
			-- Restore Player HP and Mana to Max --
			fullMana = getCreatureMaxMana(cid)
			currentMana = getCreatureMana(cid)
			fullHP = getCreatureMaxHealth(cid)
			currentHP = getCreatureHealth(cid)
			manaToAdd = (fullMana - currentMana)
			hpToAdd = (fullHP - currentHP)
			doCreatureAddMana(cid, manaToAdd)
			doCreatureAddHealth(cid, hpToAdd)
			-- ********************************* --
		end
	end

	return true
end
