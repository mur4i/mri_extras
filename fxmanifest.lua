fx_version "adamant"
game "gta5"
author 'Murai Dev'
description 'MRI Extras and Liveries'
version '2.0'
url 'https://github.com/mur4i/mri_extras'
discord '.mur4i'

client_scripts {
	"config.lua",
	"locales/locales.lua",
	"client/*.lua"
}

files {
	"web/**",
	"locales/*.json"
}

ui_page "web/index.html"