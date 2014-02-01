function getCount(msg)
	local ret = -1
	local b, e = string.find(msg, "%d+")
	if b ~= nil and e ~= nil then
	ret = tonumber(string.sub(msg, b, e))
	end
	if ret > 10000000 then
		return 10000000
	end
	return ret
end

function msgcontains(message, keyword)
	local a, b = string.find(message:lower(), keyword:lower())
	if a == nil or b == nil then
		return false
	end
	return true
end

function addCoin(cid, itemid, count)
	if count > 100 then
		while(count > 100) do
			cash = doCreateItemEx(itemid, 100)
			doPlayerAddItemEx(cid, cash, 1)
			count = count - 100
		end
	end
	if count > 0 then
		cash = doCreateItemEx(itemid, count)
		doPlayerAddItemEx(cid, cash, 1)
	end
end

function doPlayerExist(name)
	local result = db.getResult("SELECT `name` FROM `players` WHERE `name` = " .. db.escapeString(name))
	if (result:getID() ~= -1) then
		local return_name = result:getDataString("name")
		result:free()
		return return_name
	end
	return 0
end

local GOLD_COIN = 2148
local PLATINUM_COIN = 2152
local CRYSTAL_COIN = 2160

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local talk_state = {}

function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)             end
function onCreatureDisappear(cid)
	talk_state[cid] = nil
	npcHandler:onCreatureDisappear(cid)
end
function onCreatureSay(cid, type, msg)         npcHandler:onCreatureSay(cid, type, msg)     end
function onThink()                             npcHandler:onThink()                         end

npcHandler:setMessage(MESSAGE_GREET, "Welcome to the bank of Thane |PLAYERNAME|.")

local last_count = {}
local last_name = {}
function creatureSayCallback(cid, type, msg)
	local orginal_msg = msg
	msg = string.lower(msg)
	if(not npcHandler:isFocused(cid)) then
		talk_state[cid] = 0
		return false
	end
	local sayText = ""
	if talk_state[cid] == nil then
		talk_state[cid] = 0
		last_count[cid] = 0
		last_name[cid] = ""
	end
	-- select action
	if msgcontains(msg, 'change') and talk_state[cid] ~= 41 then
		talk_state[cid] = 10
		sayText = 'We exchange gold, platinum and crystal coins.'
	elseif msgcontains(msg, 'balance') and talk_state[cid] ~= 41 then
		talk_state[cid] = 0
		local balance = getPlayerBalance(cid)
		if balance == 0 then
			sayText = 'Your bank account is empty.'
		elseif balance <= 100000 then
			sayText = 'Your account balance is ' .. balance .. ' gold coins.'
		elseif balance <= 1000000 then
			sayText = 'Your account balance is ' .. balance .. ' gold coins.'
		else  
			sayText = 'Your account balance is ' .. balance .. ' gold coins.'
		end
	elseif msgcontains(msg, 'deposit') and talk_state[cid] ~= 41 then
		talk_state[cid] = 20
		sayText = 'How much gold you would like to deposit?'
	elseif msgcontains(msg, 'withdraw') and talk_state[cid] ~= 41 then
		talk_state[cid] = 30
		sayText = 'How much gold you would like to withdraw?'
	elseif msgcontains(msg, 'transfer') and talk_state[cid] ~= 41 then
		talk_state[cid] = 40
		sayText = 'How much gold you would like to transfer?'
	end
	--  change
	if talk_state[cid] == 10 then
		if msgcontains(msg, 'platinum') then
			talk_state[cid] = 12
			sayText = 'Do you want to change your platinum coins to gold or crystal?'
		elseif msgcontains(msg, 'gold') then
			talk_state[cid] = 11
			sayText = 'How many platinum coins do you want to get?'
		elseif msgcontains(msg, 'crystal') then
			talk_state[cid] = 13
			sayText = 'How many crystal coins do you want to change to platinum?'
		end
	end
	if talk_state[cid] >= 11 and talk_state[cid] <= 13 then
		if talk_state[cid] == 11 and getCount(msg) > 0 then
			talk_state[cid] = 14
			last_count[cid] = getCount(msg)
			sayText = 'Should I change ' .. getCount(msg) * 100 .. ' of your gold coins to ' .. getCount(msg) .. ' platinum coins for you?'
		elseif talk_state[cid] == 12 then
			if msgcontains(msg, 'gold') then
				talk_state[cid] = 15
				sayText = 'How many platinum coins do you want to change to gold?'
			elseif msgcontains(msg, 'crystal') then
				talk_state[cid] = 16
				sayText = 'How many crystal coins do you want to get?'
			end
		elseif talk_state[cid] == 13 and getCount(msg) > 0 then
			talk_state[cid] = 17
			last_count[cid] = getCount(msg)
			sayText = 'Should I change ' .. getCount(msg) .. ' of your crystal coins to ' .. getCount(msg)*100 .. ' platinum coins for you?'
		end
	end
	if talk_state[cid] >= 14 and talk_state[cid] <= 17 then
		if talk_state[cid] == 14 and getCount(msg) <= 0 then
			if msgcontains(msg, 'yes') then
				if math.floor(getPlayerItemCount(cid, GOLD_COIN) / 100) >= last_count[cid] then
					doPlayerRemoveItem(cid, GOLD_COIN, last_count[cid] * 100)
					addCoin(cid, PLATINUM_COIN, last_count[cid])
					sayText = 'Here you are.'
				else
					sayText = 'You don\'t have ' .. last_count[cid] * 100 .. ' gold coins.'
				end
			else
				sayText = 'Well, may I help you with something else?'
			end
			talk_state[cid] = 0
		elseif talk_state[cid] == 15 and getCount(msg) > 0 then
			talk_state[cid] = 18
			last_count[cid] = getCount(msg)
			sayText = 'So I should change ' .. getCount(msg) .. ' of your platinum coins to ' .. getCount(msg) * 100 .. ' gold coins for you?'
		elseif talk_state[cid] == 16 and getCount(msg) > 0 then
			talk_state[cid] = 19
			last_count[cid] = getCount(msg)
			sayText = 'So I should change ' .. getCount(msg) * 100 .. ' of your platinum coins to ' .. getCount(msg) .. ' crystal coins for you?'
		elseif talk_state[cid] == 17 and getCount(msg) <= 0 then
			if msgcontains(msg, 'yes') then
				if getPlayerItemCount(cid, CRYSTAL_COIN) >= last_count[cid] then
					doPlayerRemoveItem(cid, CRYSTAL_COIN, last_count[cid])
					addCoin(cid, PLATINUM_COIN, last_count[cid] * 100)
					sayText = 'Here you are.'
				else
					sayText = 'You don\'t have ' .. last_count[cid] .. ' crystal coins.'
				end
			else
				sayText = 'Well, may I help you with something else?'
			end
			talk_state[cid] = 0
		end
	end
	if talk_state[cid] >= 18 and talk_state[cid] <= 19 then
		if talk_state[cid] == 18 and getCount(msg) <= 0 then
			if msgcontains(msg, 'yes') then
				print(2)
				if getPlayerItemCount(cid, PLATINUM_COIN) >= last_count[cid] then
					doPlayerRemoveItem(cid, PLATINUM_COIN, last_count[cid])
					addCoin(cid, GOLD_COIN, last_count[cid] * 100)
					sayText = 'Here you are.'
				else
					sayText = 'You don\'t have ' .. last_count[cid] .. ' platinum coins.'
				end
			else
				sayText = 'Well, can I help you with something else?'
			end
			talk_state[cid] = 0
		elseif talk_state[cid] == 19 and getCount(msg) <= 0 then
			if msgcontains(msg, 'yes') then
				if math.floor(getPlayerItemCount(cid, PLATINUM_COIN) / 100) >= last_count[cid] then
					doPlayerRemoveItem(cid, PLATINUM_COIN, last_count[cid] * 100)
					addCoin(cid, CRYSTAL_COIN, last_count[cid])
					sayText = 'Here you are.'
				else
					sayText = 'You don\'t have ' .. last_count[cid] * 100 .. ' platinum coins.'
				end
			else
				sayText = 'Well, can I help you with something else?'
			end
			talk_state[cid] = 0
		end
	end
	--deposit
	if talk_state[cid] == 20 and getCount(msg) > 0 then
		talk_state[cid] = 21
		last_count[cid] = getCount(msg)
		sayText = 'Would you really like to deposit ' .. last_count[cid] .. ' gold coins?'
	elseif talk_state[cid] == 20 and msgcontains(msg, 'all') then
		if getPlayerMoney(cid) <= 0 then
			talk_state[cid] = 0
			sayText = 'You don\'t have any money.'
		else
			talk_state[cid] = 21
			last_count[cid] = getPlayerMoney(cid)
			sayText = 'Would you really like to deposit all your money, ' .. last_count[cid] .. ' gold coins?'
		end
	elseif talk_state[cid] == 21 and getCount(msg) <= 0 then
		if msgcontains(msg, 'yes') then
			if doPlayerDepositMoney(cid, last_count[cid]) == TRUE then
				sayText = 'You deposited ' .. last_count[cid] .. ' gold coins. Your account balance is now ' .. getPlayerBalance(cid) .. ' gold coins.'
			else
				sayText = 'You don\'t have ' .. last_count[cid] .. ' gold coins.'
			end
		else
			sayText = 'Well, can I help you with something else?'
		end
		talk_state[cid] = 0
	end
	--withdraw
	if talk_state[cid] == 30 and getCount(msg) > 0 then
		talk_state[cid] = 31
		last_count[cid] = getCount(msg)
		sayText = 'Would you really like to withdraw ' .. last_count[cid] .. ' gold coins?'
	elseif talk_state[cid] == 30 and msgcontains(msg, 'all') then
			talk_state[cid] = 31
			last_count[cid] = getPlayerBalance(cid)
			sayText = 'Would you really like to withdraw all you money, ' .. last_count[cid] .. ' gold coins?'
	elseif talk_state[cid] == 31 and getCount(msg) <= 0 then
		if msgcontains(msg, 'yes') then
			if doPlayerWithdrawMoney(cid, last_count[cid]) == TRUE then
				sayText = 'You withdrew ' .. last_count[cid] .. ' gold coins. Your account balance is now ' .. getPlayerBalance(cid) .. ' gold coins.'
			else
				sayText = 'You don\'t have ' .. last_count[cid] .. ' gold coins on your account. You account balance is ' .. getPlayerBalance(cid) .. '.'
			end
			talk_state[cid] = 0
		else
			sayText = 'Well, may I help you with something else?'
		end
		talk_state[cid] = 0
	end
	-- transfer
	if talk_state[cid] == 40 and getCount(msg) > 0 then
		if getPlayerBalance(cid) >= getCount(msg) then
			talk_state[cid] = 41
			last_count[cid] = getCount(msg)
			sayText = 'To who would you like transfer ' .. last_count[cid] .. ' gold coins from your account? Tell me his or her name.'
		else
			talk_state[cid] = 0
			sayText = 'You don\'t have ' .. getCount(msg) .. ' gold coins on your account.'
		end
	elseif talk_state[cid] == 41 then
		local toPlayer = doPlayerExist(msg)
		if toPlayer ~= 0 then
			last_name[cid] = toPlayer
			talk_state[cid] = 42
			sayText = 'So you would like to transfer ' .. last_count[cid] .. ' gold coins to ' .. last_name[cid] .. '?'
		else
			talk_state[cid] = 0
			sayText = 'I don\'t know player with name ' .. orginal_msg .. '.'
		end
	elseif talk_state[cid] == 42 then
		if msgcontains(msg, 'yes') then
			if doPlayerTransferMoneyTo(cid, last_name[cid], last_count[cid]) == TRUE then
				sayText = 'You have transfered ' .. last_count[cid] .. ' gold coins to bank account of player ' .. last_name[cid] .. '. Now your account balance is ' .. getPlayerBalance(cid) .. '.'
			else
				sayText = 'You don\'t have ' .. last_count[cid] .. ' gold coins on your bank account or player with name ' .. last_name[cid] .. ' doesn\'t exist. Money not transfered.'
				last_name[cid] = ""
			end
		else
			sayText = 'Well, can I help you with something else?'
		end
		talk_state[cid] = 0
	end
	if sayText ~= "" then
		npcHandler:say(sayText, cid)
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())