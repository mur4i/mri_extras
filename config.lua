Config = {}

Config.Locale = 'en' --GetConvar("ox:locale", "en")
Config.NotifyType = "oxlib" -- "qbcore", "oxlib", "vrp", "custom"
Config.NotificationDuration = 5000
Config.Commands = {
    Extras = "extras",
    Liveries = "liveries"
}
Config.OnlyDriver = true -- Only allow the driver to change extras and liveries

-- Bridge for Frameworks
Config.Notify = function(message, type, duration)
    local notifyType = Config.NotifyType
    
    if notifyType == "qbcore" then
        local qbType = type == "error" and "error" or type == "success" and "success" or type == "warning" and "primary" or "info"
        QBCore.Functions.Notify(message, qbType, duration)
        
    elseif notifyType == "oxlib" then
        TriggerEvent("ox_lib:notify", {
            description = message,
            type = type,
            duration = duration,
            position = "center-right"
        })
        
    elseif notifyType == "vrp" then
        local vrpType = type == "success" and "verde" or type == "error" and "vermelho" or type == "warning" and "amarelo" or "azul"
        TriggerEvent("Notify", vrpType, message, duration)
        
    elseif notifyType == "custom" then
        print(string.format("[mri_extras] [%s] %s", type:upper(), message))
    end
end