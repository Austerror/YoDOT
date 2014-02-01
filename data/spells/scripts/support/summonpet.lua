function round(num, idp)
	local mult = 10^(idp or 0)
	return math.floor(num * mult + 0.5) / mult
end

function onCastSpell(cid, var)
	local farAwayPos = {x = 50, y = 50, z = 7}
	local petNames = {
		'tamed wolf',
		'tamed bear',
		'tamed boar',
		'tamed husky',
		'tamed winter wolf'
	}
	local petLooks = {
		[1] = {lookType = 27, lookHead = 38, lookBody = 114, lookLegs = 107, lookFeet = 114, lookTypeEx = 0, lookAddons = 0},
		[2] = {lookType = 16, lookHead = 38, lookBody = 114, lookLegs = 107, lookFeet = 114, lookTypeEx = 0, lookAddons = 0},
		[3] = {lookType = 380, lookHead = 38, lookBody = 114, lookLegs = 107, lookFeet = 114, lookTypeEx = 0, lookAddons = 0},
		[4] = {lookType = 258, lookHead = 38, lookBody = 114, lookLegs = 107, lookFeet = 114, lookTypeEx = 0, lookAddons = 0},
		[5] = {lookType = 52, lookHead = 38, lookBody = 114, lookLegs = 107, lookFeet = 114, lookTypeEx = 0, lookAddons = 0}
	}
	local petLevel = round((getPlayerLevel(cid) / 25), 0) + 1
	local RANDOM = math.random(#petNames)
	local effect = CONST_ME_MAGIC_RED
	local summons = getCreatureSummons(cid)
	local playerHealth = getCreatureMaxHealth(cid)
	local petHealth = (playerHealth * .8)
	if table.maxn(summons) <= 0 then
		local pet = doCreateMonster('level' .. petLevel .. 'pet', farAwayPos)
		setCreatureName(pet, getCreatureName(cid) .. "s " .. petNames[RANDOM], getCreatureName(cid) .. "s level " .. petLevel .. " pet")
		setCreatureMaxHealth(pet, petHealth)
		doCreatureAddHealth(pet, petHealth, true)
		doCreatureChangeOutfit(pet, petLooks[RANDOM])
		doChangeSpeed(pet, (getCreatureSpeed(cid)*.6))
		doTeleportThing(pet, getCreaturePosition(cid))
		doConvinceCreature(cid, pet)
		doSendMagicEffect(getCreaturePosition(cid), effect)
		return true
	end
	return false
end