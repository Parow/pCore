resource_type 'gametype' { name = 'pCore' }
server_script '@mysql-async/lib/MySQL.lua'

game 'common'
fx_version 'adamant'

client_script "config.lua"
server_script "config.lua"

server_script {
    "translations/*.lua"
}

client_script {
    "translations/*.lua"
}

server_script {
    "players/server/*.lua"
}