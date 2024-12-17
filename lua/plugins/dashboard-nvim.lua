require('dashboard').setup {
    theme = 'hyper',
    config = {
        -- week_header = {
        --     enable = true,
        -- },
        header = {
            " _______  __   __  ___   _  _______  __   __  _______  __    _  _______  _______  __   __ ",
            "|       ||  | |  ||   | | ||   _   ||  | |  ||   _   ||  |  | ||       ||       ||  | |  |",
            "|    ___||  | |  ||   |_| ||  | |  ||  |_|  ||  | |  ||   |_| ||    ___||    ___||  |_|  |",
            "|   |___ |  | |  ||      _||  |_|  ||       ||  |_|  ||       ||   |___ |   | __ |       |",
            "|    ___||  |_|  ||     |_ |       ||_     _||       ||  _    ||    ___||   ||  ||_     _|",
            "|   |    |       ||    _  ||   _   |  |   |  |   _   || | |   ||   |___ |   |_| |  |   |  ",
            "|___|    |_______||___| |_||__| |__|  |___|  |__| |__||_|  |__||_______||_______|  |___|  ",
            "                                                                                          ",
        },
        shortcut = {
            { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
            {
                icon = ' ',
                icon_hl = '@variable',
                desc = 'Files',
                group = 'Label',
                action = 'Telescope find_files',
                key = 'f',
            },
            {
                desc = ' Apps',
                group = 'DiagnosticHint',
                action = 'Telescope app',
                key = 'a',
            },
            {
                desc = ' dotfiles',
                group = 'Number',
                action = 'Telescope dotfiles',
                key = 'd',
            },
        },
    },
}
