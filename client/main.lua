-- Commands
RegisterCommand(Config.Commands.Extras, function(source, args, rawCommand)
    OpenExtrasMenu()
end)

RegisterCommand(Config.Commands.Liveries, function(source, args, rawCommand)
    OpenLiveriesMenu()
end)

-- UI
RegisterNUICallback("selectExtras", function(data, cb)
    local ped = PlayerPedId()
    
    if not IsPedInAnyVehicle(ped) then
        return
    end
    
    local vehicle = GetVehiclePedIsIn(ped)
    local extraIndex = tonumber(data.extras)
    
    if Config.OnlyDriver and GetPedInVehicleSeat(vehicle, -1) ~= ped then
        return
    end
    
    local isEnabled = IsVehicleExtraTurnedOn(vehicle, extraIndex)
    SetVehicleExtra(vehicle, extraIndex, isEnabled and 1 or 0)
    
    local notifType = isEnabled and "error" or "success"
    local message = isEnabled and locale("notifications.extras.disabled", extraIndex) or locale("notifications.extras.enabled", extraIndex)
    Config.Notify(message, notifType, Config.NotificationDuration)
end)

RegisterNUICallback("selectLivery", function(data, cb)
    local ped = PlayerPedId()
    
    if not IsPedInAnyVehicle(ped) then
        return
    end
    
    local vehicle = GetVehiclePedIsIn(ped)
    local liveryNumber = tonumber(data.livery)
    local liveryIndex = liveryNumber - 1
    
    if Config.OnlyDriver and GetPedInVehicleSeat(vehicle, -1) ~= ped then
        return
    end
    
    SetVehicleLivery(vehicle, liveryIndex)
    
    Config.Notify(locale("notifications.livery.applied", liveryNumber), "success", Config.NotificationDuration)
end)

RegisterNUICallback("close", function(data, cb)
    SetNuiFocus(false, false)
end)

-- Functions
function GetVehicleExtrasCount(vehicle)
    local count = 1
    while DoesExtraExist(vehicle, count) do
        count = count + 1
    end
    return count - 1
end

function OpenExtrasMenu()
    local ped = PlayerPedId()
    
    if not IsPedInAnyVehicle(ped) then
        return
    end
    
    local vehicle = GetVehiclePedIsIn(ped)
    
    if Config.OnlyDriver and GetPedInVehicleSeat(vehicle, -1) ~= ped then
        return
    end
    
    local extrasCount = GetVehicleExtrasCount(vehicle)
    
    if extrasCount > 0 then
        local extrasStatus = {}
        for i = 1, extrasCount do
            local isTurnedOn = IsVehicleExtraTurnedOn(vehicle, i)
            extrasStatus[i] = (isTurnedOn == 1)
        end
        
        SendNUIMessage({ 
            action = "openExtras", 
            count = extrasCount,
            ui = {
                Title = locale("ui.extras.title"),
                Subtitle = locale("ui.extras.subtitle"),
                Select = locale("ui.extras.select_text")
            },
            activeExtras = extrasStatus
        })
        SetNuiFocus(true, true)
    end
end

function OpenLiveriesMenu()
    local ped = PlayerPedId()
    
    if not IsPedInAnyVehicle(ped) then
        return
    end
    
    local vehicle = GetVehiclePedIsIn(ped)
    
    if Config.OnlyDriver and GetPedInVehicleSeat(vehicle, -1) ~= ped then
        return
    end
    
    local liveriesCount = GetVehicleLiveryCount(vehicle)
    
    if liveriesCount > 0 then
        local activeLivery = GetVehicleLivery(vehicle)
        
        SendNUIMessage({ 
            action = "openLivery", 
            count = liveriesCount,
            ui = {
                Title = locale("ui.livery.title"),
                Subtitle = locale("ui.livery.subtitle"),
                Select = locale("ui.livery.select_text")
            },
            activeLivery = activeLivery
        })
        SetNuiFocus(true, true)
    end
end

-- Events
RegisterNetEvent("mri_extras:extras", function()
    OpenExtrasMenu()
end)

RegisterNetEvent("mri_extras:plotagem", function()
    OpenLiveriesMenu()
end)