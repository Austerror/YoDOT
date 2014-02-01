function onUse(cid, item, fromPosition, itemEx, toPosition)

	local gcooPos = {x=1296,y=942,z=7}
	local playerPos = getCreaturePosition(cid)
	if playerPos.x == gcooPos.x and playerPos.y == gcooPos.y and playerPos.z == gcooPos.z then
		doTransformItem(item.uid, 13938)
		doSendMagicEffect(getCreaturePosition(cid), 12)
	end
	return TRUE
end