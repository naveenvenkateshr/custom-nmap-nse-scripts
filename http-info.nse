
description = [[
HTTP Information Scanner
Displays HTTP service information.
Scanning only.
]]

author = "Naveen Venkatesh"
license = "Same as Nmap"
categories = {"safe", "discovery"}

local shortport = require "shortport"
local http = require "http"

portrule = shortport.port_or_service(80, "http")

action = function(host, port)
    local response = http.get(host, port, "/")
    local output = {}

    output[#output + 1] = "========= HTTP SCAN ========="
    output[#output + 1] = "Target IP      : " .. host.ip
    output[#output + 1] = "Port           : " .. port.number
    output[#output + 1] = "Protocol       : HTTP"
    output[#output + 1] = "Port State     : " .. port.state

    if response then
        local headers = response.header or {}
        output[#output + 1] = "Status Code    : " .. (response.status or "Unknown")
        output[#output + 1] = "Server         : " .. (headers["server"] or "Unknown")
        output[#output + 1] = "Content-Type   : " .. (headers["content-type"] or "Unknown")
        output[#output + 1] = "Content Length : " .. (headers["content-length"] or "Unknown")
    else
        output[#output + 1] = "No HTTP response received."
    end

    output[#output + 1] = "Scan Type      : Service Discovery"
    output[#output + 1] = "=============================="

    return table.concat(output, "\n")
end
