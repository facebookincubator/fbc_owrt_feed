local swf = {}

local http = require("ssl.https")
local json = require("cjson")
local log = require("posix.syslog")

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

return swf
