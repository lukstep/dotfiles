local present, telescope = pcall(require, "telescope")
if not present then
    vim.notify("Telescope not found!", "error", { title = "Start-up" })
    return
end

require("telescope").load_extension("live_grep_args")

local actions = require("telescope.actions")
local lga_actions = require("telescope-live-grep-args.actions")
local action_state = require("telescope.actions.state")

local custom_actions = {}

function custom_actions.fzf_multi_select(prompt_bufnr)
    local picker = action_state.get_current_picker(prompt_bufnr)
    local num_selections = table.getn(picker:get_multi_selection())

    if num_selections > 1 then
        -- actions.file_edit throws - context of picker seems to change
        --actions.file_edit(prompt_bufnr)
        actions.send_selected_to_qflist(prompt_bufnr)
        actions.open_qflist()
    else
        actions.file_edit(prompt_bufnr)
    end
end

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
            height = 0.9,
            preview_cutoff = 1,
            },
        border = true,
        path_display = { "truncate" },
        mappings = {
            i = {
                ["<esc>"] = actions.close,
                ["<cr>"] = custom_actions.fzf_multi_select
            },
            n = {
                ["<esc>"] = actions.close,
                ["<cr>"] = custom_actions.fzf_multi_select
            }
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
        },
        extensions = {
            live_grep_args = {
                auto_quoting = true, -- enable/disable auto-quoting
                -- define mappings, e.g.
                mappings = { -- extend mappings
                    i = {
                        ["<C-k>"] = lga_actions.quote_prompt(),
                        ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                    },
                },
            },
        }
})

