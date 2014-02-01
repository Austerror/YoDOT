local origItems = {2393,2434,2430,7750,7769,7860,7875,7413,2476,2477,2475,2436,7407,2528,2515,2516,2392,2432,2487,9971,5944,2488,2498}
local itemTrans =
{
	[2393] = {5880, 10}, -- Giant Sword -> Iron Ore (10).
	[2434] = {5880, 1}, -- Dragon Hammer -> Iron Ore (1).
	[2430] = {5880, 1}, -- Knight Axe -> Iron Ore (1).
	[7750] = {5880, 1}, -- Knight Axe (fire) -> Iron Ore (1).
	[7769] = {5880, 1}, -- Knight Axe (ice) -> Iron Ore (1).
	[7860] = {5880, 1}, -- Knight Axe (earth) -> Iron Ore (1).
	[7875] = {5880, 1}, -- Knight Axe (energy) -> Iron Ore (1).
	[2515] = {5880, 1}, -- Guardian Shield -> Iron Ore (1).
	[2516] = {5880, 2}, -- Dragon Shield -> Iron Ore (2).
	[2392] = {5880, 2}, -- Fire Sword -> Iron Ore (2).
	[7413] = {5880, 2}, -- Titan Axe -> Iron Ore (2).
	[2476] = {5880, 2}, -- Knight Armor -> Iron Ore (2).
	[2477] = {5880, 2}, -- Knight Legs -> Iron Ore (2).
	[2475] = {5885, 1}, -- Warrior Helmet -> Warrior's Sweat (1).
	[2436] = {5880, 3}, -- Skull Staff -> Iron Ore (3).
	[7407] = {5880, 4}, -- Haunted Balde -> Iron Ore (4).
	[2528] = {5880, 4}, -- Tower Shield -> Iron Ore (4).
	[2432] = {5880, 4}, -- Fire Axe -> Iron Ore (4).
	[2487] = {5887, 1}, -- Crown Armor -> Piece of Royal Steel (1).
	[9971] = {13941, 1}, -- Gold Ingot -> Cup of Molten Gold (1).
	[5944] = {6529, 2}, -- Soul Orb -> Infernal Bolt (2).
	[2498] = {8182, 1}, -- Royal Helmet -> Fighting Spirit (1).
	[2488] = {5887, 1} -- Crown Legs -> Piece of Royal Steel (1).
}
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == 10029 then
		doTransformItem(item.uid, 10030)
		itemPos = {x = 1081, y = 1067, z = 5, stackpos=255}

		itemThing = getThingFromPos(itemPos)
		
		if isInArray(origItems, itemThing.itemid) then
			doTransformItem(itemThing.uid, itemTrans[itemThing.itemid][1],itemTrans[itemThing.itemid][2])
			doSendMagicEffect(itemPos, CONST_ME_HOLYAREA)
		end
	else
		doTransformItem(item.uid, 10029)
	end
	return true
end