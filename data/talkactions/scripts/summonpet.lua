function onSay(cid, words, param, channel)
	local pets = {
		'tamed bear',
		'tamed wolf',
		'tamed boar'
	}
	local RANDOM = math.random(#pets)
	effect = CONST_ME_MAGIC_RED
	local summons = getCreatureSummons(cid)
	local playerHealth = getCreatureMaxHealth(cid)
	local petHealth = (playerHealth * .6)
	local playerVocation = getPlayerVocation(cid)
	if playerVocation == 3 or playerVocation == 7 or playerVocation == 11 then
		if table.maxn(summons) <= 0 then
			doSummonMonster(cid, pets[RANDOM])
			--doSummonMonster(cid, 'tamed wolf')
			doSendMagicEffect(getCreaturePosition(cid), effect)
			pk = getCreatureSummons(cid)[1]
			setCreatureMaxHealth(pk, petHealth)
			doCreatureAddHealth(pk, petHealth, true)
			--setCreatureName(pk, getCreatureName(pk) .. " <" .. getCreatureName(cid) .. "'s pet>")
		end
	end
	return true
end