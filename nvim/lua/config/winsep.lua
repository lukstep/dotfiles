local present, winsep = pcall(require, "colorful-winsep")
if not present then
    vim.notify("Winsep not found!", "error", { title = "Start-up" })
    return
end

winsep.setup({
    highlight = {
        fg = "#88B966",
    }
})
