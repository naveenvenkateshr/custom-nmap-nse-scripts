
description = [[
SSH Information Scanner
Displays SSH service information.
Scanning only.
]]

author = "Naveen Venkatesh"
license = "Same as Nmap"
categories = {"safe", "discovery"}

local shortport = require "shortport"

portrule = shortport.port_or_service(22, "ssh")

action = function(host, port)
    local output = {}

    output[#output + 1] = "========= SSH SCAN ========="
    output[#output + 1] = "Target IP      : " .. host.ip
    output[#output + 1] = "Hostname       : " .. (host.name or "Unknown")
    output[#output + 1] = "Port           : " .. port.number
    output[#output + 1] = "Protocol       : SSH"
    output[#output + 1] = "Port State     : " .. port.state
    output[#output + 1] = "Service        : " .. (port.service or "Unknown")
    output[#output + 1] = "OSI Layer      : Application Layer"
    output[#output + 1] = "Default Port   : 22"
    output[#output + 1] = "Scan Type      : Service Discovery"

    if port.state == "open" then
        output[#output + 1] = "Result         : SSH port is open"
    else
        output[#output + 1] = "Result         : SSH port is not open"
    end

    output[#output + 1] = "============================"

    return table.concat(output, "\n")
end
