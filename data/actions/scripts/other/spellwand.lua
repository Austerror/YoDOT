local outfits = {"rat", "green frog", "chicken"} --possible outfits
local duration = 120 --duration of the outfit in seconds
function onUse(cid, item, fromPosition, itemEx, toPosition)
	doSummonCreature("Mad Sheep",toPosition)
	doRemoveItem(item.uid,1)
	if isPlayer(itemEx.uid) == TRUE then
		doSetMonsterOutfit(itemEx.uid,outfits[math.random(#outfits)],duration*1000)
		doSendMagicEffect(toPosition,CONST_ME_MAGIC_BLUE)
	end
	return TRUE
end