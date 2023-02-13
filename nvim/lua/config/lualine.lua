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

local modified_icon = "●"
local readonly_icon = ""

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
    path = 2,
    symbols = {
        modified = modified_icon,
        readonly = readonly_icon,
        unnamed = "",
        newfile = "",
    }
}

local path = {
    "filename",
    file_status = true,
    newfile_status = false,
    path = 1,
    symbols = {
        modified = modified_icon,
        readonly = readonly_icon,
        unnamed = "",
        newfile = ""
    }
}

local lsp = function()
    local names = {}
    for i, lsp_server in pairs(vim.lsp.buf_get_clients(0)) do
        table.insert(names, lsp_server.name)
    end
    return "LSP [" .. table.concat(names, " ") .. "]"
end

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

local clock = function ()
    local time = os.date('%H:%M:%S')
    return time
end

lualine.setup({
    options = {
        icons_enabled = true,
        theme = "one_monokai",
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        globalstatus = true,
        always_divide_middle = true,
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", diff, diagnostics },
        lualine_c = { path },
        lualine_x = { lsp, filetype },
        lualine_y = { spaces, "encoding", "fileformat" },
        lualine_z = { "location", "progress", clock },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { inactive_path },
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location", "progress" },
    },
    extensions = {'nvim-tree', "toggleterm", "quickfix"}

})

if _G.Statusline_timer == nil then
    _G.Statusline_timer = vim.loop.new_timer()
else
    _G.Statusline_timer:stop()
end
_G.Statusline_timer:start(0, 1000, vim.schedule_wrap(function() vim.api.nvim_command('redrawstatus') end))
