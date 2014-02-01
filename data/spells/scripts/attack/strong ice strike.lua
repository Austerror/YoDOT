local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_ICEATTACK)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLICE)

function onGetFormulaValues(cid, level, maglevel)
	local min = -(((level/5)+(maglevel * 2.8 - 0.6) + 16)) -- * 2.8 - 0.6) + 16))
	local max = -(((level/5)+(maglevel * 4.4 - 0.4) + 28)) -- * 4.4 - 0.4) + 28))
	return min, max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")
function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end