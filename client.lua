local tabletOpen = false

RegisterCommand('tablet', function()
    tabletOpen = not tabletOpen
    SetNuiFocus(tabletOpen, tabletOpen)
    SendNUIMessage({
        action = tabletOpen and 'open' or 'close'
    })
end, false)

RegisterNUICallback('closeTablet', function(_, cb)
    tabletOpen = false
    SetNuiFocus(false, false)
    SendNUIMessage({ action = 'close' })
    cb('ok')

end)

RegisterNUICallback('openBoosting', function(_, cb)
    -- Trigger the boosting NUI (simulate /boosting command or open boosting UI)
    -- For example, trigger the boosting NUI event:
    TriggerEvent('boosting:openNUI')
    cb('ok')
end)
