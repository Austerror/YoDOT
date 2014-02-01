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
shopModule:addBuyableItem({'rope'}, 2120, 50, 1,'rope')
shopModule:addBuyableItem({'brown backpack'}, 1988, 20, 1,'brown backpack')
-- Buys
shopModule:addSellableItem({'hand axe'}, 2380, 4,'hand axe')
shopModule:addSellableItem({'spear'}, 2389, 3,'spear')
shopModule:addSellableItem({'leather helmet'}, 2461, 3,'leather helmet')
shopModule:addSellableItem({'studded club'}, 2448, 2,'studded club')
shopModule:addSellableItem({'wooden shield'}, 2512, 3,'wooden shield')
shopModule:addSellableItem({'leather boots'}, 2643, 2,'leather boots')
shopModule:addSellableItem({'rope'}, 2120, 8,'rope')

npcHandler:addModule(FocusModule:new())