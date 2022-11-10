local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
    vim.notify("Bufferline not found!", "error", { title = "Start-up" })
    return
end

bufferline.setup {
    options = {
        numbers = "ordinal",
        sort_by = "insert_afer_current",
        close_command = "Bdelete! %d",
        right_mouse_command = "Bdelete! %d",
        left_mouse_command = "buffer %d", 
        middle_mouse_command = nil, 
        indicator = {
            style = 'underline',
        },
        hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
        },
        buffer_close_icon = "",
        modified_icon = "●",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 30,
        max_prefix_length = 30,
        diagnostics = false, 
        diagnostics_update_in_insert = false,
        offsets = {{
            filetype = "NvimTree",
            text = function()
                return vim.fn.getcwd()
                end,
            highlight = "Directory",
            text_align = "left"
        }},
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = false,
        show_tab_indicators = true,
        persist_buffer_sort = true, 
        separator_style = "thick",
        enforce_regular_tabs = true,
        always_show_bufferline = true,
    },
}
