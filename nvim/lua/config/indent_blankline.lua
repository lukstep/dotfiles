local present, indent_blankline = pcall(require, "ibl")
if not present then
    vim.notify("Indent-blankline not found!", "error", { title = "Start-up" })
    return
end

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"


indent_blankline.setup()
