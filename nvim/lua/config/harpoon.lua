local present, harpoon = pcall(require, "harpoon")
if not present then
    vim.notify("Harpoon not found!", "error", { title = "Start-up" })
    return
end

harpoon.setup({

})
