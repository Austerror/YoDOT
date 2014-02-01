local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, true)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
setCombatParam(combat, COMBAT_PARAM_USECHARGES, true)

function onGetFormulaValues(cid, level, skill, attack, factor)
	local skillTotal, levelTotal = skill * attack, level / 5
	return -(((skillTotal * 0.02 + 0.4) + 4) + (levelTotal)), -(((skillTotal * 0.04 + 0.6) + 9) + (levelTotal))
end
-- 	return -(((skillTotal * 0.02 + 0.4) + 4) + (levelTotal)), -(((skillTotal * 0.04 + 0.6) + 9) + (levelTotal))
-- Integer divisor: 2
setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")
function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end