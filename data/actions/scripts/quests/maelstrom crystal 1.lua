function onUse(cid, item, fromPosition, itemEx, toPosition)
	crystalColumnPos = {x = 1065, y = 1066, z = 15, stackpos=1}
	crystalColumnThing = getThingFromPos(crystalColumnPos)
	if item.itemid == 8638 and crystalColumnThing.itemid == 9779 then
		doRemoveItem(crystalColumnThing.uid)
		doSendMagicEffect(toPosition, 12)
		addEvent(remakeColumn, 60000)
	end
	return true
end

function remakeColumn()
	crystalColumnPos = {x = 1065, y = 1066, z = 15}
	doCreateItem(9779, crystalColumnPos)
	return true
end