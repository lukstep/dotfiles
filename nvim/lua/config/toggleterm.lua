local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	vim.notify("Toggleterm can't be found", "error", { title = "Start-up" })
    return
end

toggleterm.setup({
	size = function(term)
        if term.direction == "horizontal" then
            return vim.o.lines * 0.5
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
        end
    end,
	open_mapping = [[<c-\>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 40,
	start_in_insert = false,
	insert_mappings = true,
	persist_size = true,
	direction = "horizontal",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "single",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

local Terminal = require("toggleterm.terminal").Terminal

local tig = Terminal:new({
    cmd = "tig",
    hidden = true,
    direction = "float",
    close_on_exit = true,
    on_open = function(term)
        vim.cmd("startinsert!")
    end,
})
function _TIG_TOGGLE()
	tig:toggle()
end

local python = Terminal:new({
    cmd = "python3",
    hidden = true,
    direction = "float",
    close_on_exit = true,
    on_open = function(term)
        vim.cmd("startinsert!")
    end,
})
function _PYTHON_TOGGLE()
	python:toggle()
end
