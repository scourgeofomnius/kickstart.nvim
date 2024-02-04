local builtin = require('telescope.builtin')
vim.opt.relativenumber = true
vim.api.nvim_set_keymap('n', '<leader>pv', ':Ex<CR>', {noremap=true,silent=true})
vim.keymap.set('n', '<leader>ps', function()
		builtin.grep_string({search = vim.fn.input("Grep > ")});
end)
