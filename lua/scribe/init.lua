local view = require("scribe.view")
local commands = require("scribe.commands")

local M = {}

M.toggle = view.toggle
M.open = view.open
M.close = view.close
M.line = commands.line

function M.reset()
    M.close()
    require("plenary.reload").reload_module("scribe")
    require("scribe").toggle()
end

return M
