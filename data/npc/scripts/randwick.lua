local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)


function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
	local sexoffer = {
		[0] = {
			name = 'male',
			id = 1
		},
		[1] = {
			name = 'female',
			id = 0
		}
	}
	local shopWindow = {}
	local t = {
		[2003] = {price = 1}, -- Grey Backpack
		[2004] = {price = 1}, -- Golden Backpack
		[2365] = {price = 3}, -- Backpack of Holding
		[3940] = {price = 1}, -- Camouflage Backpack
		[5801] = {price = 2}, -- Jewelles Backpack
		[9774] = {price = 1}, -- Brocade Backpack
		[10519] = {price = 1}, -- Orange Backpack
		[10522] = {price = 1}, -- Crown Backpack
		[11119] = {price = 1}, -- Heart Backpack
		[11241] = {price = 1}, -- Expedition Backpack
		[11243] = {price = 1}, -- Dragon Backpack
		[15646] = {price = 1}, -- Buggy Backpack
		[8976] = {price = 2}, -- Golden Falcon
		[18526] = {price = 2} -- Dragon Eye
	}
	local onBuy = function(cid, item, subType, amount, ignoreCap, inBackpacks)
		if  t[item] and not (getAccountPoints(cid) >= t[item].price) then
			selfSay("Sorry, but you do not have enough Tokens to buy a " .. getItemNameById(item) .. ". Why not consider donating on the {website}.", cid)
		else
			doPlayerAddItem(cid, item)
			doRemovePoints(cid, t[item].price)
			selfSay("Here's your " .. getItemNameById(item) .. "!", cid)
		end
		return true
		end
		if (msgcontains(msg, 'trade') or msgcontains(msg, 'TRADE'))then
		for var, ret in pairs(t) do
		table.insert(shopWindow, {id = var, subType = 0, buy = ret.price, sell = 0, name = getItemNameById(var)})
		end
		openShopWindow(cid, shopWindow, onBuy, onSell)
	end
	if msgcontains(msg, 'other') then
		npcHandler:say('I also provide the following items: {change sex} - 1 token, {nobleman addons} - 2 Tokens, {crimson ray mount} - 5 tokens, {ladybug mount} - 3 Tokens.', cid)
	elseif msgcontains(msg, 'noble') then
		if canPlayerWearOutfit(cid, 132, 3) or canPlayerWearOutfit(cid, 140, 3) then
			npcHandler:say('You already have the nobleman addons.', cid)
		else
			npcHandler:say('Would you like me to grant you the {nobleman addons} for 2 Tokens? This is both Nobleman and Noblewoman addons.', cid)
			talkState = 1
		end
	elseif msgcontains(msg, 'yes') and talkState == 1 then
		if getAccountPoints(cid) >= 2 then
			doRemovePoints(cid, 2)
			doSendMagicEffect(getCreaturePosition(cid), 12)
			doPlayerAddOutfit(cid,132,3) -- m
			doPlayerAddOutfit(cid,140,3) -- f
			npcHandler:say('There you go, the nobleman addons.', cid)
			talkState = 0
		else
			npcHandler:say('Sorry, but you do not have 2 Tokens. Why not consider donating on the {website}.', cid)
			talkState = 0
		end
	elseif msgcontains(msg, 'crimson') then
		if getPlayerMount(cid,33) == true then
			npcHandler:say('You already have the crimson ray mount.', cid)
		else
			npcHandler:say('Would you like me to grant you the {crimson ray mount} for 5 Tokens?', cid)
			talkState = 2
		end
	elseif msgcontains(msg, 'yes') and talkState == 2 then
		if getAccountPoints(cid) >= 5 then
			doRemovePoints(cid, 5)
			doSendMagicEffect(getCreaturePosition(cid), 12)
			doPlayerAddMount(cid, 33)
			npcHandler:say('There you go, the crimson mount.', cid)
			talkState = 0
		else
			npcHandler:say('Sorry, but you do not have 5 Tokens. Why not consider donating on the {website}.', cid)
			talkState = 0
		end
	elseif msgcontains(msg, 'change sex') then
		npcHandler:say('Would you like to become a ' .. sexoffer[getPlayerSex(cid)].name .. ' for 1 token?', cid)
		talkState = 3
	elseif msgcontains(msg, 'yes') and talkState == 3 then
		if getAccountPoints(cid) >= 1 then
			doPlayerSetSex(cid, sexoffer[getPlayerSex(cid)].id)
			npcHandler:say('There you go, a ' .. sexoffer[getPlayerSex(cid)].name .. '.', cid)
			doRemovePoints(cid, 1)
			doSendMagicEffect(getCreaturePosition(cid), 12)
			talkState = 0
		else
			npcHandler:say('Sorry, but you do not have 1 Token. Why not consider donating on the {website}.', cid)
			talkState = 0
		end
	elseif msgcontains(msg, 'ladybug mount') then
		if getPlayerMount(cid,27) == true then
			npcHandler:say('You already have the ladybug mount.', cid)
		else
			npcHandler:say('Would you like me to grant you the {ladybug mount} for 3 Tokens?', cid)
			talkState = 4
		end
	elseif msgcontains(msg, 'yes') and talkState == 4 then
		if getAccountPoints(cid) >= 3 then
			doRemovePoints(cid, 3)
			doSendMagicEffect(getCreaturePosition(cid), 12)
			doPlayerAddMount(cid, 27)
			npcHandler:say('There you go, the crimson mount.', cid)
			talkState = 0
		else
			npcHandler:say('Sorry, but you do not have 3 Tokens. Why not consider donating on the {website}.', cid)
			talkState = 0
		end

	elseif msgcontains(msg, 'no') and talkState > 0 then
		npcHandler:say('Perhaps something else?', cid)
		talkState = 0
	elseif msgcontains(msg, 'website') then
		npcHandler:say('You can donate to Years of Decay at http://yod.austerror.com/donate.php which will reward you with Yodot Tokens as a thank you.', cid)
	end
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())