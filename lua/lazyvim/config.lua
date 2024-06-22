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
    {
        -- status line
        {
            'nvim-lualine/lualine.nvim',
            dependencies = { 'nvim-tree/nvim-web-devicons' }
        },
        -- color scheme
        { "EdenEast/nightfox.nvim" },
        -- file explorer
        {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v3.x",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-tree/nvim-web-devicons",
                "MunifTanjim/nui.nvim",
                "3rd/image.nvim",
            },
        },
    },
    -- telescope
    {
        "nvim-telescope/telescope.nvim",
        keys = {
            {
                "<C-p>",
                function() require("telescope.builtin").find_files() end,
            },
            {
                "<C-g>",
                function() require("telescope.builtin").grep_string() end,
            },
        },
        opts = {
            defaults = {
                layout_strategy = "horizontal",
                layout_config = { prompt_position = "top" },
                sorting_strategy = "ascending",
                winblend = 0,
            },
        },
    },
    {
        "nvim-telescope/telescope-frecency.nvim",
        config = function()
            require("telescope").load_extension "frecency"
        end,
    },
    -- bufferline
    {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
    -- dashboard
    {

        { "nvimdev/dashboard-nvim", enabled = false },
        { "echasnovski/mini.starter", enabled = false },
        -- Dashboard. This runs when neovim starts, and is what displays
        -- the "LAZYVIM" banner.
        {
            "goolord/alpha-nvim",
            event = "VimEnter",
            enabled = true,
            init = false,
            opts = function()
                local dashboard = require("alpha.themes.dashboard")
                local logo = [[
                         ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗
                         ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║    
                         ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║       
                         ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║         
                         ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
                         ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
                ]]

                dashboard.section.header.val = vim.split(logo, "\n")
                -- stylua: ignore
                dashboard.section.buttons.val = {
                    dashboard.button("f", " " .. " Find file",       "<cmd> Telescope find_files <cr>"),
                    dashboard.button("n", " " .. " New file",        "<cmd> ene <BAR> startinsert <cr>"),
                    dashboard.button("r", " " .. " Recent files",    "<cmd> Telescope oldfiles <cr>"),
                    dashboard.button("g", " " .. " Find text",       "<cmd> Telescope live_grep <cr>"),
                    dashboard.button("c", " " .. " Config",          "<cmd> e ~/.config/nvim <cr>"),
                    dashboard.button("s", " " .. " Restore Session", [[<cmd> lua require("persistence").load() <cr>]]),
                    dashboard.button("x", " " .. " Lazy Extras",     "<cmd> LazyExtras <cr>"),
                    dashboard.button("l", "󰒲 " .. " Lazy",            "<cmd> Lazy <cr>"),
                    dashboard.button("q", " " .. " Quit",            "<cmd> qa <cr>"),
                }
                for _, button in ipairs(dashboard.section.buttons.val) do
                    button.opts.hl = "AlphaButtons"
                    button.opts.hl_shortcut = "AlphaShortcut"
                end
                dashboard.section.header.opts.hl = "AlphaHeader"
                dashboard.section.buttons.opts.hl = "AlphaButtons"
                dashboard.section.footer.opts.hl = "AlphaFooter"
                dashboard.opts.layout[1].val = 8
                return dashboard
            end,
            config = function(_, dashboard)
                -- close Lazy and re-open when the dashboard is ready
                if vim.o.filetype == "lazy" then
                    vim.cmd.close()
                    vim.api.nvim_create_autocmd("User", {
                        once = true,
                        pattern = "AlphaReady",
                        callback = function()
                            require("lazy").show()
                        end,
                    })
                end

                require("alpha").setup(dashboard.opts)

                vim.api.nvim_create_autocmd("User", {
                    once = true,
                    pattern = "LazyVimStarted",
                    callback = function()
                        local stats = require("lazy").stats()
                        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                        dashboard.section.footer.val = "⚡ Neovim loaded "
                            .. stats.loaded
                            .. "/"
                            .. stats.count
                            .. " plugins in "
                            .. ms
                            .. "ms"
                        pcall(vim.cmd.AlphaRedraw)
                    end,
                })
            end,
        },
    },
    -- flash
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
    },
    { 'echasnovski/mini.nvim', version = '*' },
    { 'echasnovski/mini.ai', version = '*' },
    { 'echasnovski/mini.comment', version = '*' },
    { 'echasnovski/mini.pairs', version = '*' },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    },
    {
        {'akinsho/toggleterm.nvim', version = "*", config = true},
    },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    { 'mfussenegger/nvim-dap' , version = '*'},
    { 'mfussenegger/nvim-dap-python', version = '*' },
    { 'shrik3/tokyonight.nvim' },
})
