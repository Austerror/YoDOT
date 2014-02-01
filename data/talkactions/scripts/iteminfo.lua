function onSay(cid, words, param, channel)
	if not param then
		return doPlayerSendCancel(cid, "Invalid item name.")
	end
	
	item_id = getItemIdByName(param)
	bagCount = getPlayerItemCount(cid, item_id)
	player_id = getPlayerGUID(cid)
	local depot_items = db.getResult("SELECT SUM(count) as `sum` FROM `player_depotitems` WHERE `player_id` = " .. player_id .. " AND `itemtype` = " .. item_id)
	depot_count = depot_items:getDataInt('sum')
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have " .. bagCount .. " " .. param .. " in your backpack and " .. depot_count .. " in your depot.")
	
	return true
end