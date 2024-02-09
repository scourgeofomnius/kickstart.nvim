local builtin = require('telescope.builtin')
vim.opt.relativenumber = true
vim.opt.tabstop        = 4
vim.opt.shiftwidth     = 4
vim.opt.expandtab      = true
vim.api.nvim_set_keymap('n', '<leader>pv', ':Ex<CR>', {noremap=true,silent=true})
vim.keymap.set('n', '<leader>ps', function()
		builtin.grep_string({search = vim.fn.input("Grep > ")});
end)
--vim.keymap.set('x', 'ga', )
vim.keymap.set('i', 'jj', '<Esc>', {noremap=true,silent=true})

local M = {}

M.number_visual_selection = function()
    -- Get the start and end lines of the visual selection
    local start_line = vim.fn.line("'<")
    local end_line   = vim.fn.line("'>")

    print(start_line)
    local line_numbering = 1
    -- Calculate the width needed for padding based on the total number of lines
    for line = start_line, end_line do
        formatline = string.format('%d,s/\\d\\+/%d', line, line_numbering)
        vim.cmd(formatline)
        line_numbering = line_numbering + 1
    end
end

vim.keymap.set('x', '<leader>s', M.number_visual_selection, {noremap=true, silent=true})

return M

