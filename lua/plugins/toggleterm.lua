require("toggleterm").setup{
    size = 80,
    direction = 'float',
    name = 'terminal',
}
-- vertical/float
vim.api.nvim_set_keymap('n', '<C-j>', ':ToggleTerm<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-j>', '<C-\\><C-n>:ToggleTerm<CR>', { noremap = true, silent = true })
