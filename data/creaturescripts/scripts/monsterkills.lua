function onKill(cid, target)

local config = {
ratname1 = "Rat", -- monster name
ratname2 = "Cave Rat", -- monster name
wolfname = "Wolf", -- monster name
trollname = "Troll", -- Troll
trollname2 = "Swamp Troll", -- Swamp Troll
rotwormname1 = "Rotworm", -- Rotworm
rotwormname2 = "Carrion Worm", -- Carrion Worm
dragonname = "Dragon", -- Dragon
dragonname2 = "Dragon Hatchling", -- Dragon Hatchling
dragonlordname = "Crimson Dragon", -- Terror Bird
minotaurname1 = "Minotaur",
minotaurname2 = "Minotaur Archer",
minotaurname3 = "Minotaur Guard",
minotaurname4 = "Minotaur Mage",
apename1 = "Kongra",
apename2 = "Sibang",
apename3 = "Merlkin",
mutantname1 = "Mutated Rat",
mutantname2 = "Mutated Human",
mutantname3 = "Mutated Bat",
mutantname4 = "Mutated Tiger",
heroname = "Crusader",
hydraname = "Hydra",
demonname = "Demon",
drakenname1 = "Draken Spellweaver",
drakenname2 = "Draken Warmaster",
drakenname3 = "Draken Abomination",
drakenname4 = "Draken Elite",
bogname = "Bog Raider",

rotBossName = "Lump",
trollBossName = "Glorgor",
apeBossName = "Scat Fu",
dragonBossName = "Puff",
minoBossName = "Udder",
mutantBossName = "Esmeralda",
dlBossName = "Barney",
heroBossName = "Grohl",
hydraBossName = "The Many",
demonBossName = "Thunderstorm",
drakenBossName = "Drek Thar",
bogBossName = "Essbend",
pos = getPlayerPosition(cid), -- replacement for cid is target
targetPos = getCreaturePosition(target)
}
	
	if(isCreature(target) == TRUE) then
		if getCreatureName(target) == "White Deer" then
			doSummonCreature("Enraged White Deer", getCreaturePosition(target))
		end
		if getCreatureName(target) == "Brother Daniel" then
			setGlobalStorageValue(2378,-1)
		end
		if getCreatureName(target) == "Grey Mare" then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'The horse ran away to safety.')
		end

		if getCreatureName(target) == config.bogBossName or getCreatureName(target) == config.drakenBossName or getCreatureName(target) == config.rotBossName or getCreatureName(target) == config.trollBossName or getCreatureName(target) == config.apeBossName or getCreatureName(target) == config.dragonBossName or getCreatureName(target) == config.minoBossName or getCreatureName(target) == config.mutantBossName or getCreatureName(target) == config.dlBossName or getCreatureName(target) == config.heroBossName or getCreatureName(target) == config.hydraBossName or getCreatureName(target) == config.demonBossName then
			setPlayerStorageValue(cid,2380,2)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have killed ' .. getCreatureName(target) .. '. Return to Task Master Greg for your reward.')
		end

		if getPlayerStorageValue(cid, 2010) == 3 and getPlayerStorageValue(cid, 2012) <= 9 then -- New Haven 5 rat kill quest
			if getCreatureName(target) == config.ratname1 or getCreatureName(target) == config.ratname2 then
				ratkills = (getPlayerStorageValue(cid, 2012) + 1)
				setPlayerStorageValue(cid,2012,ratkills)
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "" .. ratkills .. " of 10 rats slain.")
			end
		elseif getPlayerStorageValue(cid, 2200) == 1 and getPlayerStorageValue(cid, 2201) <= 99 then -- Rotworm Task
			if getCreatureName(target) == config.rotwormname1 or getCreatureName(target) == config.rotwormname2 then
				taskKills = (getPlayerStorageValue(cid, 2201) + 1)
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "" .. taskKills .. " of 100 rotworms slain.")
				setPlayerStorageValue(cid,2201,taskKills)
			end
		elseif getPlayerStorageValue(cid, 2200) == 2 and getPlayerStorageValue(cid, 2201) <= 99 then -- Troll Task
			if getCreatureName(target) == config.trollname or getCreatureName(target) == config.trollname2 then
				taskKills = (getPlayerStorageValue(cid, 2201) + 1)
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "" .. taskKills .. " of 100 trolls slain.")
				setPlayerStorageValue(cid,2201,taskKills)
			end
		elseif getPlayerStorageValue(cid, 2200) == 3 and getPlayerStorageValue(cid, 2201) <= 99 then -- Dragon Task
			if getCreatureName(target) == config.dragonname or getCreatureName(target) == config.dragonname2 then
				taskKills = (getPlayerStorageValue(cid, 2201) + 1)
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "" .. taskKills .. " of 100 dragons slain.")
				setPlayerStorageValue(cid,2201,taskKills)
			end
		elseif getPlayerStorageValue(cid, 2200) == 4 and getPlayerStorageValue(cid, 2201) <= 99 then -- Dragon Lord Task
			if getCreatureName(target) == config.dragonlordname then
				taskKills = (getPlayerStorageValue(cid, 2201) + 1)
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "" .. taskKills .. " of 100 crimson dragons slain.")
				setPlayerStorageValue(cid,2201,taskKills)
			end
		elseif getPlayerStorageValue(cid, 2200) == 5 and getPlayerStorageValue(cid, 2201) <= 99 then -- Minotaur Task
			if getCreatureName(target) == config.minotaurname1 or getCreatureName(target) == config.minotaurname2 or getCreatureName(target) == config.minotaurname3 or getCreatureName(target) == config.minotaurname4 then
				taskKills = (getPlayerStorageValue(cid, 2201) + 1)
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "" .. taskKills .. " of 100 minotaurs slain.")
				setPlayerStorageValue(cid,2201,taskKills)
			end
		elseif getPlayerStorageValue(cid, 2200) == 6 and getPlayerStorageValue(cid, 2201) <= 99 then -- Ape Task
			if getCreatureName(target) == config.apename1 or getCreatureName(target) == config.apename2 or getCreatureName(target) == config.apename3 then
				taskKills = (getPlayerStorageValue(cid, 2201) + 1)
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "" .. taskKills .. " of 100 apes slain.")
				setPlayerStorageValue(cid,2201,taskKills)
			end
		elseif getPlayerStorageValue(cid, 2200) == 7 and getPlayerStorageValue(cid, 2201) <= 99 then -- Mutant Task
			if getCreatureName(target) == config.mutantname1 or getCreatureName(target) == config.mutantname2 or getCreatureName(target) == config.mutantname3 or getCreatureName(target) == config.mutantname4 then
				taskKills = (getPlayerStorageValue(cid, 2201) + 1)
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "" .. taskKills .. " of 100 mutants slain.")
				setPlayerStorageValue(cid,2201,taskKills)
			end
		elseif getPlayerStorageValue(cid, 2200) == 8 and getPlayerStorageValue(cid, 2201) <= 99 then -- Hero Task
			if getCreatureName(target) == config.heroname then
				taskKills = (getPlayerStorageValue(cid, 2201) + 1)
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "" .. taskKills .. " of 100 crusaders slain.")
				setPlayerStorageValue(cid,2201,taskKills)
			end
		elseif getPlayerStorageValue(cid, 2200) == 9 and getPlayerStorageValue(cid, 2201) <= 99 then -- Hydra Task
			if getCreatureName(target) == config.hydraname then
				taskKills = (getPlayerStorageValue(cid, 2201) + 1)
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "" .. taskKills .. " of 100 hydras slain.")
				setPlayerStorageValue(cid,2201,taskKills)
			end
		elseif getPlayerStorageValue(cid, 2200) == 10 and getPlayerStorageValue(cid, 2201) <= 99 then -- Demon Task
			if getCreatureName(target) == config.demonname then
				taskKills = (getPlayerStorageValue(cid, 2201) + 1)
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "" .. taskKills .. " of 100 demons slain.")
				setPlayerStorageValue(cid,2201,taskKills)
			end
		elseif getPlayerStorageValue(cid, 2200) == 11 and getPlayerStorageValue(cid, 2201) <= 99 then -- Draken Task
			if getCreatureName(target) == config.drakenname1 or getCreatureName(target) == config.drakenname2 or getCreatureName(target) == config.drakenname3 or getCreatureName(target) == config.drakenname4 then
				taskKills = (getPlayerStorageValue(cid, 2201) + 1)
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "" .. taskKills .. " of 100 drakens slain.")
				setPlayerStorageValue(cid,2201,taskKills)
			end
		elseif getPlayerStorageValue(cid, 2200) == 12 and getPlayerStorageValue(cid, 2201) <= 99 then -- Bog Raider Task
			if getCreatureName(target) == config.bogname then
				taskKills = (getPlayerStorageValue(cid, 2201) + 1)
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "" .. taskKills .. " of 100 bog raiders slain.")
				setPlayerStorageValue(cid,2201,taskKills)
			end
-- NEW HAVEN STUFF --
		elseif getPlayerStorageValue(cid, 2010) == 6 and getPlayerStorageValue(cid, 2011) <= 4 then -- New Haven 5 wolf kill quest
			if getCreatureName(target) == config.wolfname then
				wolfkills = (getPlayerStorageValue(cid, 2011) + 1)
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "" .. wolfkills .. " of 5 wolves slain.")
				setPlayerStorageValue(cid,2011,wolfkills)
			end
		elseif getPlayerStorageValue(cid, 2010) == 14 and getPlayerStorageValue(cid, 2013) <= 9 then -- New Haven 10 troll kill quest
			if getCreatureName(target) == config.trollname then
				trollkills = (getPlayerStorageValue(cid, 2013) + 1)
				setPlayerStorageValue(cid,2013,trollkills)
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "" .. trollkills .. " of 10 trolls slain.")
			end
		end
	end

	if(isCreature(target) == TRUE) then
		if getCreatureName(target) == "Demon" then
			if getPlayerStorageValue(cid,2501) == -1 then
				setPlayerStorageValue(cid,2501,1)
			else
				mKills = getPlayerStorageValue(cid,2501)
				setPlayerStorageValue(cid,2501,(mKills + 1))
				if getPlayerStorageValue(cid,2501) == 666 then
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have received the demon hunter addons.")
					if getPlayerSex(cid) == 0 then
						doPlayerAddOutfit(cid,288,3) -- f
					else
						doPlayerAddOutfit(cid,289,1) -- m
					end
					doSendMagicEffect(getCreaturePosition(cid), 12) -- Magic effect on player to denote successful quest
				end
			end
		elseif getCreatureName(target) == "Hydra" then
			if getPlayerStorageValue(cid,2502) == -1 then
				setPlayerStorageValue(cid,2502,1)
			else
				mKills = getPlayerStorageValue(cid,2502)
				setPlayerStorageValue(cid,2502,(mKills + 1))
			end
		elseif getCreatureName(target) == "Crimson Dragon" then
			if getPlayerStorageValue(cid,2503) == -1 then
				setPlayerStorageValue(cid,2503,1)
			else
				mKills = getPlayerStorageValue(cid,2503)
				setPlayerStorageValue(cid,2503,(mKills + 1))
			end
		elseif getCreatureName(target) == "Dragon" then
			if getPlayerStorageValue(cid,2504) == -1 then
				setPlayerStorageValue(cid,2504,1)
			else
				mKills = getPlayerStorageValue(cid,2504)
				setPlayerStorageValue(cid,2504,(mKills + 1))
			end
		elseif getCreatureName(target) == "Rotworm" then
			if getPlayerStorageValue(cid,2505) == -1 then
				setPlayerStorageValue(cid,2505,1)
			else
				mKills = getPlayerStorageValue(cid,2505)
				setPlayerStorageValue(cid,2505,(mKills + 1))
			end
		elseif getCreatureName(target) == "Swamp Troll" then
			if getPlayerStorageValue(cid,2506) == -1 then
				setPlayerStorageValue(cid,2506,1)
			else
				mKills = getPlayerStorageValue(cid,2506)
				setPlayerStorageValue(cid,2506,(mKills + 1))
			end
		elseif getCreatureName(target) == "Witch" then
			if getPlayerStorageValue(cid,2507) == -1 then
				setPlayerStorageValue(cid,2507,1)
			else
				mKills = getPlayerStorageValue(cid,2507)
				setPlayerStorageValue(cid,2507,(mKills + 1))
			end
		elseif getCreatureName(target) == "Nightmare" then
			if getPlayerStorageValue(cid,2508) == -1 then
				setPlayerStorageValue(cid,2508,1)
			else
				mKills = getPlayerStorageValue(cid,2508)
				setPlayerStorageValue(cid,2508,(mKills + 1))
				if getPlayerStorageValue(cid,2508) == 666 then
					if getPlayerSex(cid) == 0 then
						doPlayerAddOutfit(cid,269,3) -- f
					else
						doPlayerAddOutfit(cid,268,1) -- m
					end
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have received the nightmare addons.")
					doSendMagicEffect(getCreaturePosition(cid), 12) -- Magic effect on player to denote successful quest
				end
			end
		elseif getCreatureName(target) == "Stampor" then
			if getPlayerStorageValue(cid,2379) == -1 then
				setPlayerStorageValue(cid,2379,1)
			else
				mKills = getPlayerStorageValue(cid,2379)
				setPlayerStorageValue(cid,2379,(mKills + 1))
				if getPlayerStorageValue(cid,2379) == 50 then
					doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN)
					doPlayerAddMount(cid, 11)
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'Congratulations! For killing 50 Stampors you have earned the Stampor mount.')
					doSendMagicEffect(getCreaturePosition(cid), 12) -- Magic effect on player to denote successful quest
				end
			end
		elseif getCreatureName(target) == "Yielothax" then
			if getPlayerStorageValue(cid,2605) == -1 then
				setPlayerStorageValue(cid,2605,1)
			else
				mKills = getPlayerStorageValue(cid,2605)
				setPlayerStorageValue(cid,2605,(mKills + 1))
				if getPlayerStorageValue(cid,2605) <= 5 then
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "" .. getPlayerStorageValue(cid,2605) .. " of 5 yielothax slain.")
				end
				if getPlayerStorageValue(cid,2605) == 5 then
					setPlayerStorageValue(cid,2604,2)
				end
			end
			if getPlayerStorageValue(cid,2606) == -1 then
				setPlayerStorageValue(cid,2606,1)
			else
				nKills = getPlayerStorageValue(cid,2606)
				setPlayerStorageValue(cid,2606,(nKills + 1))
			end
		end
	end	
	
	return TRUE
end  