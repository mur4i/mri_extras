-----------------------------------------------------------------------------------------------------------------------------------------
-- █▀▄▀█ █ █ █▀█ █ █ █      █▀▄ █▀▀ █ █ -------------------------------------------------------------------------------------------------
-- █ ▀ █ █▄█ █▀▄ ▀▀█ █      █▄▀ ██▄ ▀▄▀ -------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
-- Nome do Script: Extras and Liveries (Extras e Plotagem)
-- Descrição: 
--   Este script standalone para FiveM oferece funcionalidades de personalização para veículos.
--   Explore uma variedade de extras e opções de plotagem (Liveries) para personalizar seu veículo da maneira que desejar.
--   Adicione um toque único aos seus carros e destaque-se na cidade!
--
--   *Por favor, não baixe versões vazadas! Elas podem possuir vários vírus e acabar infectando sua VPS ou o seu próprio PC.*
--
--   Suporte 100% gratuito e Qualidade garantidade apenas e exclusivamente no Github: https://github.com/mur4i/mri_extras
--
--====================\\ M
-- Versão: 2.0      --|| U
-- Autor: Murai Dev --|| R
-- Discord: .mur4i  --|| 4
--====================// I
-----------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------------------------
-- COMANDOS DE EXTRAS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand(Config.Commands.Extras, function(source, args, rawCommand)
    OpenExtrasMenu()
end)

RegisterNetEvent("mri:extras")
AddEventHandler("mri:extras", function()
    TriggerEvent("dynamic:closeSystem")
    OpenExtrasMenu()
end)

RegisterNUICallback("selectExtras", function(data, cb)
    local ped = PlayerPedId()
    
    if not IsPedInAnyVehicle(ped) then
        return
    end
    
    local vehicle = GetVehiclePedIsIn(ped)
    local extraIndex = tonumber(data.extras)
    
    -- Verificar se é o motorista
    if Config.OnlyDriver and GetPedInVehicleSeat(vehicle, -1) ~= ped then
        return
    end
    
    local isEnabled = IsVehicleExtraTurnedOn(vehicle, extraIndex)
    SetVehicleExtra(vehicle, extraIndex, isEnabled and 1 or 0)
    
    -- Enviar notificação baseada no estado
    local notification = isEnabled and Config.Notifications.Extras.Disabled or Config.Notifications.Extras.Enabled
    TriggerEvent("Notify", notification.Type, string.format(notification.Message, extraIndex), Config.NotificationDuration)
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- COMANDOS DE PLOTAGEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand(Config.Commands.Plotagem, function(source, args, rawCommand)
    OpenPlotagemMenu()
end)

RegisterNetEvent("mri:plotagem")
AddEventHandler("mri:plotagem", function()
    TriggerEvent("dynamic:closeSystem")
    OpenPlotagemMenu()
end)

RegisterNUICallback("selectLivery", function(data, cb)
    local ped = PlayerPedId()
    
    if not IsPedInAnyVehicle(ped) then
        return
    end
    
    local vehicle = GetVehiclePedIsIn(ped)
    local liveryIndex = tonumber(data.livery)
    
    -- Verificar se é o motorista
    if Config.OnlyDriver and GetPedInVehicleSeat(vehicle, -1) ~= ped then
        return
    end
    
    SetVehicleLivery(vehicle, liveryIndex)
    
    -- Enviar notificação
    local notification = Config.Notifications.Plotagem.Applied
    TriggerEvent("Notify", notification.Type, string.format(notification.Message, liveryIndex), Config.NotificationDuration)
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- FECHAR INTERFACE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("close", function(data, cb)
    SetNuiFocus(false, false)
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES AUXILIARES
-----------------------------------------------------------------------------------------------------------------------------------------

-- Conta quantos extras existem no veículo
function GetVehicleExtrasCount(vehicle)
    local count = 1
    while DoesExtraExist(vehicle, count) do
        count = count + 1
    end
    return count - 1
end

-- Abre o menu de seleção de extras
function OpenExtrasMenu()
    local ped = PlayerPedId()
    
    if not IsPedInAnyVehicle(ped) then
        return
    end
    
    local vehicle = GetVehiclePedIsIn(ped)
    
    -- Verificar se é o motorista
    if Config.OnlyDriver and GetPedInVehicleSeat(vehicle, -1) ~= ped then
        return
    end
    
    local extrasCount = GetVehicleExtrasCount(vehicle)
    
    if extrasCount > 0 then
        SendNUIMessage({ 
            action = "openExtras", 
            count = extrasCount,
            ui = Config.UI.Extras
        })
        SetNuiFocus(true, true)
    end
end

-- Abre o menu de seleção de plotagem
function OpenPlotagemMenu()
    local ped = PlayerPedId()
    
    if not IsPedInAnyVehicle(ped) then
        return
    end
    
    local vehicle = GetVehiclePedIsIn(ped)
    
    -- Verificar se é o motorista
    if Config.OnlyDriver and GetPedInVehicleSeat(vehicle, -1) ~= ped then
        return
    end
    
    local liveriesCount = GetVehicleLiveryCount(vehicle)
    
    if liveriesCount > 0 then
        SendNUIMessage({ 
            action = "openLivery", 
            count = liveriesCount,
            ui = Config.UI.Plotagem
        })
        SetNuiFocus(true, true)
    end
end