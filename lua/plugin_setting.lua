local M = {}
function M.setup()

---------------------------------AIR LINE---------------------------------
vim.g.airline_theme = 'wombat'
vim.g.airline_extensions_tabline_enabled = 1
vim.g.airline_powerline_fonts = 1
vim.o.laststatus = 0

vim.api.nvim_set_keymap('n', '<C-s>', [[:lua ToggleLastStatus()<CR>]], { noremap = true, silent = true })

function ToggleLastStatus()
    if vim.o.laststatus == 0 then
        vim.o.laststatus = 2
    elseif vim.o.laststatus == 2 then
        vim.o.laststatus = 0
    end
end

--------------------------------AUTO PAIRS--------------------------------
vim.g.AutoPairsFlyMode = 0
vim.g.AutoPairsShortcutBackInsert = '<M-b>'

---------------------------------NVIMTREE---------------------------------
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = '13%',
        side = 'left',
        signcolumn = 'no',
    },
    renderer = {
        highlight_git = true,
        group_empty = true,
        icons = {
            glyphs = {
                git = {
                    unstaged = '!',
                    renamed = '»',
                    untracked = '?',
                    deleted = '✘',
                    staged = '✓',
                    unmerged = '',
                    ignored = '◌',
                },
            },
        },
    },
    filters = {
        dotfiles = true,
    },
})
vim.api.nvim_set_keymap('n', '<C-f>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })


--------------------------------TOGGLETERM--------------------------------

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<C-g>', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


--------------------------------EASYMOTION--------------------------------
vim.g.EasyMotion_do_mapping = 0
vim.api.nvim_set_keymap('n', '<C-i>', '<Plug>(easymotion-overwin-f2)', { noremap = true, silent = true })
vim.g.EasyMotion_smartcase = 1
vim.api.nvim_set_keymap('n', '<Leader>j', '<Plug>(easymotion-j)', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>k', '<Plug>(easymotion-k)', { noremap = true, silent = true })


--------------------------------TOGGLETERM--------------------------------
require("toggleterm").setup{
    size = 80,
    direction = 'float',
    name = 'terminal',
}
-- vertical/float
vim.api.nvim_set_keymap('n', '<C-j>', ':ToggleTerm<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-j>', '<C-\\><C-n>:ToggleTerm<CR>', { noremap = true, silent = true })

end
return M
