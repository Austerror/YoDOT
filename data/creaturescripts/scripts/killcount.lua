function onKill(cid, target)

	if(isCreature(target) == TRUE) then
		if getCreatureName(target) == "Demon" then
			if getPlayerStorageValue(cid,2501) == -1 then
				setPlayerStorageValue(cid,2501,1)
			else
				demonKills = getPlayerStorageValue(cid,2501)
				setPlayerStorageValue(cid,2501,(demonKills + 1))
			end
		elseif getCreatureName(target) == "Hydra" then
			if getPlayerStorageValue(cid,2502) == -1 then
				setPlayerStorageValue(cid,2502,1)
			else
				hydraKills = getPlayerStorageValue(cid,2502)
				setPlayerStorageValue(cid,2502,(hydraKills + 1))
			end
		elseif getCreatureName(target) == "Dragon Lord" then
			if getPlayerStorageValue(cid,2503) == -1 then
				setPlayerStorageValue(cid,2503,1)
			else
				dlKills = getPlayerStorageValue(cid,2503)
				setPlayerStorageValue(cid,2503,(dlKills + 1))
			end
		end

	end

	--return TRUE
end  