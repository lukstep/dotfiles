local present, indent_blankline = pcall(require, "indent_blankline")
if not present then
    vim.notify("Indent-blankline not found!", "error", { title = "Start-up" })
    return
end

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

indent_blankline.setup({
    show_end_of_line = true,
    show_current_context_start = true,
    space_char_blankline = " ",
})
