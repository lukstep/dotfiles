local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    vim.notify("Lualine not found!", "error", { title = "Start-up" })
    return
end

local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    sections = { "error", "warn" },
    symbols = {
        error = " ",
        warn = " " },
    colored = false,
    update_in_insert = false,
    always_visible = false,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " "},
    cond = hide_in_width
}

local filetype = {
    "filetype",
    incons_enabled = true
}

local inactive_path = {
    "filename",
    file_status = true,
    path = 2
}

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
    options = {
        icons_enabled = true,
        theme = "one_monokai",
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        disable_filetypes = {
            'NVimTree',
        },
        always_divide_middle = true,
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", diff },
        lualine_c = { diagnostics },
        lualine_x = { filetype },
        lualine_y = { spaces, "encoding", "fileformat" },
        lualine_z = { "location", "progress" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { inactive_path },
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location", "progress" },
    },
    extensions = {'nvim-tree'}

})
