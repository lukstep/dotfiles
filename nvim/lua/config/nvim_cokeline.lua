local cokeline = load_plugin("cokeline")
if not cokeline then
    return
end

local hlgroups = require("cokeline.hlgroups")
local space = { text = " " }

cokeline.setup(
    {
        default_hl = {
            fg = function(buffer)
                return buffer.is_focused and nil or hlgroups.get_hl_attr("Comment", "fg")
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
                    bg = hlgroups.get_hl_attr('NvimTreeNormal', 'bg'),
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
                    return COLORS.buffer_index
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
                        return COLORS.unsave_buffer
                    end
                    if buffer.diagnostics.errors ~= 0 then
                        return COLORS.error_buffer
                    end
                    if buffer.is_focused then
                        return COLORS.focused_buffer
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
