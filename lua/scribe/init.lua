local view = require("scribe.view")

local M = {}

M.toggle = view.toggle
M.open = view.open
M.close = view.close

function M.reset()
    M.close()
    require("plenary.reload").reload_module("scribe")
    require("scribe").toggle()
end

return M
