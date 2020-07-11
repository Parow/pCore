function GetIdentifiers(_source)
    local identifiers = {}
    local playerIdentifiers = GetPlayerIdentifiers(_source)
    for _, v in pairs(playerIdentifiers) do
        local before, after = playerIdentifiers[_]:match("([^:]+):([^:]+)")
        identifiers[before] = playerIdentifiers[_]
    end
    return identifiers
end

local function _(str, ...)  -- Translate string

	if Locales[config.Locale] ~= nil then

		if Locales[config.Locale][str] ~= nil then
			return string.format(Locales[config.Locale][str], ...)
		else
			return 'Translation [' .. config.Locale .. '][' .. str .. '] does not exist'
		end

	else
		return 'Locale [' .. config.Locale .. '] does not exist'
	end

end

function _U(str, ...) -- Translate string first char uppercase
	return tostring(_(str, ...):gsub("^%l", string.upper))
end