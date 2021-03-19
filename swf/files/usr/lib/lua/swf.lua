-- SWF Lua library
-- function table
local swf = {}

local http = require("ssl.https")
local json = require("cjson")
local log = require("posix.syslog")
local uci = require("uci")

function swf.gateway_token()
	local file = io.open("/etc/swf/gateway_token")
	if file then
	    for line in file:lines() do
	        return "FBWIFI:GATEWAY|"..line
	    end
	else
	        print("File is missing ; /etc/swf/gateway_token")
		return nil
	end
end

function swf.validate_token( token )

	local valid = false

	if string.len(token or '' ) > 0 then

	        GATEWAY_TOKEN = swf.gateway_token()

	        URL="https://api.fbwifi.com/v2.0/token"
	        BODY="token="..token
	        body, code, headers = http.request(URL.."?access_token="..GATEWAY_TOKEN, BODY)

	        if code==200 then
	                valid = true
	        else
	                log.syslog(log.LOG_WARNING, "[swf] validate_token:"..body)
	        end

	end

	return valid
end

function swf.instate_client_rule( token, client_mac )

	log.syslog(log.LOG_INFO, "[swf] Validated client "..client_mac)

	state = uci.cursor(nil, "/var/state")
	state_name = "token_" .. token

	RULE_COND="iptables -w -L CLIENT_TO_INTERNET -t mangle | grep -i -q \"%s\""
	RULE_FMT="iptables -w -t mangle -%s CLIENT_TO_INTERNET -m mac --mac-source \"%s\" -j MARK --set-mark 0xfb"
	local RULE
	
	state:set("swf", state_name, "client")
	state:set("swf", state_name, "token", token)
	state:set("swf", state_name, "mac", client_mac)
	state:set("swf", state_name, "authenticated", "true")
				
	-- verify a rule exists for the given client MAC, 
	--   OR install it
	RULE=string.format(RULE_COND.." || "..RULE_FMT, client_mac, "A", client_mac)

	res = os.execute(RULE)
	if res ~= 0 then 
		log.syslog(log.LOG_WARNING, string.format( "[swf] Failed to update iptables (%s)", res ) )
	end
	log.syslog(log.LOG_INFO, "[swf] "..RULE)
	
	state:save('swf')
end

function swf.revoke_client_rule( token )

	log.syslog(log.LOG_INFO, string.format( "[swf] Invalidating token (%s)", token) )

	state = uci.cursor(nil, "/var/state")
	state_name = "token_" .. token
	
	client_mac = state:get("swf", state_name, "mac")

	if client_mac then
		RULE_COND="iptables -w -L CLIENT_TO_INTERNET -t mangle | grep -i -q \"%s\""
		RULE_FMT="iptables -w -t mangle -%s CLIENT_TO_INTERNET -m mac --mac-source \"%s\" -j MARK --set-mark 0xfb"

		-- verify a rule exists for the given client MAC, 
		--  AND delete it
		RULE=string.format(RULE_COND.." && "..RULE_FMT, client_mac, "D", client_mac)

		res = os.execute(RULE)
		if res ~= 0 then 
			log.syslog(log.LOG_WARNING, string.format( "[swf] Failed to update iptables (%s)", res ) )
		end
		log.syslog(log.LOG_INFO, "[swf] "..RULE)

		state:delete("swf", state_name)
		state:save('swf')
	else
		log.syslog(log.LOG_WARNING, string.format( "[swf] Client MAC not found in DB (%s)", state_name ) )
	end
end

--
-- Return the function table to the host script
--
return swf
