_G.utils = {}

utils.func = require("utils.func")
setmetatable(utils, { __index = utils.func })

utils.toggles = require("utils.toggles")
utils.bufdelete = require("utils.bufdelete")
utils.term = require("utils.terminal")
