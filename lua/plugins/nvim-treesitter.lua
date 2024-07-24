require'nvim-treesitter.configs'.setup {
    -- パーサーの名前のリスト、または "all"（リストされたパーサーは必ずインストールされなければなりません）
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },

    -- パーサーを同期的にインストールするかどうか（`ensure_installed`にのみ適用されます）
    sync_install = false,

    -- バッファに入るときに不足しているパーサーを自動的にインストールするかどうか
    -- 推奨: `tree-sitter` CLIをローカルにインストールしていない場合はfalseに設定する
    auto_install = true,

    -- インストールを無視するパーサーのリスト（または "all"）
    ignore_install = { "javascript" },

    ---- パーサーのインストールディレクトリを変更する必要がある場合（詳細設定を参照）
    -- parser_install_dir = "/some/path/to/store/parsers", -- vim.opt.runtimepath:append("/some/path/to/store/parsers")を実行することを忘れないでください！

    highlight = {
        enable = true,

        -- 注: これらはファイルタイプではなくパーサーの名前です（たとえば、`tex`ファイルタイプのハイライトを無効にしたい場合、パーサーの名前は`latex`なので、このリストに含める必要があります）
        -- 無効にする言語のリスト
        disable = { "c", "rust" },
        -- より柔軟に無効化するために関数を使用することもできます。例えば、大きなファイルの遅いtreesitterハイライトを無効にする場合など
        disable = function(lang, buf)
                local max_filesize = 100 * 1024 -- 100 KB
                local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                if ok and stats and stats.size > max_filesize then
                        return true
                end
        end,

        -- これをtrueに設定すると、`:h syntax`とtree-sitterが同時に実行されます。
        -- 'syntax'が有効になっていることに依存している場合はtrueに設定します（インデントのためなど）。
        -- このオプションを使用するとエディタが遅くなる可能性があり、重複したハイライトが表示される場合があります。
        -- trueの代わりに言語のリストを設定することもできます
        additional_vim_regex_highlighting = false,
    },
}
