dofile("./config.lua")

function onDeath(cid, corpse, killer)
	doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You are dead.")
	if getPlayerStorageValue(cid,2401) == 1 then
		setPlayerStorageValue(cid,2401,3) -- Died in task boss room
		if getPlayerStorageValue(cid,2381) == 1 then -- Lump
			setGlobalStorageValue(2391,-1) -- 10 min timer back to 0
			stopEvent(lumpTimer)
		elseif getPlayerStorageValue(cid,2381) == 2 then -- Troll Boss
			setGlobalStorageValue(2392,-1) -- 10 min timer back to 0
			stopEvent(glorgorTimer)
		elseif getPlayerStorageValue(cid,2381) == 3 then -- Ape Boss
			setGlobalStorageValue(2393,-1) -- 10 min timer back to 0
			stopEvent(scatTimer)
		elseif getPlayerStorageValue(cid,2381) == 4 then -- Dragon Boss
			setGlobalStorageValue(2394,-1) -- 10 min timer back to 0
			stopEvent(puffTimer)
		elseif getPlayerStorageValue(cid,2381) == 5 then -- Mino Boss
			setGlobalStorageValue(2395,-1) -- 10 min timer back to 0
			stopEvent(udderTimer)
		elseif getPlayerStorageValue(cid,2381) == 6 then -- Mutant Boss
			setGlobalStorageValue(2396,-1) -- 10 min timer back to 0
			stopEvent(esmerTimer)
		elseif getPlayerStorageValue(cid,2381) == 7 then -- DL Boss
			setGlobalStorageValue(2397,-1) -- 10 min timer back to 0
			stopEvent(esmerTimer)
		elseif getPlayerStorageValue(cid,2381) == 8 then -- Hero Boss
			setGlobalStorageValue(2398,-1) -- 10 min timer back to 0
			stopEvent(esmerTimer)
		elseif getPlayerStorageValue(cid,2381) == 9 then -- Hydra Boss
			setGlobalStorageValue(2399,-1) -- 10 min timer back to 0
			stopEvent(esmerTimer)
		elseif getPlayerStorageValue(cid,2381) == 10 then -- Demon Boss
			setGlobalStorageValue(2424,-1) -- 10 min timer back to 0
			stopEvent(thunderTimer)
		elseif getPlayerStorageValue(cid,2381) == 11 then -- Draken Boss
			setGlobalStorageValue(2425,-1) -- 10 min timer back to 0
			stopEvent(drekTimer)
		elseif getPlayerStorageValue(cid,2381) == 12 then -- Bog Boss
			setGlobalStorageValue(2614,-1) -- 10 min timer back to 0
			stopEvent(essTimer)
		end
	end
	if deathListEnabled == "yes" then
		if sqlType == "mysql" then
			env = luasql.mysql()
			sql = env:connect(mysqlDatabase, mysqlUser, mysqlPass, mysqlHost, mysqlPort)
		else -- sqlite
			env = luasql.sqlite3()
			sql = env:connect(sqliteDatabase)
		end
		local byPlayer = 0
		if killer == 0 then
			killerName = "field item"
		else
			if isPlayer(killer) == TRUE then
				byPlayer = 1
			end
			killerName = getCreatureName(killer)
		end
		sql:execute("INSERT INTO `player_deaths` (`player_id`, `time`, `level`, `killed_by`, `is_player`) VALUES (" .. getPlayerGUID(cid) .. ", " .. os.time() .. ", " .. getPlayerLevel(cid) .. ", '" .. escapeString(killerName) .. "', " .. byPlayer .. ");")
		local result = sql:execute("SELECT `player_id` FROM `player_deaths` WHERE `player_id` = " .. getPlayerGUID(cid) .. ";")
		local deathRecords = numRows(result)
		if sqlType == "mysql" then
			while deathRecords > maxDeathRecords do
				delete = sql:execute("DELETE FROM `player_deaths` WHERE `player_id` = " .. getPlayerGUID(cid) .. " ORDER BY `time` LIMIT 1;")
				deathRecords = deathRecords - 1
			end
		else
			while deathRecords > maxDeathRecords do
				delete = sql:execute("DELETE FROM `player_deaths` WHERE `rowid` = (SELECT `rowid` FROM `player_deaths` WHERE `player_id` = " .. getPlayerGUID(cid) .. " ORDER BY `time` LIMIT 1);")
				deathRecords = deathRecords - 1
			end
		end
		sql:close()
		env:close()
	end
end