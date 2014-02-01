local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_CARNIPHILA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLEARTH)

function onGetFormulaValues(cid, level, maglevel)
	local min = -(((level/5)+(maglevel * 4.5 + 0.3) + 35)) -- * 4.5 + 0.3) + 35))
	local max = -(((level/5)+(maglevel * 7.3 - 0.1) + 55)) -- * 7.3 - 0.1) + 55))
	return min, max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")
function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end