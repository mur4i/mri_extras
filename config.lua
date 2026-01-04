-----------------------------------------------------------------------------------------------------------------------------------------
-- █▀▄▀█ █ █ █▀█ █ █ █      █▀▄ █▀▀ █ █ -------------------------------------------------------------------------------------------------
-- █ ▀ █ █▄█ █▀▄ ▀▀█ █      █▄▀ ██▄ ▀▄▀ -------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONFIGURAÇÕES DO SCRIPT
-----------------------------------------------------------------------------------------------------------------------------------------

Config = {}

Config.Locale = GetConvar("ox:locale", "en") -- Use o locale do ox_lib ou force a localização que você quiser

-----------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA DE NOTIFICAÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
Config.NotifyType = "oxlib" -- Opções: "qbcore", "oxlib", "vrp", "custom"
Config.NotificationDuration = 5000  -- Duração das notificações em milissegundos

-- Função de notificação (pode ser customizada)
-- Tipos aceitos: "success", "error", "info", "warning"
Config.Notify = function(message, type, duration)
    local notifyType = Config.NotifyType
    
    if notifyType == "qbcore" then
        -- QBCore: success, error, primary, info
        local qbType = type == "error" and "error" or type == "success" and "success" or type == "warning" and "primary" or "info"
        QBCore.Functions.Notify(message, qbType, duration)
        
    elseif notifyType == "oxlib" then
        -- ox_lib: já usa o padrão correto
        TriggerEvent("ox_lib:notify", {
            description = message,
            type = type,
            duration = duration,
            position = "center-right"
        })
        
    elseif notifyType == "vrp" then
        -- vRP: usa cores em português (verde, vermelho, amarelo, azul)
        local vrpType = type == "success" and "verde" or type == "error" and "vermelho" or type == "warning" and "amarelo" or "azul"
        TriggerEvent("Notify", vrpType, message, duration)
        
    elseif notifyType == "custom" then
        -- Customize aqui para seu próprio sistema
        -- Exemplo: exports['seu_notify']:ShowNotification(message, type)
        print(string.format("[mri_extras] [%s] %s", type:upper(), message))
    end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- COMANDOS
-----------------------------------------------------------------------------------------------------------------------------------------
Config.Commands = {
    Extras = "extras",
    Plotagem = "plotagem"
}

-----------------------------------------------------------------------------------------------------------------------------------------
-- CONFIGURAÇÕES GERAIS
-----------------------------------------------------------------------------------------------------------------------------------------
Config.OnlyDriver = true       -- Apenas o motorista pode usar os comandos

-----------------------------------------------------------------------------------------------------------------------------------------
-- PERMISSÕES (opcional - descomente se quiser usar)
-----------------------------------------------------------------------------------------------------------------------------------------
Config.UsePermissions = false  -- Ativar sistema de permissões

-- Exemplo de permissões (ajuste conforme seu framework)
Config.Permissions = {
    Extras = nil,      -- nil = todos podem usar | "admin" = apenas admin
    Plotagem = nil     -- nil = todos podem usar | "admin" = apenas admin
}
