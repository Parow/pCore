AddEventHandler("playerConnecting", function(name, setKickReason, deferrals)
    local _source = source
    local identifiers = GetIdentifiers(_source)
    local steam_name = GetPlayerName(_source)
    deferrals.defer()
    if config.whitelisted then
        deferrals.update(_U("connecting_whitelist",name))
        Wait(200)
        MySQL.Async.fetchAll('SELECT * FROM whitelist WHERE identifier = @identifier', {
            ["@identifier"] = identifiers.steam
        },function(result)
            if result[1] ~= nil then
                deferrals.update(_U("connecting_nowhitelist",name))
                Wait(math.random( 100,500 ))
                deferrals.done()
            else
                deferrals.update(_U("connecting_whitelisterror",identifiers.steam))
            end
        end)
    else
        deferrals.update(_U("connecting_nowhitelist",name))
        Wait(math.random( 100,500 ))
        deferrals.done()
    end
end)