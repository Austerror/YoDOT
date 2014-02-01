function skinMonster(cid,item,skin)
math.randomseed( os.time() )
math.random(); math.random(); math.random()
    local random = math.random(1,15)
    if(random < 4) then
        doPlayerAddItem(cid,skin,1)
        doSendMagicEffect(getThingPos(item.uid), CONST_ME_MAGIC_GREEN)
    else
        doSendMagicEffect(getThingPos(item.uid), CONST_ME_BLOCKHIT)
    end
    doTransformItem(item.uid,item.itemid+1)
end
demon = {2916}
vampire = {2956}
function onUse(cid, item, fromPosition, itemEx, toPosition)
math.randomseed( os.time() )
math.random(); math.random(); math.random()
local random = math.random(1,10)
    if isInArray(demon, itemEx.itemid) == TRUE then
        skinMonster(cid, itemEx, 5906)
    elseif isInArray(vampire, itemEx.itemid) == TRUE then
        skinMonster(cid, itemEx, 5905)
    else
        doPlayerSendCancel(cid,"Sorry, not possible.")
    end
return TRUE
end