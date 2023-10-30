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
    }
})
