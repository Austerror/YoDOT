local ct1 = {x=1064,y=1076,z=7}
local ct2 = {x=1064,y=1078,z=7}
local ct3 = {x=1064,y=1080,z=7}
local ct4 = {x=1064,y=1082,z=7}
local cookables = {13540,13541,13543,13544,13545,10603,2677,2667,2666,2671}
local ingredients = {
	[13540] = {"yellow","mana cake",6541,-25,1},
	[13541] = {"green","shield cake",6544,-25,1},
	[13543] = {"red","power cake",6542,-25,1},
	[13544] = {"purple","health cake",6545,-25,1},
	[13545] = {"blue","magic cake",6543,-25,1},
	[10603] = {"swamp grass","rice ball",11246,-5,1},
	[2677] = {"blueberry","rice ball",11246,-5,5},
	[2667] = {"fish","rice ball",11246,-5,3},
	[2666] = {"meat","rice ball",11246,-5,3},
	[2671] = {"ham","rice ball",11246,-5,2}
	}
function onUse(cid, item, fromPosition, itemEx, toPosition)
	pPos = getCreaturePosition(cid)
	--if (pPos.x == ct1.x and pPos.y == ct1.y and pPos.z == ct1.z) or (pPos.x == ct2.x and pPos.y == ct2.y and pPos.z == ct2.z) or (pPos.x == ct3.x and pPos.y == ct3.y and pPos.z == ct3.z) or (pPos.x == ct4.x and pPos.y == ct4.y and pPos.z == ct4.z) then
		if isInArray(cookables, itemEx.itemid) then
			if getPlayerSoul(cid) >= -(ingredients[itemEx.itemid][4]) then
				if getPlayerItemCount(cid,itemEx.itemid) >= ingredients[itemEx.itemid][5] then
					doPlayerAddItem(cid,ingredients[itemEx.itemid][3],1)
					doCreatureSay(cid, ingredients[itemEx.itemid][2],TALKTYPE_ORANGE_1)
					doPlayerAddSoul(cid, ingredients[itemEx.itemid][4])
					doRemoveItem(itemEx.uid,ingredients[itemEx.itemid][5])
				else
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You need ' .. ingredients[itemEx.itemid][5] .. ' x ' .. ingredients[itemEx.itemid][1] .. ' to cook that.')
				end
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You don\'t have enough soul points to cook that.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You can\'t cook that.')
		end
	--else
		--doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You can\'t cook here.')
	--end
	return TRUE
end