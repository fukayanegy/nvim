
-------------------------------BASE SETTING-------------------------------
vim.cmd("set encoding=UTF-8")
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
vim.cmd("set list listchars=tab:»-")

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
