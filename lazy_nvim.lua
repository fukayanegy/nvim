local M = {}
function M.setup()

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup({
    'vim-airline/vim-airline',
    'vim-airline/vim-airline-themes',
    'easymotion/vim-easymotion',
    'akinsho/toggleterm.nvim',
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    'nvim-tree/nvim-tree.lua',
    'jiangmiao/auto-pairs',
    'preservim/nerdcommenter',
    'TheGLander/indent-rainbowline.nvim',
})

end
return M
