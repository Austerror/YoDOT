function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	if getPlayerItemCount(cid, 2349) >= 1 then
	
	else
		doTeleportThing(cid, lastPosition, true)
	end
	return true
end
