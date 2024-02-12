--[[**********************************************************************
*                                                                        *
*                              BASE SETTING                              *
*                                                                        *
************************************************************************]]

-------------------------------BASE SETTING-------------------------------
vim.cmd("set belloff=all")              --
vim.cmd("set noswapfile")               --
vim.cmd("set mouse=a")                  --
vim.cmd("set clipboard=unnamedplus")    --
vim.cmd("set ignorecase")               --
vim.cmd("set smartcase")                --
vim.cmd("set wrapscan")                 --
vim.cmd("set incsearch")                --
vim.cmd("set inccommand=split")         --
vim.cmd("set showtabline=0")
vim.cmd("syntax on")                    --
vim.cmd("filetype on")                  --
vim.cmd("set list listchars=tab:»-,trail:=")
-- vim.cmd("set list listchars=tab:»-,trail:=,extends:»,precedes:«,nbsp:%,space:·")
vim.cmd("set colorcolumn=80")

------------------------------INDENT SETTING------------------------------
vim.cmd("set autoindent")               --
vim.cmd("set smartindent")              --
vim.cmd("set cindent")                  --
vim.cmd("set smarttab")                 --
vim.cmd("set expandtab")                --
vim.cmd("set tabstop=4")                --
vim.cmd("set shiftwidth=4")             --
vim.cmd("set softtabstop=0")            --

vim.cmd("filetype plugin on")           --
vim.cmd("filetype indent on")           --
vim.cmd("autocmd FileType c           setlocal sw=4 sts=4 ts=4 noet")
vim.cmd("autocmd FileType cpp         setlocal sw=4 sts=4 ts=4 noet")
vim.cmd("autocmd FileType html        setlocal sw=4 sts=4 ts=4 et")
vim.cmd("autocmd FileType ruby        setlocal sw=2 sts=2 ts=2 et")
vim.cmd("autocmd FileType js          setlocal sw=4 sts=4 ts=4 et")
vim.cmd("autocmd FileType python      setlocal sw=4 sts=4 ts=4 et")
vim.cmd("autocmd FileType json        setlocal sw=4 sts=4 ts=4 et")
vim.cmd("autocmd FileType html        setlocal sw=4 sts=4 ts=4 et")
vim.cmd("autocmd FileType css         setlocal sw=4 sts=4 ts=4 et")
vim.cmd("autocmd FileType javascript  setlocal sw=4 sts=4 ts=4 et")
vim.cmd("autocmd FileType make        setlocal sw=4 sts=4 ts=4 noet")


-------------------------ORIGINAL COMMAND SETTING-------------------------
vim.api.nvim_set_keymap('n', 'ZZ', ':w<CR>:e .<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'XX', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ZX', ':e .<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-[>', '<C-\\><C-n>', { noremap = true })
vim.api.nvim_set_var('mapleader', ' ')



--[[**********************************************************************
*                                                                        *
*                             PLUGIN SETTING                             *
*                                                                        *
************************************************************************]]

------------------------------PLUGIN MANAGER------------------------------
local Plug=vim.fn['plug#']
vim.call('plug#begin')

Plug 'junegunn/vim-github-dashboard'        -- vim上でgithubの履歴を確認する.
Plug 'tpope/vim-fireplace'                  --
Plug 'rdnetto/YCM-Generator'                --
Plug 'fatih/vim-go'                         --
Plug 'nsf/gocode'                           --
Plug 'junegunn/fzf'                         --
Plug 'vim-airline/vim-airline'              -- vimの下にある部分を豪華にする
Plug 'vim-airline/vim-airline-themes'       -- vim-airlineの色を変える
Plug 'easymotion/vim-easymotion'            -- 移動するためのプラグイン
Plug 'akinsho/toggleterm.nvim'              -- terminalを豪華にするためのプラグイン
Plug 'lukas-reineke/indent-blankline.nvim'  -- indentを可視化するためのプラグイン
Plug 'nvim-treesitter/nvim-treesitter'      -- 
Plug 'preservim/nerdcommenter'              -- コメントアウトを自動化する
Plug 'jiangmiao/auto-pairs'                 -- (), "" などをペアで書く
Plug 'nathanaelkane/vim-indent-guides'      -- indentを可視化するためのプラグイン
Plug 'TheGLander/indent-rainbowline.nvim'   -- indentを可視化するためのプラグイン
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'        -- fileの検索
Plug 'nvim-tree/nvim-tree.lua'
Plug 'Diogo-ss/42-header.nvim'

vim.call('plug#end')



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



---------------------------------NVIMTREE---------------------------------
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 20,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})

vim.api.nvim_set_keymap('n', '<C-f>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })


--------------------------------EASYMOTION--------------------------------
vim.g.EasyMotion_do_mapping = 0
vim.api.nvim_set_keymap('n', '<C-i>', '<Plug>(easymotion-overwin-f2)', { noremap = true, silent = true })
vim.g.EasyMotion_smartcase = 1
vim.api.nvim_set_keymap('n', '<Leader>j', '<Plug>(easymotion-j)', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>k', '<Plug>(easymotion-k)', { noremap = true, silent = true })


------------------------------NERD COMMENTER------------------------------
--                    ======= USING DOCUMENT =======
-- <leader>c<space>  : コメントの状態を切り替える.
-- <leader>ci<space> : 選択した行のコメントの状態を個別に切り替える.
-- <leader>cA        : 行末にコメントを追加する.
-- <leader>cs        : ブロックコメントをする.

vim.g.NERDCreateDefaultMappings = 1
vim.g.NERDSpaceDelims = 1
vim.g.NERDCompactSexyComs = 1
vim.g.NERDDefaultAlign = 'left'
vim.g.NERDAltDelims_java = 1
vim.g.NERDCustomDelimiters = { c = { left = '//' } }
vim.g.NERDCommentEmptyLines = 1
vim.g.NERDTrimTrailingWhitespace = 1
vim.g.NERDToggleCheckAllLines = 1


--------------------------------AUTO PAIRS--------------------------------
vim.g.AutoPairsFlyMode = 0
vim.g.AutoPairsShortcutBackInsert = '<M-b>'


--------------------------------TOGGLETERM--------------------------------
require("toggleterm").setup{
    size = 80,
    direction = 'float',
    name = 'terminal',
}
-- vertical/float
vim.api.nvim_set_keymap('n', '<C-j>', ':ToggleTerm<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-j>', '<C-\\><C-n>:ToggleTerm<CR>', { noremap = true, silent = true })


-----------------------------INDENT-BLANKLINE-----------------------------
require("ibl").setup()

local header = require("42header")
header.setup({
  length = 80, -- headers of different sizes are incompatible with each other
  margin = 5,
  default_map = true, -- default Mapping <F1> in normal mode
  auto_update = true, -- update header when saving
  user = "Diogo-ss", -- your user
  mail = "contact@diogosilva.dev", -- your mail
  -- asciiart = { "......", "......",} -- headers with different ascii arts are incompatible with each other
})

--------------------------------42-HEADER--------------------------------
vim.g.user = "etakaham"
vim.g.mail = "etakaham@student.42tokyo.jp"

--------------------------------TELESCOPE--------------------------------
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
