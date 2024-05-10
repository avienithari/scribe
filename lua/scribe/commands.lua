local file = ".notes.md"
local M = {}

local function get_or_create_buffer(filename)
    local buf_exists = vim.fn.bufexists(filename) ~= 0
    if buf_exists then
        return vim.fn.bufnr(filename)
    end
    return vim.fn.bufadd(filename)
end

function M.line()
    local line = vim.api.nvim_get_current_line()
    local filetype = vim.api.nvim_buf_get_option(0, 'filetype')
    local bufnr = get_or_create_buffer(file)
    vim.api.nvim_buf_set_option(bufnr, "buflisted", true)
    vim.api.nvim_buf_call(bufnr, vim.cmd.edit)
    vim.api.nvim_buf_set_lines(bufnr, -1 , -1, false,
        {string.format("```%s", filetype), line, "```" })
    vim.api.nvim_buf_call(bufnr, function() vim.cmd('silent w') end)
end

return M
