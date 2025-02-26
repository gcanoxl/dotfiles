_G.utils = {}

-- TODO: reorganize
utils.func = require("utils.func")
setmetatable(utils, {
	__index = function(_, key)
		return utils.func[key]
	end,
})

utils.toggles = require("utils.toggles")
utils.bufdelete = require("utils.bufdelete")
