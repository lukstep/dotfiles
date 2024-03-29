local alpha = load_plugin("alpha")
if not alpha then
    return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
    [[                               __                ]],
    [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
    [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
    [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
    [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
    [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}
dashboard.section.buttons.val = {
    dashboard.button("f", "󰱼  Find file", ":Telescope find_files <CR>"),
    dashboard.button("e", "󰈔  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("g", "󰊢  Git status", ":Telescope git_status<cr>"),
    dashboard.button("b", "󰃀  Bookmarks", ":Telescope harpoon marks<cr>"),
    -- dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
    dashboard.button("r", "󱋡  Recently used files", ":Telescope oldfiles <CR>"),
    dashboard.button("t", "󱩾  Find text", ":Telescope live_grep_args <CR>"),
    dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
    dashboard.button("q", "󰩈  Quit Neovim", ":qa<CR>"),
}

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"
dashboard.opts.opts.noautocmd = true

local function footer()
    local nvim_version = vim.version()
    return ' ' .. nvim_version.major .. '.' .. nvim_version.minor .. '.' .. nvim_version.patch
end
dashboard.section.footer.val = footer()

-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
