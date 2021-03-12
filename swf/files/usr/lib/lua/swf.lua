local swf = {}

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
	return false
end

return swf
