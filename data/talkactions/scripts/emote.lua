function onSay(cid, words, param, channel)
		if (param ~= '') then
			doCreatureSay(cid, getCreatureName(cid) .. ' ' .. param,TALKTYPE_ORANGE_1)
			return true
		else
			return true
		end
end