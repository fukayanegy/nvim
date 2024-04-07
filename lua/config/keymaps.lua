vim.api.nvim_set_var('mapleader', ' ')
vim.api.nvim_set_keymap('n', 'ZZ', '<CMD>w<CR>:e .<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'XX', '<CMD>w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ZX', '<CMD>e .<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-[>', '<C-\\><C-n>', { noremap = true })

-- vim.api.nvim_set_keymap('n', '<C-b>', '<CMD>bn<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<C-s>', [[:lua ToggleLastStatus()<CR>]], { noremap = true, silent = true })

function ToggleLastStatus()
    if vim.o.laststatus == 0 then
        vim.o.laststatus = 2
    elseif vim.o.laststatus == 2 then
        vim.o.laststatus = 0
    end
end
