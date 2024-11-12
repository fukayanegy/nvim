-- lspconfig の読み込み
local lspconfig = require('lspconfig')

-- pyright の設定
lspconfig.pyright.setup{
    on_attach = function(client, bufnr)
    -- LSP のキーマッピングを設定
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- キーマッピング
    local opts = { noremap=true, silent=true }

        -- `gd` で定義にジャンプ
        buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
        -- `K` でホバー
        buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
        -- `gi` で実装にジャンプ
        buf_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        -- `gr` で参照を一覧表示
        buf_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
    end
}



-- `vim.diagnostic`の設定
vim.diagnostic.config({
  virtual_text = false,  -- エラーメッセージを行内に表示しない
  signs = false,  -- エラーメッセージをサインカラムに表示
  update_in_insert = false,  -- 挿入モード中に更新しない
  severity_sort = true,  -- 深刻度でソート
  float = {
    source = "always",  -- 常にエラーメッセージのソースを表示
  },
})

-- エラーメッセージを右側に表示するためのカスタムハンドラー
vim.cmd [[
  autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor", border="single"})
]]
