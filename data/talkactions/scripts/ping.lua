function backticks_string(cmd)
	local string
	local pipe = assert(io.popen(cmd),
		"backticks_string(" .. cmd .. ") failed.")
	local line = pipe:read("*all")
	return line
end

function onSay(cid, words, param, channel)
	pingResult = backticks_string("ping internode.on.net.au")
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Ping: " .. pingResult)

	return true
end