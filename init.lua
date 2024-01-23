--[[**********************************************************************
*                                                                        *
*                              BASE SETTING                              *
*                                                                        *
************************************************************************]]

-------------------------------BASE SETTING-------------------------------
vim.cmd("set belloff=all")              --
vim.cmd("set noswapfile")               --
vim.cmd("set mouse=a")                   --
vim.cmd("set clipboard=unnamedplus")    --
vim.cmd("set ignorecase")               --
vim.cmd("set smartcase")                --
vim.cmd("set wrapscan")                 --
vim.cmd("set incsearch")                --
vim.cmd("set inccommand=split")         --
vim.cmd("syntax on")                    --
vim.cmd("filetype on")                  --


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
Plug 'SirVer/ultisnips'                     -- snippet
Plug 'honza/vim-snippets'                   --
Plug 'tpope/vim-fireplace'                  --
Plug 'rdnetto/YCM-Generator'                --
Plug 'fatih/vim-go'                         --
Plug 'nsf/gocode'                           --
Plug 'junegunn/fzf'                         --
Plug 'vim-airline/vim-airline'              -- vimの下にある部分を豪華にする
Plug 'vim-airline/vim-airline-themes'       -- vim-airlineの色を変える
Plug 'easymotion/vim-easymotion'            -- 移動するためのプラグイン
Plug 'preservim/nerdtree'                   -- tree
Plug 'akinsho/toggleterm.nvim'              -- terminalを豪華にするためのプラグイン
Plug 'lukas-reineke/indent-blankline.nvim'  -- indentを可視化するためのプラグイン
Plug 'nvim-treesitter/nvim-treesitter'      -- 
Plug 'preservim/nerdcommenter'              -- コメントアウトを自動化する
Plug 'jiangmiao/auto-pairs'                 -- (), "" などをペアで書く
Plug 'nathanaelkane/vim-indent-guides'      -- indentを可視化するためのプラグイン
Plug 'TheGLander/indent-rainbowline.nvim'   -- indentを可視化するためのプラグイン
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
-- Plug 'nvim-telescope/telescope.nvim' , { 'tab': '0.1.5' }

vim.call('plug#end')

--------------------------------ULTI SNIPS--------------------------------
vim.g.UltiSnipsExpandTrigger = "<tab>"
vim.g.UltiSnipsJumpForwardTrigger = "<c-b>"
vim.g.UltiSnipsJumpBackwardTrigger = "<c-z>"
vim.g.UltiSnipsEditSplit = "vertical"


---------------------------------NERDTREE---------------------------------
vim.api.nvim_set_keymap('n', 'tt', ':NERDTreeToggle<CR>', { noremap = true, silent = true })


--------------------------------EASYMOTION--------------------------------
vim.g.EasyMotion_do_mapping = 0
vim.api.nvim_set_keymap('n', '<Leader>s', '<Plug>(easymotion-overwin-f2)', { noremap = true, silent = true })
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
vim.g.NERDCustomDelimiters = { c = { left = '// ' } }
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


--------------------------------TELESCOPE--------------------------------
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

