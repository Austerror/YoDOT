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
shopModule:addBuyableItem({'meat'}, 2666, 5, 'meat')
shopModule:addBuyableItem({'brown backpack'}, 1988, 20, 'brown backpack')
-- Buys
shopModule:addSellableItem({'meat'}, 2666, 2, 'meat')
shopModule:addSellableItem({'cheese'}, 8368, 2, 'cheese')

npcHandler:addModule(FocusModule:new())