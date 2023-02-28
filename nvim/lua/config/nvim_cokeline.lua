local status_ok, cokeline = pcall(require, "cokeline")
if not status_ok then
    vim.notify("Cokeline not found!", "error", { title = "Start-up" })
    return
end

local get_hex = require("cokeline/utils").get_hex
local space = {text = " "}

vim.cmd([[hi TabLineFill guifg=none ctermfg=none guibg=none ctermbg=none gui=none cterm=none]])

cokeline.setup(
{
    default_hl = {
        fg = function(buffer)
            return buffer.is_focused and nil or get_hex("Comment", "fg")
        end,
        bg = "none",
    },
    buffers = {
        filter_visible = function(buffer)
            return buffer.type ~= "terminal" and buffer.type ~= "quickfix"
        end,
    },
    sidebar = {
        filetype = 'NvimTree',
        components = {
            {
                text = '  NvimTree',
                fg = "grey",
                bg = get_hex('NvimTreeNormal', 'bg'),
                style = 'bold',
            },
        }
    },
    components = {
        space,
        {
            text = function(buffer)
                return buffer.index .. ": "
            end,
            fg = function(buffer)
                return "#e5c463"
            end
        },
        {
            text = function(buffer)
                return buffer.devicon.icon
            end,
            fg = function(buffer)
                return buffer.devicon.color
            end
        },
        {
            text = function(buffer)
                return buffer.unique_prefix .. buffer.filename
            end,
            fg = function(buffer)
                if buffer.is_modified then
                    return "#e5c463"
                end
                if buffer.diagnostics.errors ~= 0 then
                    return "#fc5d7c"
                end
                if buffer.is_focused then
                    return "#88B966"
                end
            end,
            style = function(buffer)
                if buffer.is_focused then
                    return "underline"
                end
                return nil
            end
        },
        {
            text = function(buffer)
                if buffer.is_readonly then
                    return " "
                end
                return ""
            end
        },
        space
    }
    }
)
