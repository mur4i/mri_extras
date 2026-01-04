local currentLocale = Config.Locale or 'en'
local translations = {}

local function loadLocale(locale)
    local file = LoadResourceFile(GetCurrentResourceName(), ('locales/%s.json'):format(locale))
    if file then
        translations = json.decode(file)
        return true
    end
    return false
end

local function getNestedValue(tbl, path)
    local keys = {}
    for key in path:gmatch("[^.]+") do
        table.insert(keys, key)
    end
    
    local value = tbl
    for _, key in ipairs(keys) do
        if type(value) == "table" then
            value = value[key]
        else
            return nil
        end
    end
    
    return value
end

function locale(key, ...)
    local translation = getNestedValue(translations, key)
    
    if not translation then
        print(string.format("^3[WARNING] Translation key '%s' not found for locale '%s'^7", key, currentLocale))
        return key
    end
    
    if ... then
        return string.format(translation, ...)
    end
    
    return translation
end

CreateThread(function()
    if not loadLocale(currentLocale) then
        print(string.format("^3[WARNING] Locale '%s' not found, falling back to 'en'^7", currentLocale))
        currentLocale = 'en'
        if not loadLocale(currentLocale) then
            print("^1[ERROR] Could not load any locale file!^7")
        end
    end
    
    print(string.format("^2[mri_extras] Loaded locale: %s^7", currentLocale))
end)
