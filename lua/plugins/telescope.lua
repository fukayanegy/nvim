local telescope = require('telescope')
local builtin = require('telescope.builtin')

-- グローバル関数として定義
function _G.grep_word()
    builtin.grep_string({
        search = vim.fn.input("Grep Word > "),
        word_match = "-w",
    })
end

vim.api.nvim_set_keymap('n', '<leader>gw', '<cmd>lua grep_word()<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<C-g>', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
