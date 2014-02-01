local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end
local talkUser,msg = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid,string.lower(msg)
local weaponsTypes = {"head", "armor", "legs", "feet", "shield", "sword", "wand", "rod", "club", "axe", "distance", "ammunition", "others"}
if isInArray({'apprise', 'check', 'items', 'item', 'list'}, msg) then
local qry,k,str = db.getResult("SELECT `item_id`, `count`, `price` FROM `shop_npc` WHERE `player_id` = "..getPlayerGUID(cid)),0,"My Items Deposited:\n\n"
if(qry:getID() ~= -1) then
repeat
k = k + 1
str = str..""..qry:getDataInt("count").." "..getItemNameById(qry:getDataInt("item_id")).." - "..qry:getDataInt("price").." Gps "..(tonumber(qry:getDataInt("count")) > 1 and "Each" or "").."\n"
until not (qry:next()) or k >= _config_npc_shop.items_limit
qry:free()
doPlayerPopupFYI(cid, str)
else
selfSay("You do not have any items listed on the auction house.", cid)
end
elseif isInArray({'report', 'withdraw', 'collect'}, msg) then
if getDepositNpc(cid) <= 0 then
selfSay("Sorry, but your balance is 0 gold.", cid)
else
selfSay("You have "..getDepositNpc(cid).." gold deposited, how much do you want to withdraw?", cid)
talkState[talkUser] = 8
end
elseif talkState[talkUser] == 8 then
if tonumber(msg) and tonumber(msg) > 0 and tonumber(msg) <= getDepositNpc(cid) then
setPlayerStorageValue(cid, _config_npc_shop.WithDraw_storage, (getDepositNpc(cid)-tonumber(msg)))
doPlayerAddMoney(cid, tonumber(msg))
selfSay("You withdrew "..msg.." gold. You now you have a balance of "..getDepositNpc(cid).." gold in the auction house.", cid)
talkState[talkUser] = 0
else
selfSay("You can not remove that amount.", cid)
talkState[talkUser] = 0
end
elseif isInArray({'auction', 'deposit', 'depositar', 'sell', 'selling','vender'}, msg) then
if getRowsShopByPlayer(getPlayerGUID(cid)) < _config_npc_shop.items_limit then
selfSay('Which item you want to place on the auction house?', cid)
talkState[talkUser] = 2
else
selfSay('Sorry, you can only add '.._config_npc_shop.items_limit..' items at a time.', cid)
talkState[talkUser] = 0 
end  
elseif talkState[talkUser] == 2 then
name,item = msg,getItemByName(msg)
if msg == '' or tonumber(msg) or not item then
talkState[talkUser] = 0 
selfSay("This item does not exist.", cid) return true
elseif not isItemMovable(item) or isInArray(_config_npc_shop.items_block, getItemIdByName(name))  then
talkState[talkUser] = 0 
selfSay("You can not add this item.", cid) return true
end
item = getItemIdByName(name)
selfSay('How many of that item would you like to auction?', cid)
talkState[talkUser] = 3
elseif talkState[talkUser] == 3 then
if tonumber(msg) and tonumber(msg) > 0 and tonumber(msg) <= 100 and getPlayerItemCount(cid, item) >= tonumber(msg) then
count = tonumber(msg)
selfSay('Very well, how much should each item cost?', cid)
talkState[talkUser] = 4
else
selfSay(getPlayerItemCount(cid, item) < tonumber(msg) and 'Sorry, but you not have '..msg..' items to deposit' or 'Enter a valid number from 1 to 100.', cid)
end
elseif talkState[talkUser] == 4 then
if tonumber(msg) and tonumber(msg) > 0 and tonumber(msg) < 9999999 then
price = msg
selfSay('You really want to put {'..count..' '..name..'} at {'..price..'} gps '..(count > 1 and 'each' or '')..' on the auction house? This will cost '.. _config_npc_shop.each_deposit ..' gold, ok? {yes}', cid)
talkState[talkUser] = 6
else
selfSay('Choose a valid number.', cid)
end
elseif msgcontains(msg, "yes") and talkState[talkUser] == 6 then
if doPlayerRemoveMoney(cid, _config_npc_shop.each_deposit) then
item,price = getItemIdByName(name),price
if doPlayerRemoveItem(cid, item, count) then
doAddItemShop(cid, item, count, getItemType(item), tonumber(price))
selfSay('Congratulations, the item was successfully added to the list and will be sold until: '..os.date("%d %B %Y %X ", (os.time() + _config_npc_shop.days_limit*24*60*60))..'.', cid)
talkState[talkUser] = 0
else
selfSay('Sorry, auction could not be placed because you do not have the items.', cid)
talkState[talkUser] = 0
end
else
selfSay('Sorry, but you do not have enough gold to auction this item.', cid)
talkState[talkUser] = 0
end
elseif isInArray({'trade', 'comprar', 'buy', 'buying', 'shop'}, msg) then
selfSay('What type of item you want to buy: {head}, {armor}, {legs}, {feet}, {shield}, {sword}, {wand}, {rod}, {club}, {axe}, {distance}, {ammunition} or {others} ?', cid)
talkState[talkUser] = 7    
elseif talkState[talkUser] == 7 then
if isInArray(weaponsTypes, msg) then
if msg == "rod" then msg = "wand" end
local qry,trade,show = db.getResult("SELECT `id`, `player_id`, `item_id`, `count`, `price`  FROM `shop_npc` WHERE `type` = "..db.escapeString(msg)),{},true
if(qry:getID() ~= -1) then
repeat
if not _config_npc_shop.ShowMyItems_shop and qry:getDataInt("player_id") == getPlayerGUID(cid) then
show = false
end
if show == true then
table.insert(trade,{id= qry:getDataInt("item_id"), buy= qry:getDataInt("price"), db= qry:getDataInt("id"), name= getItemNameById(qry:getDataInt("item_id")), amount = qry:getDataInt("count")})
end
until not(qry:next())
qry:free()
else
selfSay('Sorry, but there are no items of that type at the moment.', cid) return true
end
local items = {}  
    for _, item in ipairs(trade) do
    items[item.id] = {item_id = item.id, buyPrice = item.buy, changeDb = item.db, subType = item.amount, realName = item.name}
end 
	local onBuy = function(cid, item, subType, amount, ignoreCap, inBackpacks)  
	    if items[item].buyPrice ~= 0 and amount <= items[item].subType then
	    if isItemInShop(items[item].changeDb, amount) then
	        doPlayerRemoveMoney(cid, amount * items[item].buyPrice)
            if isItemStackable(items[item].item_id) then
            doPlayerAddItem(cid, items[item].item_id, amount) 
            else
	        for i = 1, amount do 
	            doPlayerAddItem(cid, items[item].item_id, 1)  
	        end
	        end
	        local player,sell_price = getPlayerByNameWildcard(getPlayerByShopID(items[item].changeDb)),amount*items[item].buyPrice
	        if(not player) then
             doSetDepositNpc(getPlayerGUIDByName(getPlayerByShopID(items[item].changeDb)), sell_price, "add")
         local file = io.open(OfflineMessagesConfig.messageSavingDirectory .. getPlayerByShopID(items[item].changeDb) .. '.Gandhi', 'a+')
		if(not file) then return true end
		local msgfrom, msgoff = "[Npc Auction]",{"Were sold "..amount.." "..getItemNameById(items[item].item_id).." and you received "..sell_price.." gps by items."}
		file:write(OfflineMessagesConfig.messageFormatString:format(os.date(OfflineMessagesConfig.dateFormatString), msgfrom, table.concat(msgoff, OfflineMessagesConfig.separatorAfterNickname)) .. '\n')
		file:close()
             else
             setPlayerStorageValue(player,_config_npc_shop.WithDraw_storage, getDepositNpc(player)+sell_price)
	         doPlayerSendTextMessage(player, MESSAGE_STATUS_CONSOLE_ORANGE,"[Npc Auction] Were sold "..amount.." "..getItemNameById(items[item].item_id).." and you received "..sell_price.." gps by items.")  
             end
	        if amount == items[item].subType then
            doDeleteShopItem(items[item].changeDb)
            else
            doRemoveShopItem(items[item].changeDb, amount)
            end
            closeShopWindow(cid)
            else
           selfSay('I\'m sorry but this item has just been purchased.', cid)
           closeShopWindow(cid)
	    end           
	        else
         selfSay('You can only buy up to '..items[item].subType..' units of this item.', cid)
	    end 
	end 
     openShopWindow(cid, trade, onBuy, onSell) 
     else
     selfSay('I do not sell this item type.', cid)
     end
     elseif msg == "no" and talkState[talkUser] >= 1 then
     selfSay("No problem.", cid)
     talkState[talkUser] = 0
     npcHandler:releaseFocus(cid)
     end  
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())