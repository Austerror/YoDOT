function onStepIn(cid, item, position, fromPosition)
	if getTilePzInfo(position) == TRUE then
		getDepotItems(cid, item)
	end
	return TRUE
end

function getDepotItems(cid, item)
	if item.actionid > 100 then
		if isPlayer(cid) == TRUE then
			depotItems = getPlayerDepotItems(cid, item.actionid - 100)
			if depotItems < 2 then
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Your depot contains 1 item.")
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Your depot contains " ..depotItems.. " items.")
			end
		end
	end
	return TRUE
end