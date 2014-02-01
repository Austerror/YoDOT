local constructionKits = {
	[3901] = 1650, -- Wooden Chair
	[3902] = 1658,
	[3903] = 1666,
	[3904] = 1670,
	[3905] = 3813,
	[3906] = 3817,
	[3907] = 3821,
	[3908] = 1619,
	[3909] = 1614,
	[3910] = 1615,
	[3911] = 1616,
	[3912] = 2601,
	[3913] = 3805,
	[3914] = 3807,
	[3915] = 1714,
	[3916] = 1724,
	[3917] = 1728,
	[3918] = 1732,
	[3919] = 3809,
	[3920] = 3811,
	[3921] = 2084,
	[3922] = 2094,
	[3923] = 2098,
	[3924] = 2064,
	[3925] = 1674,
	[3926] = 2080,
	[3927] = 1442,
	[3928] = 1446,
	[3929] = 2034,
	[3930] = 1447,
	[3931] = 2101,
	[3932] = 1774,

	[3934] = 2117,
	[3935] = 2581,
	[3936] = 3832,
	[3937] = 1775,
	[3938] = 1750,
	[5086] = 5056,
	[5087] = 5055,
	[5088] = 5046,
	[6114] = 6109,
	[6115] = 6111,
	[6372] = 6356,
	[6373] = 6371,
	[7503] = 1750,
	[8692] = 8689,
	[9974] = 9975,
	[11120] = 11121,
	[11124] = 11125,
	[11126] = 11127, -- Lizard Weapon Rack
	[11127] = 11123,
	[11133] = 11129,
	[11199] = 11197,
	[11205] = 11203
}
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if fromPosition.x == CONTAINER_POSITION then
		doPlayerSendCancel(cid, "Put the construction kit on the ground first.")
	elseif constructionKits[item.itemid] ~= nil then
		if getHouseFromPos(getPlayerPosition(cid)) >= 1 then
			doTransformItem(item.uid, constructionKits[item.itemid])
			doSendMagicEffect(fromPosition, CONST_ME_POFF)
		else
			doPlayerSendCancel(cid, "You can only open this in a house.")
			return FALSE
		end
	else
		return FALSE
	end
	return TRUE
end