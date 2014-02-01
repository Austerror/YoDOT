function onKill(cid, target, lasthit)
	--local tmp = getTileInfo(getCreaturePosition(cid))
	if(getTileInfo(getThingPos(cid)).hardcore) then
		if (getCreatureHealth(target) < 1) then
			addEvent(doBroadcastMessage, 150, "[Arena]: " .. getCreatureName(cid) .. " just wiped the floor with " .. getCreatureName(target) .. ". Who\'s next?", MESSAGE_STATUS_DEFAULT)
			db.executeQuery("INSERT INTO `arena_deaths` (`player_id`, `killer_id`, `date`) VALUES (" .. getPlayerGUID(target) .. ", " .. getPlayerGUID(cid) .. ", " .. os.time() .. ");")
		end
	
	end
	return true
end