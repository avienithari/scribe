local file = ".notes.md"

local M = {}
M.win = nil
M.buf = nil

local function create()
    if M.buf == nil then
        M.buf = vim.api.nvim_create_buf(true, false)
    end
    local window_height = vim.api.nvim_list_uis()[1].height
    local window_width = vim.api.nvim_list_uis()[1].width
    M.win = vim.api.nvim_open_win(M.buf, true, {
        relative = "editor",
        border = "single",
        title = "Scribe",
        title_pos = "center",
        focusable = true,
        width = math.floor(0.7 * window_width),
        height = math.floor(0.85 * window_height),
        row = math.floor(0.05 * window_height),
        col = math.floor(0.15 * window_width),
    })
    vim.api.nvim_buf_set_name(M.buf, file)
    vim.api.nvim_buf_call(M.buf, vim.cmd.edit)
    vim.api.nvim_buf_set_option(M.buf, "filetype", "markdown")
    vim.keymap.set(
        "n",
        "<ESC>",
        ":lua require('scribe').close()<CR>",
        { silent = true })
    local augroup = [[
        augroup Scribe
            autocmd!
            autocmd WinLeave * lua require('scribe').close()
        augroup end]]

    vim.api.nvim_exec2(augroup:format(M.win, M.win), { output = false })
end

local function is_open()
    if M.win ~= nil and vim.api.nvim_win_is_valid(M.win) then
        return true
    end
end

function M.close()
    pcall(vim.api.nvim_buf_call, M.buf, function() vim.cmd('silent w') end)
    pcall(vim.api.nvim_win_close, M.win, false)
    pcall(vim.keymap.del, "n", "<ESC>")
    M.win = nil
end

function M.open()
    if not is_open() then
        M.close()
        create()
    end
end

function M.toggle()
    if is_open() then
        M.close()
    else
        M.open()
    end
end

return M
