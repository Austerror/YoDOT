local rope = {2648,2649,2650,2651,2652,2653,2654,2655,2656,2657,2658,2659,2660,2661,2662,2663,2664,2665,2666,2667,2668,2669,2670,2671,2672,2673,2674,2675,2676,2677,2678,2679}
local shovel = {2632,2633,2634,2635,2636,2637,2638,2639,2640,2641,2642,2643,2644,2645,2646,2647,2664,2665,2666,2667,2668,2669,2670,2671,2672,2673,2674,2675,2676,2677,2678,2679}
local pick = {2625,2626,2627,2628,2629,2630,2631,2640,2641,2642,2643,2644,2645,2646,2647,2656,2657,2658,2659,2660,2661,2662,2663,2672,2673,2674,2675,2676,2677,2678,2679,2680}
local machete = {2621,2622,2623,2624,2628,2629,2630,2631,2636,2637,2638,2639,2644,2645,2646,2647,2652,2653,2654,2655,2660,2661,2662,2663,2668,2669,2670,2671,2676,2677,2678,2679}
local obknife = {2619,2620,2623,2624,2626,2627,2630,2631,2634,2635,2638,2639,2642,2643,2646,2647,2650,2651,2654,2655,2658,2659,2662,2663,2666,2667,2670,2671,2674,2675,2678,2679}
local bws = {2618,2620,2622,2624,2625,2627,2629,2631,2633,2635,2637,2639,2641,2643,2645,2647,2649,2651,2653,2655,2657,2659,2661,2663,2665,2667,2669,2671,2673,2675,2677,2679}
local stonepiles = {468, 481, 483, 7932}
local openholes = {294, 369, 370, 383, 392, 408, 409, 427, 428, 430, 462, 469, 470, 482, 484, 485, 489, 924, 3135, 3136, 7933}
local ropespots = {384,418,8278}
local minotaurs = {3090, 2830, 2871, 2866, 2876}
local lizards = {4259, 4262, 4256, 11271, 11275, 11267, 11263, 11279}
local greendragons = {3104, 2844}
local reddragons = {2881}
local behemoth = {2931}
local bonebeast = {3031}
local cube = {7441, 7444, 7445}
local cube2 = {7442}
local beholders = {2908, 3052, 7256}
local demon = {2916}
local vampire = {2956}
function onUse(cid, item, fromPosition, itemEx, toPosition)
	math.randomseed( os.time() )
	math.random(); math.random(); math.random()
	local groundTile = getThingfromPos(toPosition)
	-- Shovel
	if isInArray(stonepiles, itemEx.itemid) == TRUE then
		if isInArray(shovel, item.actionid) == TRUE then
			doTransformItem(itemEx.uid, itemEx.itemid + 1)
			doDecayItem(itemEx.uid)
		else
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"This allrounder can not be used as a shovel yet.")
		end
	-- Rope
	elseif isInArray(ropespots, groundTile.itemid) == TRUE then
		if isInArray(rope, item.actionid) == TRUE then
			doTeleportThing(cid, {x = toPosition.x, y = toPosition.y + 1, z = toPosition.z - 1}, FALSE)
		else
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"This allrounder can not be used as a rope yet.")
		end
	elseif isInArray(openholes, itemEx.itemid) == TRUE then
		if isInArray(rope, item.actionid) == TRUE then
			local hole = getThingfromPos({x = toPosition.x, y = toPosition.y, z = toPosition.z + 1, stackpos = STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE})
			if hole.itemid > 0 then
				doTeleportThing(hole.uid, {x = toPosition.x, y = toPosition.y + 1, z = toPosition.z}, FALSE)
			else
				doPlayerSendCancel(cid, "Sorry, not possible.")
			end
		else
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"This allrounder can not be used as a rope yet.")
		end
	-- Pick
	elseif (itemEx.uid <= 65535 or itemEx.actionid > 0) and (itemEx.itemid == 354 or itemEx.itemid == 355) then
		if isInArray(pick, item.actionid) == TRUE then
			doTransformItem(itemEx.uid, 392)
			doDecayItem(itemEx.uid)
			doSendMagicEffect(toPosition, CONST_ME_POFF)
		else
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"This allrounder can not be used as a pick yet.")
		end
	elseif itemEx.itemid == 11227 then -- shiny stone
		if isInArray(pick, item.actionid) == TRUE then
			local refined = math.random(1, 10000)
			if refined >= 9962 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a crystal coin.')
				doRemoveItem(itemEx.uid, 1)
				doPlayerAddItem(cid, 2160)
			elseif refined >= 9418 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a gold coin.')
				doRemoveItem(itemEx.uid, 1)
				doPlayerAddItem(cid, 2148)
			elseif refined >= 5076 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a platinum coin.')
				doRemoveItem(itemEx.uid, 1)
				doPlayerAddItem(cid, 2152)
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a small diamond.')
				doRemoveItem(itemEx.uid, 1)
				doPlayerAddItem(cid, 2145)
			end
		else
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"This allrounder can not be used as a pick yet.")
		end
	-- Machete
	elseif itemEx.itemid == 2782 then
		if isInArray(machete, item.actionid) == TRUE then
			doTransformItem(itemEx.uid, 2781)
			doDecayItem(itemEx.uid)
		else
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"This allrounder can not be used as a machete yet.")
		end			
	elseif itemEx.itemid == 3985 then
		if isInArray(machete, item.actionid) == TRUE then
			doTransformItem(itemEx.uid, 3984)
			doDecayItem(itemEx.uid)
		else
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"This allrounder can not be used as a machete yet.")
		end	
	elseif itemEx.itemid == 1499 then
		if isInArray(machete, item.actionid) == TRUE then
			doRemoveItem(itemEx.uid)
		else
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"This allrounder can not be used as a machete yet.")
		end
	-- Obsidian Knife
	elseif isInArray(minotaurs, itemEx.itemid) == TRUE then
		if isInArray(obknife, item.actionid) == TRUE then
			skinMonster(cid, itemEx, 5878)
		else
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"This allrounder can not be used as an obsidian knife yet.")
		end
	elseif isInArray(lizards, itemEx.itemid) == TRUE then
		if isInArray(obknife, item.actionid) == TRUE then
			skinMonster(cid, itemEx, 5876)
		else
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"This allrounder can not be used as an obsidian knife yet.")
		end
	elseif isInArray(greendragons, itemEx.itemid) == TRUE then
		if isInArray(obknife, item.actionid) == TRUE then
			skinMonster(cid, itemEx, 5877)
		else
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"This allrounder can not be used as an obsidian knife yet.")
		end
	elseif isInArray(reddragons, itemEx.itemid) == TRUE then
		if isInArray(obknife, item.actionid) == TRUE then
			skinMonster(cid, itemEx, 5948)
		else
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"This allrounder can not be used as an obsidian knife yet.")
		end
	elseif isInArray(behemoth, itemEx.itemid) == TRUE then
		if isInArray(obknife, item.actionid) == TRUE then
			skinMonster(cid, itemEx, 5893)
		else
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"This allrounder can not be used as an obsidian knife yet.")
		end
	elseif isInArray(bonebeast, itemEx.itemid) == TRUE then
		if isInArray(obknife, item.actionid) == TRUE then
			skinMonster(cid, itemEx, 5925)
		else
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"This allrounder can not be used as an obsidian knife yet.")
		end
	elseif isInArray(beholders, itemEx.itemid) == TRUE then
		if isInArray(obknife, item.actionid) == TRUE then
			skinMonster(cid, itemEx, 5898)
		else
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"This allrounder can not be used as an obsidian knife yet.")
		end
		
    elseif isInArray(cube, itemEx.itemid) == TRUE and random < 4 then
		if isInArray(obknife, item.actionid) == TRUE then
			doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_HITAREA)
			doTransformItem(itemEx.uid, itemEx.itemid + 1)
		else
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"This allrounder can not be used as an obsidian knife yet.")
		end			
    elseif isInArray(cube2, itemEx.itemid) == TRUE and random < 4 then
		if isInArray(obknife, item.actionid) == TRUE then
			doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_HITAREA)
			doTransformItem(itemEx.uid, itemEx.itemid + 2)
		else
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"This allrounder can not be used as an obsidian knife yet.")
		end	
    elseif (isInArray(cube, itemEx.itemid) == TRUE or isInArray(cube2, itemEx.itemid) == TRUE) and random > 4 then
		if isInArray(obknife, item.actionid) == TRUE then
			doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_HITAREA)
			doRemoveItem(itemEx.uid)
		else
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"This allrounder can not be used as an obsidian knife yet.")
		end
	-- Blessed Wooden Stake
	elseif isInArray(demon, itemEx.itemid) == TRUE then
		if isInArray(bws, item.actionid) == TRUE then
			skinMonster(cid, itemEx, 5906)
		else
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"This allrounder can not be used as a blessed wooden stake yet.")
		end
	elseif isInArray(vampire, itemEx.itemid) == TRUE then
		if isInArray(bws, item.actionid) == TRUE then
			skinMonster(cid, itemEx, 5905)
		else
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"This allrounder can not be used as a blessed wooden stake yet.")
		end
	end
	return TRUE
end

function skinMonster(cid,item,skin)
    local random = math.random(1,15)
    if(random < 4) then
        doPlayerAddItem(cid,skin,1)
        doSendMagicEffect(getThingPos(item.uid), CONST_ME_MAGIC_GREEN)
    else
        doSendMagicEffect(getThingPos(item.uid), CONST_ME_BLOCKHIT)
    end
    doTransformItem(item.uid,item.itemid+1)
end