function onUse(cid, item, fromPosition, itemEx, toPosition)
	if math.abs(os.date("%j")) == getPlayerStorageValue(cid,2416) then -- last daily was set today
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have already picked this blood herb today.')
	else
		setPlayerStorageValue(cid,2416,os.date("%j")) -- set day of year for daily
		doPlayerAddItem(cid, 2798, 1)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have picked a blood herb, you may pick another one tomorrow.')
	end
	return true
end
