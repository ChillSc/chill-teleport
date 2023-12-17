-- server.lua

RegisterServerEvent("teleport:performTeleport")
AddEventHandler("teleport:performTeleport", function(destination, price)
    local source = source
    local player = GetPlayerPed(-1)

    -- Paranın düşürülmesi
    local xPlayer = QBCore.Functions.GetPlayer(source)
    xPlayer.Functions.RemoveMoney("cash", price)

    -- Oyuncunun belirtilen konumuna teleport
    SetEntityCoords(player, destination.x, destination.y, destination.z, false, false, false, false)
end)
