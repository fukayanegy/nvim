-- base.lua
local base = require('base')
base.setup()

-- plugin manager
local lazy_nvim = require('lazy_nvim')
lazy_nvim.setup()

-- plugin_setting.lua
local plugin_setting = require('plugin_setting')
plugin_setting.setup()
