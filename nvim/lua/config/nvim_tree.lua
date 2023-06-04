local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    vim.notify("Telescope not found!", "error", { title = "Start-up" })
    return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
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
                default = "",
                symlink = "",
                git = {
                    unstaged = "ﱤ",
                    staged = "ﱣ",
                    unmerged = "",
                    renamed = "",
                    deleted = "ﮁ",
                    untracked = "U",
                    ignored = "",
                },
                folder = {
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
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
