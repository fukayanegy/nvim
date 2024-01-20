" |++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|
" |============================================================================|

" |-------------------------------BASE SETTING---------------------------------|

" |============================================================================|
" |++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|

set belloff=all
set noswapfile
set mouse=
set tabstop=4
set shiftwidth=4
set clipboard=unnamedplus
set ignorecase
set smartcase
set wrapscan
set incsearch
set inccommand=split
syntax on
filetype on


" ============================================================================

" ------------------------------INDENT SETTING--------------------------------

" ============================================================================

set autoindent          " 改行時に前の行のインデントを計測.
set smartindent         " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する.
set cindent             " Cプログラムファイルの自動インデントを始める.
set smarttab            " 新しい行を作った時に高度な自動インデントを行う.
set expandtab           " タブ入力を複数の空白に置き換える.

set tabstop=4           " タブを含むファイルを開いた際, タブを何文字の空白に変換するか.
set shiftwidth=4        " 自動インデントで入る空白数.
set softtabstop=0       " キーボードから入るタブの数.

if has("autocmd")
  "ファイルタイプの検索を有効にする.
  filetype plugin on
  "ファイルタイプに合わせたインデントを利用.
  filetype indent on
  "sw=shiftwidth, sts=softtabstop, ts=tabstop, et=expandtabの略
  autocmd FileType c           setlocal sw=4 sts=4 ts=4 noet
  autocmd FileType html        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType js          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType json        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript  setlocal sw=4 sts=4 ts=4 et
  autocmd FileType make        setlocal sw=4 sts=4 ts=4 noet
endif



" ============================================================================

" --------------------------ORIGINAL COMMAND SETTING--------------------------

" ============================================================================

nnoremap ZZ :w<CR> :e .<CR>
nnoremap XX :w<CR>
nnoremap ZX :e .<CR>
nnoremap TT <C-w>v<C-w>l:terminal<CR>

tnoremap <C-[> <C-\><C-n>

let mapleader = "\<Space>"








" |++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|
" |============================================================================|

" |-------------------------------PLUGIN SETTING-------------------------------|

" |============================================================================|
" |++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|
" ============================================================================




" ============================================================================

" ------------------------------PLUGIN MANAGER--------------------------------

" ============================================================================

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" under info system
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Jumping system
Plug 'easymotion/vim-easymotion'

" file system explorer
Plug 'preservim/nerdtree'

" terminal system
Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'nvim-treesitter/nvim-treesitter'

" " ddc
" Plug 'Shougo/ddc.vim'
" Plug 'vim-denops/denops.vim'
" Plug 'Shougo/pum.vim'
" " ddc source
" Plug 'Shougo/ddc-around'
" Plug 'vim-denops/denops.vim'
"
" Plug 'Shougo/ddc-matcher_head'
" Plug 'Shougo/ddc-sorter_rank'

" Language Server Protocol
" Plug 'mattn/vim-lsp-settings'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'Shougo/ddc-converter_remove_overlap'

" commentout system
Plug 'preservim/nerdcommenter'

" auto () "" system
Plug 'jiangmiao/auto-pairs'

" plugin for visualizing indent
Plug 'nathanaelkane/vim-indent-guides'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting





" ============================================================================

" --------------------------------VIM AIRLINE---------------------------------

" ============================================================================

" let g:airline#extensions#tabline#enabled = 1







" ============================================================================

" --------------------------------NERDTREE------------------------------------

" ============================================================================

nnoremap tt :NERDTreeToggle<CR>






" ============================================================================

" -------------------------------EASYMOTION-----------------------------------

" ============================================================================
map <Leader> <Plug>(easymotion-prefix)
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap <Leader>s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)





" ============================================================================

" -------------------------------DDC SETTING----------------------------------

" ============================================================================
" call plug#('Shougo/ddc.vim')
" call plug#('vim-denops/denops.vim')
" call plug#('Shougo/pum.vim')
" call plug#('Shougo/ddc-around')
" call plug#('LumaKernel/ddc-file')
" call plug#('Shougo/ddc-matcher_head')
" call plug#('Shougo/ddc-sorter_rank')
" call plug#('Shougo/ddc-converter_remove_overlap')
" call plug#('prabirshrestha/vim-lsp')
" call plug#('mattn/vim-lsp-settings')
"
" call ddc#custom#patch_global('ui', 'native')
" call ddc#custom#patch_global('completionMenu', 'pum.vim')
" call ddc#custom#patch_global('sources', [
"  \ 'around',
"  \ 'vim-lsp',
"  \ 'file'
"  \ ])
"
" inoremap <Tab> <Cmd>call pum#map#insert_relative(+1)<CR>
" inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>


if has("autocmd")
    "sw=shiftwidth, sts=softtabstop, ts=tabstop, et=expandtabの略
    " autocmd FileType c           setlocal sw=4 sts=4 ts=4 noet
    autocmd FileType cpp         :set dictionary=~/.config/nvim/dict/cpp.dict
    " autocmd FileType html        setlocal sw=4 sts=4 ts=4 et
    " autocmd FileType ruby        setlocal sw=2 sts=2 ts=2 et
    " autocmd FileType js          setlocal sw=4 sts=4 ts=4 et
    " autocmd FileType python      setlocal sw=4 sts=4 ts=4 et
    " autocmd FileType json        setlocal sw=4 sts=4 ts=4 et
    " autocmd FileType html        setlocal sw=4 sts=4 ts=4 et
    " autocmd FileType css         setlocal sw=4 sts=4 ts=4 et
    " autocmd FileType javascript  setlocal sw=4 sts=4 ts=4 et
    " autocmd FileType make        setlocal sw=4 sts=4 ts=4 noet
endif

" ============================================================================

" ------------------------NERDCOMMENTER SETTING-------------------------------

" ============================================================================


" ======= USING DOCUMENT =======
" <leader>c<space>  : コメントの状態を切り替える.
" <leader>ci<space> : 選択した行のコメントの状態を個別に切り替える.
" <leader>cA        : 行末にコメントを追加する.
" <leader>cs        : ブロックコメントをする.

" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '// ' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1



" ============================================================================

" -----------------------------AUTO PAIRS SETTING-----------------------------

" ============================================================================
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'



" ============================================================================

" ------------------------------INDENT-BLANKLINE------------------------------

" ============================================================================



