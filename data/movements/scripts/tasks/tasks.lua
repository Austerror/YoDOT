function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)

	rotwormBossIn = {x = 1060, y = 1048, z = 9}
	rotwormBossOut = {x = 1073, y = 1049, z = 9}
	rotwormBossSpawn = {x = 1062, y = 1051, z = 9}
	glorgorBossIn = {x = 1081, y = 1050, z = 8}
	glorgorBossOut = {x = 1092, y = 1047, z = 8}
	glorgorBossSpawn = {x = 1080, y = 1045, z = 8}
	scatBossIn = {x = 1145, y = 1064, z = 8}
	scatBossOut = {x = 1156, y = 1064, z = 8}
	scatBossSpawn = {x = 1140, y = 1065, z = 8}
	puffBossIn = {x = 1050, y = 1104, z = 5}
	puffBossOut = {x = 1045, y = 1107, z = 4}
	puffBossSpawn = {x = 1052, y = 1107, z = 5}
	udderBossIn = {x = 1108, y = 1053, z = 7}
	udderBossOut = {x = 1119, y = 1064, z = 7}
	udderBossSpawn = {x = 1111, y = 1057, z = 7}
	esmerBossIn = {x = 1047, y = 1093, z = 7}
	esmerBossOut = {x = 1047, y = 1092, z = 6}
	esmerBossSpawn = {x = 1047, y = 1098, z = 7}
	barneyBossIn = {x = 1062, y = 1131, z = 6}
	barneyBossOut = {x = 1057, y = 1117, z = 5}
	barneyBossSpawn = {x = 1054, y = 1130, z = 6}
	grohlBossIn = {x = 1098, y = 1139, z = 4}
	grohlBossOut = {x = 1117, y = 1137, z = 5}
	grohlBossSpawn = {x = 1095, y = 1144, z = 4}
	manyBossIn = {x = 1191, y = 1020, z = 7}
	manyBossOut = {x = 1183, y = 1026, z = 6}
	manyBossSpawn = {x = 1192, y = 1025, z = 7}
	thunderBossIn = {x = 1112, y = 1055, z = 11}
	thunderBossOut = {x = 1085, y = 1060, z = 11}
	thunderBossSpawn = {x = 1102, y = 1054, z = 11}
	drekBossIn = {x = 1202, y = 1112, z = 8}
	drekBossOut = {x = 1212, y = 1125, z = 8}
	drekBossSpawn = {x = 1207, y = 1104, z = 8}
	bogBossIn = {x = 1089, y = 993, z = 9}
	bogBossOut = {x = 1112, y = 993, z = 10}
	bogBossSpawn = {x = 1095, y = 985, z = 9}
	bossTaskStep = getPlayerStorageValue(cid,2380) -- 0 - Not on boss, 1 - On Boss, 2 - Boss Killed.
	whichBoss = getPlayerStorageValue(cid,2381) -- Which Boss (1=rot,2=troll,3=ape,4=dragon,5=mino,6=mutant,7=DL,8=hero,9=hydra, 10=Demon, 11=Draken, 12=Bog Raider)
	lumpTimerSV = getGlobalStorageValue(2391)
	glorgorTimerSV = getGlobalStorageValue(2392)
	scatTimerSV = getGlobalStorageValue(2393)
	puffTimerSV = getGlobalStorageValue(2394)
	udderTimerSV = getGlobalStorageValue(2395)
	esmerTimerSV = getGlobalStorageValue(2396)
	barneyTimerSV = getGlobalStorageValue(2397)
	grohlTimerSV = getGlobalStorageValue(2398)
	manyTimerSV = getGlobalStorageValue(2399)
	thunderTimerSV = getGlobalStorageValue(2424)
	drekTimerSV = getGlobalStorageValue(2425)
	essTimerSV = getGlobalStorageValue(2614)
	bosses = {
		[2382] = {1, "Lump", {x = 1060, y = 1048, z = 9}, {x = 1073, y = 1049, z = 9}, {x = 1062, y = 1051, z = 9},2391},
		[2383] = {2, "Glorgor", {x = 1081, y = 1050, z = 8}, {x = 1092, y = 1047, z = 8}, {x = 1080, y = 1045, z = 8},2392}
		}
		

	if(lastPosition.x == 0) then -- player just logged in
		lastPosition = getTownTemplePosition(getPlayerTown(cid))
		doSendMagicEffect(lastPosition, CONST_ME_TELEPORT)
	end
-- Portals In --
	if bossTaskStep == 1 and whichBoss == 1 and item.actionid == 2382 then -- Rotworm Boss
		if lumpTimerSV <= os.time()-(60*10) then-- Ten minutes has passed since boss was spawned or player logged/died in room, ok to clean room.
			lumpsHere = getCreatureByName("Lump")
			if lumpsHere ~= false and isMonster(lumpsHere) == true then -- Lump is still spawned
				doRemoveCreature(lumpsHere)
			end
			doTeleportThing(cid, rotwormBossIn)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have ten minutes to kill Lump.")
			setPlayerStorageValue(cid,2401,1) -- is in boss room
			combatant = cid
			setGlobalStorageValue(2391,os.time()) -- Lump Timer
			lumpEvent = addEvent(lumpTimer, 600000, {combatant = cid})
			doSummonCreature("Lump",rotwormBossSpawn)
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "There is already somebody in there.")
			doTeleportThing(cid, lastPosition, true)
		end
	elseif bossTaskStep == 1 and whichBoss == 2 and item.actionid == 2383 then -- Troll Boss
		if glorgorTimerSV <= os.time()-(60*10) then-- Ten minutes has passed since boss was spawned or player logged/died in room, ok to clean room.
			glorgorsHere = getCreatureByName("Glorgor")
			if glorgorsHere ~= false and isMonster(glorgorsHere) == true then -- Glorgor is still spawned
				doRemoveCreature(glorgorsHere)
			end
			doTeleportThing(cid, glorgorBossIn)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have ten minutes to kill Glorgor.")
			setPlayerStorageValue(cid,2401,1) -- is in boss room
			combatant = cid
			setGlobalStorageValue(2392,os.time()) -- Glorgor Timer
			glorgorEvent = addEvent(glorgorTimer, 600000, {combatant = cid})
			doSummonCreature("Glorgor",glorgorBossSpawn)
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "There is already somebody in there.")
			doTeleportThing(cid, lastPosition, true)
		end
	elseif bossTaskStep == 1 and whichBoss == 3 and item.actionid == 2384 then -- Ape Boss
		if scatTimerSV <= os.time()-(60*10) then-- Ten minutes has passed since boss was spawned or player logged/died in room, ok to clean room.
			scatsHere = getCreatureByName("Scat Fu")
			if scatsHere ~= false and isMonster(scatsHere) == true then -- Scat Fu is still spawned
				doRemoveCreature(scatsHere)
			end
			doTeleportThing(cid, scatBossIn)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have ten minutes to kill Scat Fu.")
			setPlayerStorageValue(cid,2401,1) -- is in boss room
			combatant = cid
			setGlobalStorageValue(2393,os.time()) -- Scat Timer
			scatEvent = addEvent(scatTimer, 600000, {combatant = cid})
			doSummonCreature("Scat Fu",scatBossSpawn)
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "There is already somebody in there.")
			doTeleportThing(cid, lastPosition, true)
		end
	elseif bossTaskStep == 1 and whichBoss == 4 and item.actionid == 2385 then -- Dragon Boss
		if puffTimerSV <= os.time()-(60*10) then-- Ten minutes has passed since boss was spawned or player logged/died in room, ok to clean room.
			puffsHere = getCreatureByName("Puff")
			if puffsHere ~= false and isMonster(puffsHere) == true then -- Puff is still spawned
				doRemoveCreature(puffsHere)
			end
			doTeleportThing(cid, puffBossIn)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have ten minutes to kill Puff.")
			setPlayerStorageValue(cid,2401,1) -- is in boss room
			combatant = cid
			setGlobalStorageValue(2394,os.time()) -- Puff Timer
			puffEvent = addEvent(puffTimer, 600000, {combatant = cid})
			doSummonCreature("Puff",puffBossSpawn)
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "There is already somebody in there.")
			doTeleportThing(cid, lastPosition, true)
		end
	elseif bossTaskStep == 1 and whichBoss == 5 and item.actionid == 2386 then -- Mino Boss
		if udderTimerSV <= os.time()-(60*10) then-- Ten minutes has passed since boss was spawned or player logged/died in room, ok to clean room.
			uddersHere = getCreatureByName("Udder")
			if uddersHere ~= false and isMonster(uddersHere) == true then -- Udder is still spawned
				doRemoveCreature(uddersHere)
			end
			doTeleportThing(cid, udderBossIn)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have ten minutes to kill Udder.")
			setPlayerStorageValue(cid,2401,1) -- is in boss room
			combatant = cid
			setGlobalStorageValue(2395,os.time()) -- Udder Timer
			udderEvent = addEvent(udderTimer, 600000, {combatant = cid})
			doSummonCreature("Udder",udderBossSpawn)
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "There is already somebody in there.")
			doTeleportThing(cid, lastPosition, true)
		end
	elseif bossTaskStep == 1 and whichBoss == 6 and item.actionid == 2387 then -- Mutant Boss
		if esmerTimerSV <= os.time()-(60*10) then-- Ten minutes has passed since boss was spawned or player logged/died in room, ok to clean room.
			esmersHere = getCreatureByName("Esmeralda")
			if esmersHere ~= false and isMonster(esmersHere) == true then -- Esmeralda is still spawned
				doRemoveCreature(esmersHere)
			end
			doTeleportThing(cid, esmerBossIn)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have ten minutes to kill Esmeralda.")
			setPlayerStorageValue(cid,2401,1) -- is in boss room
			combatant = cid
			setGlobalStorageValue(2396,os.time()) -- Esmer Timer
			esmerEvent = addEvent(esmerTimer, 600000, {combatant = cid})
			doSummonCreature("Esmeralda",esmerBossSpawn)
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "There is already somebody in there.")
			doTeleportThing(cid, lastPosition, true)
		end
	elseif bossTaskStep == 1 and whichBoss == 7 and item.actionid == 2388 then -- DL Boss
		if barneyTimerSV <= os.time()-(60*10) then-- Ten minutes has passed since boss was spawned or player logged/died in room, ok to clean room.
			barneysHere = getCreatureByName("Barney")
			if barneysHere ~= false and isMonster(barneysHere) == true then -- Barney is still spawned
				doRemoveCreature(barneysHere)
			end
			doTeleportThing(cid, barneyBossIn)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have ten minutes to kill Barney.")
			setPlayerStorageValue(cid,2401,1) -- is in boss room
			combatant = cid
			setGlobalStorageValue(2397,os.time()) -- Barney Timer
			barneyEvent = addEvent(barneyTimer, 600000, {combatant = cid})
			doSummonCreature("Barney",barneyBossSpawn)
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "There is already somebody in there.")
			doTeleportThing(cid, lastPosition, true)
		end
	elseif bossTaskStep == 1 and whichBoss == 8 and item.actionid == 2389 then -- Hero Boss
		if grohlTimerSV <= os.time()-(60*10) then-- Ten minutes has passed since boss was spawned or player logged/died in room, ok to clean room.
			grohlsHere = getCreatureByName("Grohl")
			if grohlsHere ~= false and isMonster(grohlsHere) == true then -- Grohl is still spawned
				doRemoveCreature(grohlsHere)
			end
			doTeleportThing(cid, grohlBossIn)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have ten minutes to kill Grohl.")
			setPlayerStorageValue(cid,2401,1) -- is in boss room
			combatant = cid
			setGlobalStorageValue(2398,os.time()) -- Grohl Timer
			grohlEvent = addEvent(grohlTimer, 600000, {combatant = cid})
			doSummonCreature("Grohl",grohlBossSpawn)
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "There is already somebody in there.")
			doTeleportThing(cid, lastPosition, true)
		end
	elseif bossTaskStep == 1 and whichBoss == 9 and item.actionid == 2390 then -- Hydra Boss
		if manyTimerSV <= os.time()-(60*10) then-- Ten minutes has passed since boss was spawned or player logged/died in room, ok to clean room.
			manysHere = getCreatureByName("The Many")
			if manysHere ~= false and isMonster(manysHere) == true then -- The Many is still spawned
				doRemoveCreature(manysHere)
			end
			doTeleportThing(cid, manyBossIn)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have ten minutes to kill The Many.")
			setPlayerStorageValue(cid,2401,1) -- is in boss room
			combatant = cid
			setGlobalStorageValue(2399,os.time()) -- The Many Timer
			manyEvent = addEvent(manyTimer, 600000, {combatant = cid})
			doSummonCreature("The Many",manyBossSpawn)
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "There is already somebody in there.")
			doTeleportThing(cid, lastPosition, true)
		end
	elseif bossTaskStep == 1 and whichBoss == 10 and item.actionid == 2423 then -- Demon Boss
		if thunderTimerSV <= os.time()-(60*10) then-- Ten minutes has passed since boss was spawned or player logged/died in room, ok to clean room.
			thundersHere = getCreatureByName("Thunderstorm")
			if thundersHere ~= false and isMonster(thundersHere) == true then -- Thunderstorm is still spawned
				doRemoveCreature(thundersHere)
			end
			doTeleportThing(cid, thunderBossIn)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have ten minutes to kill Thunderstorm.")
			setPlayerStorageValue(cid,2401,1) -- is in boss room
			combatant = cid
			setGlobalStorageValue(2424,os.time()) -- Thunderstorm Timer
			thunderEvent = addEvent(thunderTimer, 600000, {combatant = cid})
			doSummonCreature("Thunderstorm",thunderBossSpawn)
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "There is already somebody in there.")
			doTeleportThing(cid, lastPosition, true)
		end
	elseif bossTaskStep == 1 and whichBoss == 11 and item.actionid == 2426 then -- Draken Boss
		if drekTimerSV <= os.time()-(60*10) then-- Ten minutes has passed since boss was spawned or player logged/died in room, ok to clean room.
			dreksHere = getCreatureByName("Drek Thar")
			if dreksHere ~= false and isMonster(dreksHere) == true then -- Drek Thar is still spawned
				doRemoveCreature(dreksHere)
			end
			doTeleportThing(cid, drekBossIn)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have ten minutes to kill Drek Thar.")
			setPlayerStorageValue(cid,2401,1) -- is in boss room
			combatant = cid
			setGlobalStorageValue(2425,os.time()) -- Drek Thar Timer
			drekEvent = addEvent(drekTimer, 600000, {combatant = cid})
			doSummonCreature("Drek Thar",drekBossSpawn)
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "There is already somebody in there.")
			doTeleportThing(cid, lastPosition, true)
		end
	elseif bossTaskStep == 1 and whichBoss == 12 and item.actionid == 2613 then -- Bog Raider Boss
		if essTimerSV <= os.time()-(60*10) then-- Ten minutes has passed since boss was spawned or player logged/died in room, ok to clean room.
			esssHere = getCreatureByName("Essbend")
			if esssHere ~= false and isMonster(esssHere) == true then -- Essbend is still spawned
				doRemoveCreature(esssHere)
			end
			doTeleportThing(cid, bogBossIn)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have ten minutes to kill Essbend.")
			setPlayerStorageValue(cid,2401,1) -- is in boss room
			combatant = cid
			setGlobalStorageValue(2614,os.time()) -- Essbend Timer
			essEvent = addEvent(essTimer, 600000, {combatant = cid})
			doSummonCreature("Essbend",bogBossSpawn)
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "There is already somebody in there.")
			doTeleportThing(cid, lastPosition, true)
		end		
	-- Else, Step Back
	elseif item.actionid ~= 2400 then
		doTeleportThing(cid, lastPosition, true)
	end
	
-- Portals Out --
	if whichBoss == 1 and item.actionid == 2400 then -- Player leaving area via portal
		lumpsHere = getCreatureByName("Lump")
		if lumpsHere ~= false and isMonster(lumpsHere) == true then -- Lump is still spawned
			doRemoveCreature(lumpsHere)
		end
		setPlayerStorageValue(cid,2401,-1) -- is in boss room
		setGlobalStorageValue(2391,-1) -- Lump 10 min timer back to 0
		stopEvent(lumpEvent)
		doTeleportThing(cid, rotwormBossOut)
	elseif whichBoss == 2 and item.actionid == 2400 then -- Player leaving area via portal
		glorgorsHere = getCreatureByName("Glorgor")
		if glorgorsHere ~= false and isMonster(glorgorsHere) == true then -- Glorgor is still spawned
			doRemoveCreature(glorgorsHere)
		end
		setPlayerStorageValue(cid,2401,-1) -- is in boss room
		setGlobalStorageValue(2392,-1) -- Glorgor 10 min timer back to 0
		stopEvent(glorgorEvent)
		doTeleportThing(cid, glorgorBossOut)
	elseif whichBoss == 3 and item.actionid == 2400 then -- Player leaving area via portal
		scatsHere = getCreatureByName("Scat Fu")
		if scatsHere ~= false and isMonster(scatsHere) == true then -- Scat Fu is still spawned
			doRemoveCreature(scatsHere)
		end
		setPlayerStorageValue(cid,2401,-1) -- is in boss room
		setGlobalStorageValue(2393,-1) -- Scat Fu 10 min timer back to 0
		stopEvent(scatEvent)
		doTeleportThing(cid, scatBossOut)
	elseif whichBoss == 4 and item.actionid == 2400 then -- Player leaving area via portal
		puffsHere = getCreatureByName("Puff")
		if puffsHere ~= false and isMonster(puffsHere) == true then -- Puff is still spawned
			doRemoveCreature(puffsHere)
		end
		setPlayerStorageValue(cid,2401,-1) -- is in boss room
		setGlobalStorageValue(2394,-1) -- Puff 10 min timer back to 0
		stopEvent(puffEvent)
		doTeleportThing(cid, puffBossOut)
	elseif whichBoss == 5 and item.actionid == 2400 then -- Player leaving area via portal
		uddersHere = getCreatureByName("Udder")
		if uddersHere ~= false and isMonster(uddersHere) == true then -- Udder is still spawned
			doRemoveCreature(uddersHere)
		end
		setPlayerStorageValue(cid,2401,-1) -- is in boss room
		setGlobalStorageValue(2395,-1) -- Udder 10 min timer back to 0
		stopEvent(udderEvent)
		doTeleportThing(cid, udderBossOut)
	elseif whichBoss == 6 and item.actionid == 2400 then -- Player leaving area via portal
		esmersHere = getCreatureByName("Esmeralda")
		if esmersHere ~= false and isMonster(esmersHere) == true then -- Esmeralda is still spawned
			doRemoveCreature(esmersHere)
		end
		setPlayerStorageValue(cid,2401,-1) -- is in boss room
		setGlobalStorageValue(2396,-1) -- Esmeralda 10 min timer back to 0
		stopEvent(esmerEvent)
		doTeleportThing(cid, esmerBossOut)
	elseif whichBoss == 7 and item.actionid == 2400 then -- Player leaving area via portal
		barneysHere = getCreatureByName("Barney")
		if barneysHere ~= false and isMonster(barneysHere) == true then -- Barney is still spawned
			doRemoveCreature(barneysHere)
		end
		setPlayerStorageValue(cid,2401,-1) -- is in boss room
		setGlobalStorageValue(2397,-1) -- Barney 10 min timer back to 0
		stopEvent(barneyEvent)
		doTeleportThing(cid, barneyBossOut)
	elseif whichBoss == 8 and item.actionid == 2400 then -- Player leaving area via portal
		grohlsHere = getCreatureByName("Grohl")
		if grohlsHere ~= false and isMonster(grohlsHere) == true then -- Grohl is still spawned
			doRemoveCreature(grohlsHere)
		end
		setPlayerStorageValue(cid,2401,-1) -- is in boss room
		setGlobalStorageValue(2398,-1) -- Grohl 10 min timer back to 0
		stopEvent(grohlEvent)
		doTeleportThing(cid, grohlBossOut)
	elseif whichBoss == 9 and item.actionid == 2400 then -- Player leaving area via portal
		manysHere = getCreatureByName("The Many")
		if manysHere ~= false and isMonster(manysHere) == true then -- The Many is still spawned
			doRemoveCreature(manysHere)
		end
		setPlayerStorageValue(cid,2401,-1) -- is in boss room
		setGlobalStorageValue(2399,-1) -- The Many 10 min timer back to 0
		stopEvent(manyEvent)
		doTeleportThing(cid, manyBossOut)
	elseif whichBoss == 10 and item.actionid == 2400 then -- Player leaving area via portal
		thundersHere = getCreatureByName("Thunderstorm")
		if thundersHere ~= false and isMonster(thundersHere) == true then -- Thunderstorm is still spawned
			doRemoveCreature(thundersHere)
		end
		setPlayerStorageValue(cid,2401,-1) -- is in boss room
		setGlobalStorageValue(2424,-1) -- The Many 10 min timer back to 0
		stopEvent(thunderEvent)
		doTeleportThing(cid, thunderBossOut)
	elseif whichBoss == 11 and item.actionid == 2400 then -- Player leaving area via portal
		dreksHere = getCreatureByName("Drek Thar")
		if dreksHere ~= false and isMonster(dreksHere) == true then -- Drek Thar is still spawned
			doRemoveCreature(dreksHere)
		end
		setPlayerStorageValue(cid,2401,-1) -- is in boss room
		setGlobalStorageValue(2425,-1) -- The Many 10 min timer back to 0
		stopEvent(drekEvent)
		doTeleportThing(cid, drekBossOut)
	elseif whichBoss == 12 and item.actionid == 2400 then -- Player leaving area via portal
		dreksHere = getCreatureByName("Essbend")
		if esssHere ~= false and isMonster(esssHere) == true then -- Essbend is still spawned
			doRemoveCreature(esssHere)
		end
		setPlayerStorageValue(cid,2401,-1) -- is in boss room
		setGlobalStorageValue(2614,-1) -- The Many 10 min timer back to 0
		stopEvent(essEvent)
		doTeleportThing(cid, bogBossOut)
	end
	return true
end

-- Boss Timers --
function lumpTimer(combatant)
	local playerCid = combatant
	if bossTaskStep >= 1 then -- Player is on boss, may have killed it, who cares.
		combatantPos = getCreaturePosition(playerCid)
		if playerCid == playerCid then
			if combatantPos.x >= 1057 and combatantPos.x <= 1064 and combatantPos.y >= 1046 and combatantPos.y <= 1053 and combatantPos.y == 9 then -- Player is still in area
				doTeleportThing(playerCid, rotwormBossOut) -- Remove Player from area
				setPlayerStorageValue(playerCid,2401,-1)
				doPlayerSendTextMessage(playerCid, MESSAGE_INFO_DESCR, "Your time is up.")
			end
		end
		setGlobalStorageValue(2391,-1) -- Lump 10 min timer
		lumpsHere = getCreatureByName("Lump")
		if lumpsHere ~= false and isMonster(lumpsHere) == true then -- Lump is still spawned
			doRemoveCreature(lumpsHere) -- Remove Lump from area
		end
	end
end
function glorgorTimer(combatant)
	local playerCid = combatant
	if bossTaskStep >= 1 then -- Player is on boss, may have killed it, who cares.
		if playerCid == playerCid then
			combatantPos = getCreaturePosition(playerCid) 
			if combatantPos.x >= 1077 and combatantPos.x <= 1084 and combatantPos.y >= 1044 and combatantPos.y <= 1051 and combatantPos.y == 8 then -- Player is still in area
				doTeleportThing(playerCid, glorgorBossOut) -- Remove Player from area
				setPlayerStorageValue(playerCid,2401,-1)
				doPlayerSendTextMessage(playerCid, MESSAGE_INFO_DESCR, "Your time is up.")
			end
		end
		setGlobalStorageValue(2392,-1) -- Glorgor 10 min timer
		glorgorsHere = getCreatureByName("Glorgor")
		if glorgorsHere ~= false and isMonster(glorgorsHere) == true then -- Lump is still spawned
			doRemoveCreature(glorgorsHere) -- Remove Lump from area
		end
	end
end
function scatTimer(combatant)
	local playerCid = combatant
	if bossTaskStep >= 1 then -- Player is on boss, may have killed it, who cares.
		if playerCid == playerCid then
			combatantPos = getCreaturePosition(playerCid)
			if combatantPos.x >= 1138 and combatantPos.x <= 1146 and combatantPos.y >= 1060 and combatantPos.y <= 1069 and combatantPos.y == 8 then -- Player is still in area
				doTeleportThing(playerCid, scatBossOut) -- Remove Player from area
				setPlayerStorageValue(playerCid,2401,-1)
				doPlayerSendTextMessage(playerCid, MESSAGE_INFO_DESCR, "Your time is up.")
			end
		end
		setGlobalStorageValue(2393,-1) -- Scat 10 min timer
		scatsHere = getCreatureByName("Scat Fu")
		if scatsHere ~= false and isMonster(scatsHere) == true then -- Scat Fu is still spawned
			doRemoveCreature(scatsHere) -- Remove Scat Fu from area
		end
	end
end
function puffTimer(combatant)
	local playerCid = combatant
	if bossTaskStep >= 1 then -- Player is on boss, may have killed it, who cares.
		if playerCid == playerCid then
			combatantPos = getCreaturePosition(playerCid)
			if combatantPos.x >= 1046 and combatantPos.x <= 1054 and combatantPos.y >= 1103 and combatantPos.y <= 1108 and combatantPos.y == 5 then -- Player is still in area
				doTeleportThing(playerCid, puffBossOut) -- Remove Player from area
				setPlayerStorageValue(playerCid,2401,-1)
				doPlayerSendTextMessage(playerCid, MESSAGE_INFO_DESCR, "Your time is up.")
			end
		end
		setGlobalStorageValue(2394,-1) -- Puff 10 min timer
		puffsHere = getCreatureByName("Puff")
		if puffsHere ~= false and isMonster(puffsHere) == true then -- Puff is still spawned
			doRemoveCreature(puffsHere) -- Remove Puff from area
		end
	end
end
function udderTimer(combatant)
	local playerCid = combatant
	if bossTaskStep >= 1 then -- Player is on boss, may have killed it, who cares.
		if playerCid == playerCid then
			combatantPos = getCreaturePosition(playerCid)
			if combatantPos.x >= 1107 and combatantPos.x <= 1113 and combatantPos.y >= 1053 and combatantPos.y <= 1058 and combatantPos.y == 7 then -- Player is still in area
				doTeleportThing(playerCid, udderBossOut) -- Remove Player from area
				setPlayerStorageValue(playerCid,2401,-1)
				doPlayerSendTextMessage(playerCid, MESSAGE_INFO_DESCR, "Your time is up.")
			end
		end
		setGlobalStorageValue(2395,-1) -- Udder 10 min timer
		uddersHere = getCreatureByName("Udder")
		if uddersHere ~= false and isMonster(uddersHere) == true then -- Udder is still spawned
			doRemoveCreature(uddersHere) -- Remove Udder from area
		end
	end
end
function esmerTimer(combatant)
	local playerCid = combatant
	if bossTaskStep >= 1 then -- Player is on boss, may have killed it, who cares.
		if playerCid == playerCid then
			combatantPos = getCreaturePosition(playerCid)
			if combatantPos.x >= 1043 and combatantPos.x <= 1049 and combatantPos.y >= 1092 and combatantPos.y <= 1101 and combatantPos.y == 7 then -- Player is still in area
				doTeleportThing(playerCid, esmerBossOut) -- Remove Player from area
				setPlayerStorageValue(playerCid,2401,-1)
				doPlayerSendTextMessage(playerCid, MESSAGE_INFO_DESCR, "Your time is up.")
			end
		end
		setGlobalStorageValue(2396,-1) -- Esmeralda 10 min timer
		esmersHere = getCreatureByName("Esmeralda")
		if esmersHere ~= false and isMonster(esmersHere) == true then -- Esmeralda is still spawned
			doRemoveCreature(esmersHere) -- Remove Esmeralda from area
		end
	end
end
function barneyTimer(combatant)
	local playerCid = combatant
	if bossTaskStep >= 1 then -- Player is on boss, may have killed it, who cares.
		if playerCid == playerCid then
			combatantPos = getCreaturePosition(playerCid)
			if combatantPos.x >= 1050 and combatantPos.x <= 1063 and combatantPos.y >= 1125 and combatantPos.y <= 1135 and combatantPos.y == 6 then -- Player is still in area
				doTeleportThing(playerCid, barneyBossOut) -- Remove Player from area
				setPlayerStorageValue(playerCid,2401,-1)
				doPlayerSendTextMessage(playerCid, MESSAGE_INFO_DESCR, "Your time is up.")
			end
		end
		setGlobalStorageValue(2397,-1) -- Barney 10 min timer
		barneysHere = getCreatureByName("Barney")
		if barneysHere ~= false and isMonster(barneysHere) == true then -- Barney is still spawned
			doRemoveCreature(barneysHere) -- Remove Barney from area
		end
	end
end
function grohlTimer(combatant)
	local playerCid = combatant
	if bossTaskStep >= 1 then -- Player is on boss, may have killed it, who cares.
		if playerCid == playerCid then
			combatantPos = getCreaturePosition(playerCid)
			if combatantPos.x >= 1094 and combatantPos.x <= 1099 and combatantPos.y >= 1139 and combatantPos.y <= 1145 and combatantPos.y == 4 then -- Player is still in area
				doTeleportThing(playerCid, grohlBossOut) -- Remove Player from area
				setPlayerStorageValue(playerCid,2401,-1)
				doPlayerSendTextMessage(playerCid, MESSAGE_INFO_DESCR, "Your time is up.")
			end
		end
		setGlobalStorageValue(2398,-1) -- Grohl 10 min timer
		grohlsHere = getCreatureByName("Grohl")
		if grohlsHere ~= false and isMonster(grohlsHere) == true then -- Grohl is still spawned
			doRemoveCreature(grohlsHere) -- Remove Grohl from area
		end
	end
end
function manyTimer(combatant)
	local playerCid = combatant
	if bossTaskStep >= 1 then -- Player is on boss, may have killed it, who cares.
		if playerCid == playerCid then
			combatantPos = getCreaturePosition(playerCid)
			if combatantPos.x >= 1187 and combatantPos.x <= 1196 and combatantPos.y >= 1019 and combatantPos.y <= 1027 and combatantPos.y == 7 then -- Player is still in area
				doTeleportThing(playerCid, manyBossOut) -- Remove Player from area
				setPlayerStorageValue(playerCid,2401,-1)
				doPlayerSendTextMessage(playerCid, MESSAGE_INFO_DESCR, "Your time is up.")
			end
		end
		setGlobalStorageValue(2399,-1) -- The Many 10 min timer
		manysHere = getCreatureByName("The Many")
		if manysHere ~= false and isMonster(manysHere) == true then -- The Many is still spawned
			doRemoveCreature(manysHere) -- Remove The Many from area
		end
	end
end
function thunderTimer(combatant)
	local playerCid = combatant
	if bossTaskStep >= 1 then -- Player is on boss, may have killed it, who cares.
		if playerCid == playerCid then
			combatantPos = getCreaturePosition(playerCid)
			if combatantPos.x >= 1099 and combatantPos.x <= 1112 and combatantPos.y >= 1050 and combatantPos.y <= 1060 and combatantPos.y == 11 then -- Player is still in area
				doTeleportThing(playerCid, thunderBossOut) -- Remove Player from area
				setPlayerStorageValue(playerCid,2401,-1)
				doPlayerSendTextMessage(playerCid, MESSAGE_INFO_DESCR, "Your time is up.")
			end
		end
		setGlobalStorageValue(2424,-1) -- Thunderstorm 10 min timer
		manysHere = getCreatureByName("Thunderstorm")
		if thundersHere ~= false and isMonster(thundersHere) == true then -- Thunderstorm is still spawned
			doRemoveCreature(thundersHere) -- Remove Thunderstorm from area
		end
	end
end
function drekTimer(combatant)
	local playerCid = combatant
	if bossTaskStep >= 1 then -- Player is on boss, may have killed it, who cares.
		if playerCid == playerCid then
			combatantPos = getCreaturePosition(playerCid)
			if combatantPos.x >= 1197 and combatantPos.x <= 1213 and combatantPos.y >= 1099 and combatantPos.y <= 1113 and combatantPos.y == 8 then -- Player is still in area
				doTeleportThing(playerCid, drekBossOut) -- Remove Player from area
				setPlayerStorageValue(playerCid,2401,-1)
				doPlayerSendTextMessage(playerCid, MESSAGE_INFO_DESCR, "Your time is up.")
			end
		end
		setGlobalStorageValue(2425,-1) -- Drek Thar 10 min timer
		dreksHere = getCreatureByName("Drek Thar")
		if dreksHere ~= false and isMonster(dreksHere) == true then -- Drek Thar is still spawned
			doRemoveCreature(dreksHere) -- Remove Drek Thar from area
		end
	end
end
function essTimer(combatant)
	local playerCid = combatant
	if bossTaskStep >= 1 then -- Player is on boss, may have killed it, who cares.
		if playerCid == playerCid then
			combatantPos = getCreaturePosition(playerCid)
			if combatantPos.x >= 1088 and combatantPos.x <= 1098 and combatantPos.y >= 981 and combatantPos.y <= 994 and combatantPos.y == 9 then -- Player is still in area
				doTeleportThing(playerCid, bogBossOut) -- Remove Player from area
				setPlayerStorageValue(playerCid,2401,-1)
				doPlayerSendTextMessage(playerCid, MESSAGE_INFO_DESCR, "Your time is up.")
			end
		end
		setGlobalStorageValue(2614,-1) -- Essbend 10 min timer
		esssHere = getCreatureByName("Essbend")
		if esssHere ~= false and isMonster(esssHere) == true then -- Essbend is still spawned
			doRemoveCreature(esssHere) -- Remove Essbend from area
		end
	end
end