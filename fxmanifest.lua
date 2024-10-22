fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'judd_invoice'
author 'Judd'
version '1.0.0'
description 'Simple invoice resource to use with ox_banking.'

shared_script '@ox_lib/init.lua'

client_scripts {
    'client/main.lua'
}

server_scripts {
    'server/main.lua'
}

dependencies {
    '/server:7290',
    '/onesync',
    'ox_lib',
    'ox_core',
    'ox_banking'
}
