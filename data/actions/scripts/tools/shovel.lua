local holes = {468, 481, 483, 7932}
local rope = {2648,2649,2650,2651,2652,2653,2654,2655,2656,2657,2658,2659,2660,2661,2662,2663,2664,2665,2666,2667,2668,2669,2670,2671,2672,2673,2674,2675,2676,2677,2678,2679}
local shovel = {2632,2633,2634,2635,2636,2637,2638,2639,2640,2641,2642,2643,2644,2645,2646,2647,2664,2665,2666,2667,2668,2669,2670,2671,2672,2673,2674,2675,2676,2677,2678,2679}
local pick = {2625,2626,2627,2628,2629,2630,2631,2640,2641,2642,2643,2644,2645,2646,2647,2656,2657,2658,2659,2660,2661,2662,2663,2672,2673,2674,2675,2676,2677,2678,2679,2680}
local machete = {2621,2622,2623,2624,2628,2629,2630,2631,2636,2637,2638,2639,2644,2645,2646,2647,2652,2653,2654,2655,2660,2661,2662,2663,2668,2669,2670,2671,2676,2677,2678,2679}
local obknife = {2619,2620,2623,2624,2626,2627,2630,2631,2634,2635,2638,2639,2642,2643,2646,2647,2650,2651,2654,2655,2658,2659,2662,2663,2666,2667,2670,2671,2674,2675,2678,2679}
local bws = {2618,2620,2622,2624,2625,2627,2629,2631,2633,2635,2637,2639,2641,2643,2645,2647,2649,2651,2653,2655,2657,2659,2661,2663,2665,2667,2669,2671,2673,2675,2677,2679}
local isRope = 0
local isShovel = 0
local isPick = 0
local isMachete = 0
local isObknife = 0
local isBws = 0
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if isInArray(holes, itemEx.itemid) == TRUE then
		doTransformItem(itemEx.uid, itemEx.itemid + 1)
		doDecayItem(itemEx.uid)
	--elseif itemEx.itemid == 231 then
		--local rand = math.random(1, 100)
		--if rand == 1 then
			--doCreateItem(2159, 1, toPosition)
		--elseif rand > 95 then
			--doSummonCreature("Scarab", toPosition)
		--end
		--doSendMagicEffect(toPosition, CONST_ME_POFF)
	--else
		--return FALSE
	elseif item.itemid == 5710 and itemEx.itemid == 10515 and isInArray(shovel, item.actionid) == false then
		doRemoveItem(item.uid,1)
		trainAllrounder(cid,itemEx)
		doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"Success! Your allrounder can now be used as a shovel.")
	end
	return TRUE
end

function trainAllrounder(cid,itemEx)

		if isInArray(rope, item.actionid) == true then
			isRope = 1
		end
		if isInArray(pick, item.actionid) == true then
			isPick = 1
		end
		if isInArray(machete, item.actionid) == true then
			isMachete = 1
		end
		if isInArray(obknife, item.actionid) == true then
			isObknife = 1
		end
		if isInArray(bws, item.actionid) == true then
			isBws = 1
		end
		if isRope == 1 and isPick == 1 and isMachete == 1 and isObknife == 1 and isBws == 1 then
			doSetItemActionId(itemEx.uid,2679)
		end
end