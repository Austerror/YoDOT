local mount_names = {
	[1] = {"Widow Queen"},
	[2] = {"Racing Bird"},
	[3] = {"War Bear"},
	[4] = {"Black Sheep"},
	[5] = {"Midnight Panther"},
	[6] = {"Draptor"},
	[7] = {"Titanica"},
	[8] = {"Tin Lizzard"},
	[9] = {"Blazebringer"},
	[10] = {"Rapid Boar"},
	[11] = {"Stampor"},
	[12] = {"Undead Cavebear"},
	[13] = {"Mule"},
	[14] = {"Tiger Slug"},
	[15] = {"Uniwheel"},
	[16] = {"Crystal Wolf"},
	[17] = {"War Horse"},
	[18] = {"Kingly Deer"},
	[19] = {"Tamed Panda"},
	[20] = {"Dromedary"},
	[21] = {"Sandstone Scorpion"},
	[22] = {"Rented Horse"},
	[23] = {"Fire War Horse"},
	[24] = {"Shadow Draptor"},
	[25] = {"Rented Horse"},
	[26] = {"Rented Horse"},
	[27] = {"Ladybug"},
	[28] = {"Manta"},
	[29] = {"Ironblight"},
	[30] = {"Magma Crawler"},
	[31] = {"Dragonling"},
	[32] = {"Gnarlhound"},
	[33] = {"Crimson Ray"},
	[34] = {"Steelbeak"},
	[35] = {"Water Buffalo"}
}

function onSay(cid, words, param, channel)
	if(param == '') then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "1=Widow Queen, 2=Racing Bird, 3=War Bear, 4=Black Sheep, 5=Midnight Panther, 6=Draptor, 7=Titanica, 8=Tin Lizzard, 9=Blazebringer, 10=Rapid Boar, 11=Stampor, 12=Undead Cavebear, 13=Mule, 14=Tiger Slug, 15=Uniwheel, 16=Crystal Wolf, 17=War Horse, 18=Kingly Deer, 19=Tamed Panda, 20=Dromedary, 21=Sandstone Scorpion, 22=Rented Horse, 23=Fire War Horse, 24=Shadow Draptor, 25=Rented Horse, 26=Rented Horse, 27=Ladybug, 28=Manta, 29=Ironblight, 30=Magma Crawler, 31=Dragonling, 32=Gnarlhound, 33=Crimson Ray, 34=Steelbeak, 35=Water Buffalo")
		return true
	end

	local t = string.explode(param, ",")
	if(not t[2]) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Not enough params.")
		return true
	end

	local pid = getPlayerByNameWildcard(t[1])
	if(not pid or (isPlayerGhost(pid) and getPlayerGhostAccess(pid) > getPlayerGhostAccess(cid))) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player " .. t[1] .. " not found.")
		return true
	end
	t[2] = tonumber(t[2])
	if t[2] < 1 or t[2] > 26 then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Mount ID out of range (1-26).")
	else
		if getPlayerMount(pid, t[2]) == true then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player already has this mount.")
		else
			doPlayerAddMount(pid, t[2])
			doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, "You have received the " .. mount_names[t[2]][1] .. " mount.")
		end
	end
	return true
end
