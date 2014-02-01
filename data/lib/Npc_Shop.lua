_config_npc_shop = {
	ShowMyItems_shop = true, -- It will show their own items in trade in shop
	each_deposit = 25, -- How much will it cost to add item to shop
	days_limit = 7, -- Limit of days that the npc will sell your item
	items_limit = 20, -- Max items q vc may deposit in npc
	items_block = {2160,2152,2148}, -- Items that the npc will not sell
	WithDraw_storage = 725201 -- storage id
}

function doSetDepositNpc(player, amount, type)
	local query = db.getResult("SELECT `value` FROM `player_storage` WHERE `player_id` = ".. player .." AND `key` = ".. _config_npc_shop.WithDraw_storage)
	if query:getID() ~= -1 then
		return db.executeQuery("UPDATE `player_storage` SET `value` = `value` "..(type == "add" and "+" or "-").." "..amount .." WHERE `player_id` = ".. player .." AND `key` = ".. _config_npc_shop.WithDraw_storage)
	end
end

function getDepositNpc(cid)
	return getPlayerStorageValue(cid, _config_npc_shop.WithDraw_storage)
end

function getItemByName(name)
    local items = io.open("data/items/items.xml", "r"):read("*all")
    local get = items:match('name="' .. name ..'"')
    if get == nil or get == "" then
        return false
    end
return true
end

function getItemType(itemid)
    local slottypes = {"head", "body", "legs", "feet", "shield", "sword","wand", "club", "axe", "distance", "ammunition"}
    local arq = io.open("data/items/items.xml", "r"):read("*all")
    local attributes = arq:match('<item id="' .. itemid .. '".+name="' .. getItemNameById(itemid) ..'">(.-)</item>')
    if attributes == nil or attributes == "" then
        return "others"
    end
    local slot = ""
    for i,x in pairs(slottypes) do
        if attributes:find(x) then
                slot = x
                    break
            end
    end
    if slot == "body" then slot = "armor" end
	if slot == "" or slot == nil then slot = "others" end
return slot
end

function getRowsShopByPlayer(player_id)
	local qry,s = db.getResult("SELECT `player_id` FROM `shop_npc` WHERE `player_id` = "..player_id),0
	if(qry:getID() ~= -1) then
		repeat
			s = s + 1
		until not(qry:next())
		qry:free()
	end
	return s
end

function isItemInShop(id, amount)
	local info = db.getResult("SELECT `item_id`,`count` FROM `shop_npc` WHERE `id` = "..id)
	if(info:getID() ~= -1) then
		return info:getDataInt("count") < amount and false or true
	end
	return false 
end

function doDeleteShopItem(id)
	local info = db.getResult("SELECT `item_id` FROM `shop_npc` WHERE `id` = "..id)
	if(info:getID() ~= -1) then
		return db.executeQuery("DELETE FROM `shop_npc` WHERE `id` = "..id)
	end
	return false 
end

function doAddItemShop(cid, itemid, amount, type, price)
	return db.executeQuery("INSERT INTO `shop_npc` (`player_id`, `item_id`, `count`, `type`, `price`, `date`, `item_name`) VALUES ('".. getPlayerGUID(cid).."', '".. itemid .."', '".. amount .."', '".. type .."', '".. price .."','".. os.time() .."', '"..getItemNameById(itemid).."');")
end

function doRemoveShopItem(id, amount)
	local info = db.getResult("SELECT `count` FROM `shop_npc` WHERE `id` = "..id)
	if(info:getID() ~= -1) then
		return db.executeQuery("UPDATE `shop_npc` SET `count` = `count` - "..amount.." WHERE id = "..id)
	end
	return false 
end

function getPlayerByShopID(id)
	local qry = db.getResult("SELECT `player_id` FROM `shop_npc` WHERE id = "..id)
	if(qry:getID() ~= -1) then
		return getPlayerNameByGUID(qry:getDataInt("player_id"))
	end
	return false
end

function doPlayerAddDepotItem(pid, item, count)
local item,count = {item},{(count or 1)}
    for k,v in ipairs(item) do
		local ls = db.getResult("SELECT `sid` FROM `player_depotitems` WHERE `player_id` = "..pid.." ORDER BY `sid` DESC LIMIT 1")
		return db.executeQuery("INSERT INTO `player_depotitems` (`player_id`, `sid`, `pid`, `itemtype`, `count`, `attributes`) VALUES ("..pid..", "..(ls:getDataInt("sid")+1)..", 101, "..v..", "..count[k]..", '')") or false
    end
end
---------- offline messages --------------
		OfflineMessagesConfig = {
			separatorAfterNickname = ',',
			messageSavingDirectory = 'data/logs/offline_msg.txt', -- dir with saved messages (folder must exsist!)
			delayBeetwenShowMessageOnLogin = 750, -- delay in ms to show received messages on login, to deactivate type 0
			messageFormatString = '[%s] %s: %s', -- date, author, message
			dateFormatString = '%d.%m.%Y %H:%M:%S' -- date string format
		}