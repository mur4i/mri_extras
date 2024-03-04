-----------------------------------------------------------------------------------------------------------------------------------------
-- █▀▄▀█ █ █ █▀█ █ █ █      █▀▄ █▀▀ █ █ -------------------------------------------------------------------------------------------------
-- █ ▀ █ █▄█ █▀▄ ▀▀█ █      █▄▀ ██▄ ▀▄▀ -------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
-- Nome do Script: Extras and Liveries (Extras e Plotagem)
-- Descrição: 
--   Este script client-side para FiveM oferece funcionalidades de personalização para veículos.
--   Explore uma variedade de extras e opções de plotagem (Liveries) para personalizar seu veículo da maneira que desejar.
--   Adicione um toque único aos seus carros e destaque-se na cidade!
--
--   *Por favor, não baixe versões vazadas! Elas podem possuir vários vírus e acabar infectando sua VPS ou o seu próprio PC.*
--
--   Suporte 100% gratuito e Qualidade garantidade apenas e exclusivamente na comunidade FiveMDEV: https://fivemdev.org/
--
--====================\\ M
-- Versão: 1.0      --|| U
-- Autor: Murai Dev --|| R
-- Discord: .mur4i  --|| 4
--====================// I
-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP (desativado por enquanto, aguarde futuras atualizações)
-----------------------------------------------------------------------------------------------------------------------------------------
-- local Tunnel = module("vrp", "lib/Tunnel")
-- local Proxy = module("vrp", "lib/Proxy")
-- vRP = Proxy.getInterface("vRP")
-- vSERVER = Tunnel.getInterface(GetCurrentResourceName())

-----------------------------------------------------------------------------------------------------------------------------------------
-- EXTRAS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("extras", function(s, a, r)
    OpenExtrasMenu()
end)

RegisterNetEvent("mri:extras")
AddEventHandler("mri:extras", function()
    TriggerEvent("dynamic:closeSystem")
    OpenExtrasMenu()
end)

RegisterNUICallback("selectExtras", function(data, cb)
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped) then
        local vehicle = GetVehiclePedIsIn(ped)
        local extraIndex = tonumber(data.extras)
        local status = IsVehicleExtraTurnedOn(vehicle, extraIndex)
        SetVehicleExtra(vehicle, extraIndex, status and 1 or 0)

        local syntax = not status and "ATIVADO" or "DESATIVADO"

        if syntax == "ATIVADO" then
            TriggerEvent("Notify", "verde", "["..syntax.."] Extra "..extraIndex.."", 5000)
        else
            TriggerEvent("Notify", "vermelho", "["..syntax.."] Extra "..extraIndex.."", 5000)
        end
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- PLOTAGEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("plotagem", function(s, a, r)
    OpenPlotagemMenu()
end)

RegisterNetEvent("mri:plotagem")
AddEventHandler("mri:plotagem", function()
    TriggerEvent("dynamic:closeSystem")
    OpenPlotagemMenu()
end)

RegisterNUICallback("selectLivery", function(data,cb)
    if IsPedInAnyVehicle(PlayerPedId()) then
        SetVehicleLivery(GetVehiclePedIsIn(PlayerPedId()), data.livery)
        TriggerEvent("Notify", "verde", "[APLICADO] Plotagem "..data.livery.."", 5000)
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- FECHAR O SCRIPT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("close", function(data, cb)
    SetNuiFocus(false, false)
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES DO SCRIPT
-----------------------------------------------------------------------------------------------------------------------------------------
function GetVehicleExtrasCount(vehicle)
    local count = 1
    while DoesExtraExist(vehicle, count) do
        count = count + 1
    end
    return count - 1
end

function OpenExtrasMenu()
    local ped = PlayerPedId()

    if IsPedInAnyVehicle(ped) then
        local vehicle = GetVehiclePedIsIn(ped)
        if vehicle then
            local count = GetVehicleExtrasCount(vehicle)
            SendNUIMessage({ action = "openExtras", count = count })
            SetNuiFocus(true, true)
        end
    end
end

function OpenPlotagemMenu()
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped) then
        local count = GetVehicleLiveryCount(GetVehiclePedIsIn(ped))
        SendNUIMessage({ action = "openLivery", count = count })
        SetNuiFocus(true, true)
    end
end