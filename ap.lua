local HttpService = game:GetService("HttpService")
local ScriptUrl = "https://api.junkie-development.de/api/v1/luascripts/public/ddee8fccf905fea4f1e71da5eaa8224ee00c2ae65acc0b57d1c3a77442994f83/download"

function Execute(url)
    local Success, Response = pcall(function()
        return game:HttpGet(url)
    end)

    if Success and Response then
        local LoadSuccess, err = pcall(function()
            loadstring(Response)()
        end)

        if not LoadSuccess then
            warn("Failed to execute script, reason: " .. tostring(err))
        end
    end
end

Execute(ScriptUrl)
