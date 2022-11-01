local present, telescope = pcall(require, "telescope")
if not present then
  return
end

local actions = require("telescope.actions")

telescope.setup({
    defaults = {
        prompt_prefix = "  ",
        selection_caret = " ",
        entry_prefix  = "  ",
        multi_icon = "",
        layout_strategy = "vertical",
        sort_strategy = "ascending",
        layout_config = {
            vertical = { mirror = false },
            width = 0.8,
            height = 0.80,
            preview_cutoff = 1,
            },
        border = true,
        path_display = { "smart" },
        mappings = {
            i = { ["<esc>"] = actions.close },
            n = { ["<esc>"] = actions.close }
            }
        },
        pickers = {
            buffers = {
                theme = "dropdown",
                previewer = false,
                ignore_current_buffer = true,
                sort_mru = true,
            },
            find_files = {
                find_command = { 'rg', '--hidden', '--files' },
                theme = "dropdown",
                previewer = false,
            }
        }
})
