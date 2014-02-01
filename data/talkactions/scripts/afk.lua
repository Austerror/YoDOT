local sayTime = 5000 -- Seconds
local say_events = {}
local function SayText(cid, reason)
    if isPlayer(cid) == TRUE then
         if say_events[getPlayerGUID(cid)] ~= nil then
             if isPlayer(cid) == TRUE then
				doCreatureSay(cid, 'AFK' .. reason,TALKTYPE_ORANGE_1)
                --doSendAnimatedText(getPlayerPosition(cid),"AFK", math.random(01,255))
             end
             say_events[getPlayerGUID(cid)] = addEvent(SayText, sayTime, cid, reason)       
         end                                                       
    end
    return TRUE
end
 
local storage = 38417
function onSay(cid, words, param, channel)
local afkCheck = getPlayerStorageValue(cid, storage)
	if getTilePzInfo(getPlayerPosition(cid)) == true then
        if (afkCheck == -1) then
			if param ~= "" then
				reason = " - " .. string.sub(param, 1, 35)
			else
				reason = ""
			end
            if (isPlayer(cid) == TRUE) then
				doCreatureSay(cid, 'AFK' .. reason,TALKTYPE_ORANGE_1)
                --doSendAnimatedText(getPlayerPosition(cid),"AFK", math.random(01,255))
            end
            say_events[getPlayerGUID(cid)] = addEvent(SayText, sayTime, cid, reason)
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "You are now AFK.")
            doCreatureSetNoMove(cid, true)
            setPlayerStorageValue(cid, storage, 1)
        else
			stopEvent(say_events[getPlayerGUID(cid)])
			say_events[getPlayerGUID(cid)] = nil
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Welcome back!")
			doCreatureSetNoMove(cid, false)
			setPlayerStorageValue(cid, storage, -1)
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "The !AFK command may only be used in a protection zone.")
	end
    return TRUE
end