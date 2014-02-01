local buff_food =
{
	[6541] = {1, "Nom."}, -- Yellow (MANA)
	[6542] = {1, "Nom."}, -- Red (Melee)
	[6543] = {1, "Nom."}, -- Blue (ML)
	[6544] = {1, "Nom."}, -- Green (Shield)
	[6545] = {1, "Nom."} -- Purple (HEALTH)
}

local yellow = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(yellow, CONDITION_PARAM_SUBID, 5)
setConditionParam(yellow, CONDITION_PARAM_TICKS, 10 * 60 * 3000) -- 30 minutes
setConditionParam(yellow, CONDITION_PARAM_STAT_MAXMANAPOINTSPERCENT, 110)
setConditionParam(yellow, CONDITION_PARAM_BUFF, true)

local purple = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(purple, CONDITION_PARAM_SUBID, 5)
setConditionParam(purple, CONDITION_PARAM_TICKS, 10 * 60 * 3000) -- 30 minutes
setConditionParam(purple, CONDITION_PARAM_STAT_MAXHITPOINTSPERCENT, 110)
setConditionParam(purple, CONDITION_PARAM_STAT_MAXMANAPOINTSPERCENT, 110)
setConditionParam(purple, CONDITION_PARAM_BUFF, true)

local red = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(red, CONDITION_PARAM_SUBID, 5)
setConditionParam(red, CONDITION_PARAM_TICKS, 10 * 60 * 3000) -- 30 minutes
setConditionParam(red, CONDITION_PARAM_SKILL_MELEEPERCENT, 105)
setConditionParam(red, CONDITION_PARAM_SKILL_DISTANCEPERCENT, 105)
setConditionParam(red, CONDITION_PARAM_STAT_MAXHITPOINTSPERCENT, 110)
setConditionParam(red, CONDITION_PARAM_STAT_MAXMANAPOINTSPERCENT, 110)
setConditionParam(red, CONDITION_PARAM_BUFF, true)

local green = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(green, CONDITION_PARAM_SUBID, 5)
setConditionParam(green, CONDITION_PARAM_TICKS, 10 * 60 * 3000) -- 30 minutes
setConditionParam(green, CONDITION_PARAM_SKILL_SHIELDPERCENT, 105)
setConditionParam(green, CONDITION_PARAM_STAT_MAXHITPOINTSPERCENT, 110)
setConditionParam(green, CONDITION_PARAM_STAT_MAXMANAPOINTSPERCENT, 110)
setConditionParam(green, CONDITION_PARAM_BUFF, true)

local blue = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(blue, CONDITION_PARAM_SUBID, 5)
setConditionParam(blue, CONDITION_PARAM_TICKS, 10 * 60 * 3000) -- 30 minutes
setConditionParam(blue, CONDITION_PARAM_STAT_MAGICPOINTSPERCENT, 105)
setConditionParam(blue, CONDITION_PARAM_STAT_MAXHITPOINTSPERCENT, 110)
setConditionParam(blue, CONDITION_PARAM_STAT_MAXMANAPOINTSPERCENT, 110)
setConditionParam(blue, CONDITION_PARAM_BUFF, true)


function onUse(cid, item, fromPosition, itemEx, toPosition)

	--if (getPlayerFood(cid) + buff_food[item.itemid][1]) >= 600 then
		--doPlayerSendCancel(cid, "You are full.")
	--else
		--doPlayerFeed(cid, buff_food[item.itemid][1])
		doCreatureSay(cid, buff_food[item.itemid][2], TALKTYPE_ORANGE_1)
		if item.itemid == 6541 then
			doAddCondition(cid, yellow)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Your mana has been increased by 10% for the next 30 minutes.")
		elseif item.itemid == 6542 then
			doAddCondition(cid, red)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Your aggressive skills have been increased by 5% for the next 30 minutes.")
		elseif item.itemid == 6543 then
			doAddCondition(cid, blue)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Your magic level has been increased by 5% for the next 30 minutes.")
		elseif item.itemid == 6544 then
			doAddCondition(cid, green)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Your shielding skill has been increased by 5% for the next 30 minutes.")
		elseif item.itemid == 6545 then
			doAddCondition(cid, purple)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Your hit points have been increased by 10% for the next 30 minutes.")
		end
		doRemoveItem(item.uid, 1)
		setPlayerStorageValue(cid,2347,os.time() + 1800)
		doPlayerFeed(cid, 100)
	--end

	return true
end