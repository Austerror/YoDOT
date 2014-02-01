local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)            npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                    npcHandler:onThink()                    end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)
-- Sells
shopModule:addBuyableItem({'party trumpet'}, 6572, 25, 'party trumpet')
shopModule:addBuyableItem({'fireworks rocket'}, 6576, 10, 'fireworks rocket')
shopModule:addBuyableItem({'party hat'}, 6578, 25, 'party hat')
shopModule:addBuyableItem({'red balloon'}, 6575, 25, 'red balloon')
shopModule:addBuyableItem({'green balloon'}, 6577, 25, 'green balloon')
-- Buys

npcHandler:addModule(FocusModule:new())