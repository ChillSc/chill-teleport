-- fxmanifest.lua

fx_version 'adamant'
game 'gta5'

author 'Chill Developement'
description 'Teleport Script with QB-Menu'
version '1.0'

client_scripts {
    'config.lua',
    'locales/en.lua',
    'locales/tr.lua',
    'client/client.lua',
}

server_scripts {
    'config.lua',
    'locales/en.lua',
    'locales/tr.lua',
    'server/server.lua',
}

dependencies {
    'qb-core',
    'qb-menu',
}
