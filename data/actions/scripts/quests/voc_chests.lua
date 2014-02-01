function onUse(cid, item, fromPosition, itemEx, toPosition)
		local playerCap = getPlayerFreeCap(cid)	

   		if item.uid == 2101 and getPlayerStorageValue(cid, 2101) == -1 then -- Mage Hat
			if playerCap >= 9 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a mage hat.")
				doPlayerAddItem(cid, 8820, 1) -- mage hat
				doSendMagicEffect(getCreaturePosition(cid), 12) -- Magic effect on player to denote successful quest
				setPlayerStorageValue(cid,2101,1) -- Storage value to reflect quest done
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a mage hat weighing 9oz. It is too heavy to take.")
			end
		elseif item.uid == 2102 and getPlayerStorageValue(cid, 2102) == -1 then -- Magician's Robe
			if playerCap >= 25 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a magician's robe.")
				doPlayerAddItem(cid, 8819, 1) -- magician's robe
				doSendMagicEffect(getCreaturePosition(cid), 12) -- Magic effect on player to denote successful quest
				setPlayerStorageValue(cid,2102,1) -- Storage value to reflect quest done
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a magician's robe weighing 25oz. It is too heavy to take.")
			end
		elseif item.uid == 2103 and getPlayerStorageValue(cid, 2103) == -1 then -- Spellbook
			if playerCap >= 18 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a spellbook.")
				doPlayerAddItem(cid, 2175, 1) -- Spellbook
				doSendMagicEffect(getCreaturePosition(cid), 12) -- Magic effect on player to denote successful quest
				setPlayerStorageValue(cid,2103,1) -- Storage value to reflect quest done
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a spellbook weighing 18oz. It is too heavy to take.")
			end
		elseif item.uid == 2104 and getPlayerStorageValue(cid, 2104) == -1 then -- Wand of Vortex
			if playerCap >= 19 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a wand of vortex.")
				doPlayerAddItem(cid, 2190, 1) -- Wand of Vortex
				doSendMagicEffect(getCreaturePosition(cid), 12) -- Magic effect on player to denote successful quest
				setPlayerStorageValue(cid,2104,1) -- Storage value to reflect quest done
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a wand of vortex weighing 19oz. It is too heavy to take.")
			end
		elseif item.uid == 2105 and getPlayerStorageValue(cid, 2105) == -1 then -- Mana Potion
			if playerCap >= 9 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found 5 mana potions.")
				doPlayerAddItem(cid, 7620, 5) -- 5 x Mana Potion
				doSendMagicEffect(getCreaturePosition(cid), 12) -- Magic effect on player to denote successful quest
				setPlayerStorageValue(cid,2105,1) -- Storage value to reflect quest done
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found 5 mana potions weighing 9oz. They are too heavy to take.")
			end
		elseif item.uid == 2106 and getPlayerStorageValue(cid, 2106) == -1 then -- Mage Hat
			if playerCap >= 9 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a mage hat.")
				doPlayerAddItem(cid, 8820, 1) -- mage hat
				doSendMagicEffect(getCreaturePosition(cid), 12) -- Magic effect on player to denote successful quest
				setPlayerStorageValue(cid,2106,1) -- Storage value to reflect quest done
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a mage hat weighing 9oz. It is too heavy to take.")
			end
		elseif item.uid == 2107 and getPlayerStorageValue(cid, 2107) == -1 then -- Magician's Robe
			if playerCap >= 25 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a magician's robe.")
				doPlayerAddItem(cid, 8819, 1) -- magicians robe
				doSendMagicEffect(getCreaturePosition(cid), 12) -- Magic effect on player to denote successful quest
				setPlayerStorageValue(cid,2107,1) -- Storage value to reflect quest done
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a magician's robe weighing 25oz. It is too heavy to take.")
			end
		elseif item.uid == 2108 and getPlayerStorageValue(cid, 2108) == -1 then -- Spellbook
			if playerCap >= 18 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a spellbook.")
				doPlayerAddItem(cid, 2175, 1) -- Spellbook
				doSendMagicEffect(getCreaturePosition(cid), 12) -- Magic effect on player to denote successful quest
				setPlayerStorageValue(cid,2108,1) -- Storage value to reflect quest done
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a spellbook weighing 18oz. It is too heavy to take.")
			end
		elseif item.uid == 2109 and getPlayerStorageValue(cid, 2109) == -1 then -- Snakebit Rod
			if playerCap >= 19 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a snakebite rod.")
				doPlayerAddItem(cid, 2182, 1) -- Snakebite Rod
				doSendMagicEffect(getCreaturePosition(cid), 12) -- Magic effect on player to denote successful quest
				setPlayerStorageValue(cid,2109,1) -- Storage value to reflect quest done
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a wand of vortex weighing 19oz. It is too heavy to take.")
			end
		elseif item.uid == 2110 and getPlayerStorageValue(cid, 2110) == -1 then -- Mana Potion
			if playerCap >= 9 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found 5 mana potions.")
				doPlayerAddItem(cid, 7620, 5) -- 5 x Mana Potion
				doSendMagicEffect(getCreaturePosition(cid), 12) -- Magic effect on player to denote successful quest
				setPlayerStorageValue(cid,2110,1) -- Storage value to reflect quest done
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found 5 mana potions weighing 9oz. They are too heavy to take.")
			end
		elseif item.uid == 2111 and getPlayerStorageValue(cid, 2111) == -1 then -- Ranger Cloak
			if playerCap >= 48 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a ranger's cloak.")
				doPlayerAddItem(cid, 2660, 1) -- Ranger's Cloak
				doSendMagicEffect(getCreaturePosition(cid), 12) -- Magic effect on player to denote successful quest
				setPlayerStorageValue(cid,2111,1) -- Storage value to reflect quest done
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a ranger's cloak weighing 48oz. It is too heavy to take.")
			end
		elseif item.uid == 2112 and getPlayerStorageValue(cid, 2112) == -1 then -- Ranger Legs
			if playerCap >= 35 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found ranger legs.")
				doPlayerAddItem(cid, 2507, 1) -- Ranger Legs
				doSendMagicEffect(getCreaturePosition(cid), 12) -- Magic effect on player to denote successful quest
				setPlayerStorageValue(cid,2112,1) -- Storage value to reflect quest done
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found ranger legs weighing 35oz. They are too heavy to take.")
			end
		elseif item.uid == 2113 and getPlayerStorageValue(cid, 2113) == -1 then -- Bow and Arrows
			if playerCap >= 101 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have a bow and arrows.")
				doPlayerAddItem(cid, 2456, 1) -- Bow
				doPlayerAddItem(cid, 2544, 100) -- 100x Arrows
				doSendMagicEffect(getCreaturePosition(cid), 12) -- Magic effect on player to denote successful quest
				setPlayerStorageValue(cid,2113,1) -- Storage value to reflect quest done
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a bow and arrows weighing 101oz. It is too heavy to take.")
			end
		elseif item.uid == 2114 and getPlayerStorageValue(cid, 2114) == -1 then -- Spears
			if playerCap >= 100 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found 5 spears.")
				doPlayerAddItem(cid, 2389, 5) -- 5x Spears
				doSendMagicEffect(getCreaturePosition(cid), 12) -- Magic effect on player to denote successful quest
				setPlayerStorageValue(cid,2114,1) -- Storage value to reflect quest done
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found 5 spears weighing 100oz. They are too heavy to take.")
			end
		elseif item.uid == 2115 and getPlayerStorageValue(cid, 2115) == -1 then -- 5 x Health Potions
			if playerCap >= 9 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found 5 health potions.")
				doPlayerAddItem(cid, 7618, 5) -- 5x Health Potion
				doSendMagicEffect(getCreaturePosition(cid), 12) -- Magic effect on player to denote successful quest
				setPlayerStorageValue(cid,2115,1) -- Storage value to reflect quest done
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found 5 health potions weighing 9oz. They are too heavy to take.")
			end
		elseif item.uid == 2116 and getPlayerStorageValue(cid, 2116) == -1 then -- Soldier Helmet
			if playerCap >= 32 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a soldier helmet.")
				doPlayerAddItem(cid, 2481, 1) -- Soldier Helmet
				doSendMagicEffect(getCreaturePosition(cid), 12) -- Magic effect on player to denote successful quest
				setPlayerStorageValue(cid,2116,1) -- Storage value to reflect quest done
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a soldier helmet weighing 32oz. It is too heavy to take.")
			end
		elseif item.uid == 2117 and getPlayerStorageValue(cid, 2117) == -1 then -- Brass Armor
			if playerCap >= 80 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a brass armor.")
				doPlayerAddItem(cid, 2465, 1) -- Brass Armor
				doSendMagicEffect(getCreaturePosition(cid), 12) -- Magic effect on player to denote successful quest
				setPlayerStorageValue(cid,2117,1) -- Storage value to reflect quest done
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a brass armor weighing 80oz. It is too heavy to take.")
			end
		elseif item.uid == 2118 and getPlayerStorageValue(cid, 2118) == -1 then -- brass legs
			if playerCap >= 38 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found brass legs.")
				doPlayerAddItem(cid, 2478, 1) -- Brass Legs
				doSendMagicEffect(getCreaturePosition(cid), 12) -- Magic effect on player to denote successful quest
				setPlayerStorageValue(cid,2118,1) -- Storage value to reflect quest done
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found brass legs weighing 38oz. They are too heavy to take.")
			end
		elseif item.uid == 2119 and getPlayerStorageValue(cid, 2119) == -1 then -- Steel Shield
			if playerCap >= 69 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a steel shield.")
				doPlayerAddItem(cid, 2509, 1) -- Steel Shield
				doSendMagicEffect(getCreaturePosition(cid), 12) -- Magic effect on player to denote successful quest
				setPlayerStorageValue(cid,2119,1) -- Storage value to reflect quest done
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a steel shield weighing 69oz. It is too heavy to take.")
			end
		elseif item.uid == 2120 and getPlayerStorageValue(cid, 2120) == -1 then -- 5x Health Potions
			if playerCap >= 9 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found 5 health potions.")
				doPlayerAddItem(cid, 7618, 5) -- 5x Health Potions
				doSendMagicEffect(getCreaturePosition(cid), 12) -- Magic effect on player to denote successful quest
				setPlayerStorageValue(cid,2120,1) -- Storage value to reflect quest done
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found 5 health potions weighing 9oz. They are too heavy to take.")
			end
		elseif item.uid == 2121 and getPlayerStorageValue(cid, 2121) == -1 then -- Jagged Sword
			if playerCap >= 29 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a jagged sword.")
				doPlayerAddItem(cid, 8602, 1) -- Jagged Sword
				doSendMagicEffect(getCreaturePosition(cid), 12) -- Magic effect on player to denote successful quest
				setPlayerStorageValue(cid,2121,1) -- Storage value to reflect quest done
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a jagged sword weighing 29oz. It is too heavy to take.")
			end
		elseif item.uid == 2122 and getPlayerStorageValue(cid, 2122) == -1 then -- Daramanian Mace
			if playerCap >= 68 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a daramanian mace.")
				doPlayerAddItem(cid, 2439, 1) -- Daramanian Mace
				doSendMagicEffect(getCreaturePosition(cid), 12) -- Magic effect on player to denote successful quest
				setPlayerStorageValue(cid,2122,1) -- Storage value to reflect quest done
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a daramanian mace weighing 68oz. It is too heavy to take.")
			end
		elseif item.uid == 2123 and getPlayerStorageValue(cid, 2123) == -1 then -- Steel Axe
			if playerCap >= 41 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a steel axe.")
				doPlayerAddItem(cid, 8601, 1) -- Steel Axe
				doSendMagicEffect(getCreaturePosition(cid), 12) -- Magic effect on player to denote successful quest
				setPlayerStorageValue(cid,2123,1) -- Storage value to reflect quest done
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a steel axe weighing 41oz. It is too heavy to take.")
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "It is empty.")
   		end
end