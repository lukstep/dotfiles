local devicons = load_plugin("nvim-web-devicons")
if not devicons then
    return
end

devicons.setup({
    override_by_extension = {
        ["xml"] = {
            icon = "",
            color = "#990F0E",
            name = "XML"
        },
        ["txt"] = {
            icon = "",
            color = "#808080",
            name = "TXT"
        }
    }
})


local window_picker = load_plugin("window-picker")
if not window_picker then
    return
end

window_picker.setup({
    hint = 'floating-big-letter'
})


local nvim_tree = load_plugin("nvim-tree")
if not nvim_tree then
    return
end

nvim_tree.setup({
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    open_on_tab = false,
    hijack_cursor = true,
    update_cwd = true,
    renderer = {
        highlight_git = false,
        root_folder_modifier = ":t",
        icons = {
            git_placement = "after",
            glyphs = {
                default = "󰈔",
                symlink = "󱀱",
                git = {
                    unstaged = "󰝦",
                    staged = "󰝥",
                    unmerged = "",
                    renamed = "󱖘",
                    deleted = "󰮈",
                    untracked = "U",
                    ignored = "",
                },
                folder = {
                    default = "󰉋",
                    open = "󰝰",
                    empty = "󰉖",
                    empty_open = "󰷏",
                    symlink = "󱉆",
                }
            },
            show = {
                git = true,
                folder = true,
                file = true,
                folder_arrow = false,
            }
        }
    },
    diagnostics = {
        enable = false
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },
    git = {
        enable = true,
        ignore = false,
        timeout = 500,
    },
    view = {
        adaptive_size = true,
        width = 30,
        hide_root_folder = false,
        side = "right",
        number = false,
    },
    actions = {
        open_file = {
            window_picker = {
                enable = true,
                -- picker = "default",
                picker = window_picker.pick_window,
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                -- exclude = {
                --   filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                --   buftype = { "nofile", "terminal", "help" },
                -- },
            },
        }
    }
})
