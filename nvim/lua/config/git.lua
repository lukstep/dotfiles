local git_signs = load_plugin("gitsigns")
if not git_signs then
    return
end

git_signs.setup({
    signs = {
        add = {
            hl = "GitSignsAdd",
            text = "▎",
            numhl = "GitSignsAddNr",
            linehl = "GitSignsAddLn"
        },
        change = {
            hl = "GitSignsChange",
            text = "▎",
            numhl = "GitSignsChangeNr",
            linehl = "GitSignsChangeLn"
        },
        delete = {
            hl = "GitSignsDelete",
            text = " ",
            numhl = "GitSignsDeleteNr",
            linehl = "GitSignsDeleteLn"
        },
        topdelete = {
            hl = "GitSignsDelete",
            text = " ",
            numhl = "GitSignsDeleteNr",
            linehl = "GitSignsDeleteLn"
        },
        changedelete = {
            hl = "GitSignsChange",
            text = "▎",
            numhl = "GitSignsChangeNr",
            linehl = "GitSignsChangeLn"
        },
        untracked = {
            hl = 'GitSignsAdd',
            text = '┆',
            numhl = 'GitSignsAddNr',
            linehl = 'GitSignsAddLn'
        },
    },
    signcolumn = true,
    numhl = true,
    linehl = false,
    word_diff = false,
    watch_gitdir = {
        interval = 1000,
        follow_files = true,
    },
    attach_to_untracked = true,
    current_line_blame = true,
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 800,
        ignore_whitespace = false,
    },
    current_line_blame_formatter = '  <author>, <author_time:%R> - <summary>',
    current_line_blame_formatter_opts = {
        relative_time = true,
    },
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil,
    max_file_length = 40000,
    preview_config = {
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
    },
    yadm = {
        enable = false,
    },
})

local git_conflict = load_plugin("git-conflict")
if not git_conflict then
    return
end
git_conflict.setup()

local diff_view = load_plugin("diffview")
if not diff_view then
    return
end

diff_view.setup({
    enhanced_diff_hl = true,
    use_icons = true,
})
