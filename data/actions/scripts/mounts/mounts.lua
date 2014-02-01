--taming monsters by ruda from otland
local function tameMonster(cid, item, itemEx, tame, run, broken)
	n = math.random(100)
	if n <= broken then
		doCreatureSay(cid, "The "..getItemName(item.uid).." broke.", TALKTYPE_ORANGE_1)
		doRemoveItem(item.uid)
	elseif n > broken and n <= (tame+broken) then
		doRemoveItem(item.uid)
		doCreatureSay(cid, "You tamed a "..getCreatureName(itemEx.uid)..".", TALKTYPE_ORANGE_1)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You tamed a "..getCreatureName(itemEx.uid)..".")
		return true
	elseif n > (tame+broken) and n <= (tame+broken+run) then
		doCreatureSay(cid, "The "..getCreatureName(itemEx.uid).." fled.", TALKTYPE_ORANGE_1)
		doRemoveCreature(itemEx.uid)
	else
		doCreatureSay(cid, "Try again", TALKTYPE_ORANGE_1)
	end
	return false
end

local function inArray(table, value)
	for i,v in pairs(table) do
		if (v.name == string.lower(value)) then
			return i
		end
	end
	return 0
end

local mounts = {
	{item = 13307, name = "wailing widow", id = 1, 			tame=60, run=30, broken=10}, -- Sweet Smelling Bait (widow Queen)
	{item = 13298, name = "terror bird", id = 2, 			tame=60, run=30, broken=10}, -- Carrot on a Stick (racing bird)
	{item = 5907, name = "bear", id = 3, 					tame=60, run=30, broken=10}, -- Slingshot (war bear)
	{item = 13295, name = "black sheep", id = 4,		 	tame=100, run=0, broken=0}, -- Reins (black sheep)
	{item = 13293, name = "midnight panther", id = 5, 		tame=60, run=30, broken=10}, -- Leather Whip (midnight panther)
	{item = 13294, name = "draptor", id = 6, 				tame=60, run=30, broken=10}, -- Harness (draptor)
	{item = 13305, name = "crustacea gigantica", id = 7, 	tame=60, run=30, broken=10}, -- Giant Shrimp (titanica)
	{item = 13247, name = "boar", id = 10, 					tame=60, run=30, broken=10}, -- Hunting Horn (rapid boar)
	{item = 13291, name = "undead cavebear", id = 12, 		tame=60, run=30, broken=10}, -- Maxilla Maximus
	{item = 13537, name = "donkey", id = 13, 				tame=60, run=30, broken=10}, -- Bag of Apple Slices (donkey)
	{item = 13508, name = "slug", id = 14, 					tame=60, run=30, broken=10}, -- Slug Drug (tiger slug)
	{item = 13536, name = "crystal wolf", id = 16,			tame=60, run=30, broken=10}, -- Diapason (crystal wolf)
	{item = 13939, name = "horse", id = 17,					tame=60, run=30, broken=10}, -- Sugar Oat (brown war horse)
	{item = 13539, name = "enraged white deer", id = 18,	tame=60, run=30, broken=10}, -- Golden Fir Cone (kingly deer)
	{item = 13538, name = "panda", id = 19,					tame=60, run=30, broken=10}, -- Bamboo Leaves (panda)
	{item = 13535, name = "dromedary", id = 20,				tame=60, run=30, broken=10}, -- Fist on a Stick (dromedary)
	{item = 13939, name = "grey mare", id = 25,				tame=60, run=30, broken=10}, -- Sugar Oat (grey mare)
	{item = 13498, name = "sandstone scorpion", id = 21,	tame=60, run=30, broken=10}, -- Scorpion Sceptre (sandstone scorpion)
	{item = 15546, name = "ladybug", id = 27,				tame=60, run=30, broken=10}, -- Four-Leaf Clover (ladybug)
	{item = 15545, name = "manta ray", id = 28,				tame=60, run=30, broken=10} -- Foxtail (Manta Ray Mount)
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if isCreature(itemEx.uid) then
		if inArray(mounts, getCreatureName(itemEx.uid)) > 0 then
			i = inArray(mounts, getCreatureName(itemEx.uid))
			if item.itemid == mounts[i].item and not getPlayerMount(cid, mounts[i].id) then
				if tameMonster(cid, item, itemEx, mounts[i].tame, mounts[i].run, mounts[i].broken) then
					doSendMagicEffect(fromPosition, CONST_ME_MAGIC_BLUE)
					doRemoveCreature(itemEx.uid)
					doPlayerAddMount(cid, mounts[i].id)
				else
					doSendMagicEffect(toPosition, CONST_ME_POFF)
				end
			end
		end
	end
	return true
end