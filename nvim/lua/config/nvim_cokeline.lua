local status_ok, cokeline = pcall(require, "cokeline")
if not status_ok then
    vim.notify("Cokeline not found!", "error", { title = "Start-up" })
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
                    return "#C8C093"
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
                        return "#DCA561"
                    end
                    if buffer.diagnostics.errors ~= 0 then
                        return "#C34043"
                    end
                    if buffer.is_focused then
                        return "#98BB6C"
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
