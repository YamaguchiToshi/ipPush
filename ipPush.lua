establish_encmode = 6
wireless_ssids = "/SD_WLAN/ssids.json"

local cjson = require "cjson"
ssids_file = io.open(wireless_ssids, "r")
jssids = ssids_file:read("*a")
ssids_file:close()
jssids = cjson.decode(jssids)

connected = false

API_KEY = "PushOver API Key"
USER_KEY = "PushOver USER Key"


if fa.WlanLink() ~= 1 then
    for key, value in pairs(jssids.ssids) do
        active_ssid_count = fa.Scan(key)
        if active_ssid_count == 1 then
            fa.Connect(key, value)
            myssid = key
            connected = true
        end
        if connected == true then
            myip,netmask,gateway = fa.ip()
            msg = "token="..API_KEY.."&user="..USER_KEY.."&message="..key..":"..myip
            len_s = tostring(string.len(msg))
            b,c,h = fa.request{
                url = "https://api.pushover.net/1/messages.json",
                method = "POST",
                headers = {["Content-Length"] = len_s},
                body = msg
            }
            break
        end
    end

    if connected == false then
        for key, value in pairs(jssids.establish) do
            fa.Establish(key, value, establish_encmode)
            break
        end
    end
end