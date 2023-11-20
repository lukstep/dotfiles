local telescope = load_plugin("telescope")
if not telescope then
    return
end

require("telescope").load_extension("live_grep_args")
require("telescope").load_extension("fzf")
require("telescope").load_extension("harpoon")

local actions = require("telescope.actions")
local lga_actions = require("telescope-live-grep-args.actions")
local action_state = require("telescope.actions.state")

local custom_actions = {}

function custom_actions.fzf_multi_select(prompt_bufnr)
    local picker = action_state.get_current_picker(prompt_bufnr)
    local num_selections = table.getn(picker:get_multi_selection())

    if num_selections > 1 then
        actions.send_selected_to_qflist(prompt_bufnr)
        actions.open_qflist()
    else
        actions.send_to_qflist(prompt_bufnr)
        actions.open_qflist()
    end
end

telescope.setup({
    defaults = {
        prompt_prefix   = "  ",
        selection_caret = " ",
        entry_prefix    = "  ",
        multi_icon      = "",
        layout_strategy = "vertical",
        sort_strategy   = "ascending",
        layout_config   = {
            vertical = { mirror = false },
            width = 0.8,
            height = 0.9,
            preview_cutoff = 1,
        },
        border          = true,
        -- path_display = { "truncate" },
        path_display    = function(opts, path)
            local tail = require("telescope.utils").path_tail(path)
            return string.format("%s (%s)", tail, path), { { { 1, #tail }, "Constant" } }
        end,
        mappings        = {
            i = {
                ["<esc>"] = actions.close,
                ["<c-q>"] = custom_actions.fzf_multi_select,
                ["<c-j>"] = actions.cycle_history_prev,
                ["<c-k>"] = actions.cycle_history_next,
                -- ["<c-k>"] = lga_actions.quote_prompt(),
                ["<c-b>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
            },
            n = {
                ["<esc>"] = actions.close,
                ["<c-q>"] = custom_actions.fzf_multi_select,
                ["<c-j>"] = actions.cycle_history_prev,
                ["<c-k>"] = actions.cycle_history_next,
            }
        }
    },
    pickers = {
        buffers = {
            -- theme = "dropdown",
            previewer = true,
            ignore_current_buffer = true,
            sort_mru = true,
        },
        find_files = {
            -- theme = "dropdown",
            previewer = true,
        },
        -- git_status = {
        --     cwd = "git status -z -- . --untracked-files=no"
        -- },
    },
    extensions = {
        live_grep_args = {
            auto_quoting = false,
            mappings = {
                -- extend mappings
                i = {
                },
                n = {
                    ["<c-b>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                }
            },
        },
    }
})

function TelescopeFindWord(word)
    require('telescope').extensions.live_grep_args.live_grep_args({
        default_text = '"' .. word .. '"' })
end

function TelescopeFindWordInJava(word)
    require('telescope').extensions.live_grep_args.live_grep_args({
        default_text = "-t java " .. '"' .. word .. '"' })
end

function TelescopeFindWordInFolder(word, folder)
    require('telescope').extensions.live_grep_args.live_grep_args({
        default_text = "--iglob **/" .. folder .. "/** " .. word .. '"' })
end

function TelescopeFindWordWitoutIgnore(word)
    require('telescope').extensions.live_grep_args.live_grep_args({
        default_text = " --no-ignore" .. '"' .. word .. '"' })
end

function TelescopeFindWordInBuild(word)
    require('telescope').extensions.live_grep_args.live_grep_args({
        default_text = '"' .. word .. '"' .. " ./build" })
end

local easypick = load_plugin("easypick")
if not easypick then
    return
end

local base_branch = "main"
easypick.setup({
    pickers = {
        {
            name = "diff_current_branch",
            command = "git diff --name-only $(git merge-base HEAD " .. base_branch .. " )",
            previewer = easypick.previewers.branch_diff({ base_branch = base_branch })
        },
        {
            name = "conflicts",
            command = "git diff --name-only --diff-filter=U --relative",
            previewer = easypick.previewers.file_diff()
        },
        {
            name = "status",
            command = "git diff --name-only --relative",
            previewer = easypick.previewers.file_diff()
        }

    }
})
