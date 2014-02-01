function onUse(cid, item)
	statue1 = {x=973, y=1134, z=8, stackpos=1}
	statue2 = {x=986, y=1143, z=7, stackpos=1}
	statue3 = {x=966, y=1143, z=7, stackpos=1}
	coffinPos = {x=954, y=1149, z=8, stackpos=1}

	getStatue1 = getThingfromPos(statue1)
	getStatue2 = getThingfromPos(statue2)
	getStatue3 = getThingfromPos(statue3)
	getCoffin = getThingfromPos(coffinPos)
	if item.itemid == 3697 then
		doTransformItem(item.uid,3698)
	elseif item.itemid == 3698 then
		doTransformItem(item.uid,3697)
	elseif item.itemid == 3699 then
		doTransformItem(item.uid,3700)
	elseif item.itemid == 3700 then
		doTransformItem(item.uid,3699)
	end
	changeCoffin(cid)
	return true
end

function changeCoffin(cid)
	statue1 = {x=973, y=1134, z=8, stackpos=1}
	statue2 = {x=986, y=1143, z=7, stackpos=1}
	statue3 = {x=966, y=1143, z=7, stackpos=1}
	coffinPos = {x=954, y=1149, z=8, stackpos=1}

	getStatue1 = getThingfromPos(statue1)
	getStatue2 = getThingfromPos(statue2)
	getStatue3 = getThingfromPos(statue3)
	getCoffin = getThingfromPos(coffinPos)
	if getStatue1.itemid ==  3698 and getStatue2.itemid ==  3698 and getStatue3.itemid ==  3698 then
		doTransformItem(getCoffin.uid,7525)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You hear a click from somewhere nearby.')
	else
		doTransformItem(getCoffin.uid,7520)
	end
end