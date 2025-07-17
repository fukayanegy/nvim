-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  local result = vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
  if vim.v.shell_error ~= 0 then
    -- stylua: ignore
    vim.api.nvim_echo({ { ("Error cloning lazy.nvim:\n%s\n"):format(result), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
    vim.fn.getchar()
    vim.cmd.quit()
  end
end

vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
require "polish"

vim.api.nvim_set_var("mapleader", " ")
vim.api.nvim_set_keymap("n", "ZZ", "<CMD>w<CR>:e .<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "XX", "<CMD>w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<C-[>", "<C-\\><C-n>", { noremap = true })

vim.api.nvim_set_keymap("n", "<C-b>", "<CMD>bn<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-c>", "<CMD>bp<CR>", { noremap = true })

-------------------------------BASE SETTING-------------------------------
vim.cmd "set encoding=UTF-8"
vim.cmd "set list listchars=tab:»-,space:·"
