local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, TRUE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ETHEREALSPEAR)

function onGetFormulaValues(cid, level, skill, attack, factor)
	local skillTotal, levelTotal = skill * attack, level / 5
	return -(((skillTotal * 0.011 - 1.46) + 0) + (levelTotal)), -(((skillTotal * 0.0155 - 0.73) + 5) + (levelTotal))
end
setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
return doCombat(cid, combat, var)
end