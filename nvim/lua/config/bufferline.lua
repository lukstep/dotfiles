local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
    vim.notify("Bufferline not found!", "error", { title = "Start-up" })
    return
end


bufferline.setup {
    options = {
        sort_by = "insert_afer_current",
        close_command = "BDelete this",
        right_mouse_command = "BDelete! this",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,
        modified_icon = "●",
        left_trunc_marker = "",
        right_trunc_marker = "",
        diagnostics = true,
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
    },
}

require('close_buffers').setup({
  preserve_window_layout = { 'this' },
  next_buffer_cmd = function(windows)
    require('bufferline').cycle(1)
    local bufnr = vim.api.nvim_get_current_buf()

    for _, window in ipairs(windows) do
      vim.api.nvim_win_set_buf(window, bufnr)
    end
  end,
})
