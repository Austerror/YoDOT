function onSay(cid, words, param, channel)
	local t = string.explode(param, ",")
	local items = {
		{2160, 99},
		{2152, 59}
	}
	doPlayerAddDepotItems(t[1], t[2], t[3], TRUE) 
	return true
end

function doPlayerAddDepotItems(name, town, items, notify)
	local mailBoxPos = {x = 1043, y = 1008, z = 7}

	local parcel = doCreateItemEx(2595)

	local label = doAddContainerItem(parcel, 2599)
	doSetItemText(label, name .."\n".. town)

	for i = 1, #items do
		doAddContainerItem(parcel, items[i][1], items[i][2])
	end

	doTeleportThing(parcel, mailBoxPos)

	if (notify == TRUE) then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "New mail arrived.")
	end
	return true
end