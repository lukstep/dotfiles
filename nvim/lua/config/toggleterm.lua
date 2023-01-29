local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	vim.notify("Toggleterm can't be found", "error", { title = "Start-up" })
    return
end

toggleterm.setup({
	-- size = 100,
	open_mapping = [[<c-\>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 40,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
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
