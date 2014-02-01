function onStepIn(cid, item, position, fromPosition)
	if item.actionid == 20132 then
		teleToPos = {x = 1035, y = 1177, z = 7}
	elseif item.actionid == 20133 then
		teleToPos = {x = 1032, y = 1085, z = 7}
	elseif item.actionid == 20134 then
		teleToPos = {x = 1076, y = 1182, z = 7}
	elseif item.actionid == 20135 then
		teleToPos = {x = 1064, y = 1195, z = 7}
	elseif item.actionid == 20136 then
		teleToPos = {x = 1158, y = 1186, z = 7}
	elseif item.actionid == 20137 then
		teleToPos = {x = 1104, y = 1176, z = 7}
	end
	doTeleportThing(cid, teleToPos)
	doSendMagicEffect(fromPosition, 10)
	doSendMagicEffect(teleToPos, 10)
	return true
end