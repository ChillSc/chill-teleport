-- client.lua

local lastTeleportPoint = nil

local function openTeleportMenu()
    local elements = {}

    for _, point in ipairs(Config.TeleportPoints) do
        table.insert(elements, {
            label = point.name,
            value = point,
        })
    end

    QBCore.Functions.TriggerCallback('qb-menu:getServerInfo', function(serverInfo)
        QBCore.Functions.Notify(Locales[Config.Locale]['menu_opening_message'], 'success')

        QBCore.Functions.TriggerCallback('qb-menu:serverCallback', function(cb)
            if cb then
                QBCore.Functions.Notify(Locales[Config.Locale]['menu_opened_message'], 'success')
                local menu = QBCore.UI.Menu.Open('default', GetCurrentResourceName(), 'teleport_menu', {
                    title = Locales[Config.Locale]['menu_title'],
                    align = 'top-right',
                    elements = elements
                })

                menu.on('select', function(selected)
                    local destination = selected.value
                    local price = destination.price

                    local playerMoney = exports['qbcore']:GetPlayerData().money
                    local hasEnoughMoney = playerMoney >= price

                    if hasEnoughMoney then
                        if lastTeleportPoint and lastTeleportPoint.name == destination.name then
                            QBCore.Functions.Notify(Locales[Config.Locale]['already_at_location'], 'error')
                        else
                            QBCore.Functions.Notify(Locales[Config.Locale]['teleporting_message']:format(price), 'success')
                            TriggerServerEvent("teleport:performTeleport", destination.coords, price)
                            lastTeleportPoint = destination
                        end
                    else
                        QBCore.Functions.Notify(Locales[Config.Locale]['not_enough_money'], 'error')
                    end
                end)
            else
                QBCore.Functions.Notify(Locales[Config.Locale]['menu_opening_error'], 'error')
            end
        end)
    end)
end
