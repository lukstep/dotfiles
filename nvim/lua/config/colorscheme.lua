local colorscheme = "one_monokai"

local is_colorscheme_avaiable = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not is_colorscheme_avaiable then
    vim.notify({"Colorscheme " .. colorscheme .. " not found!" }, "error", { title = "Start-up" })
    return
end

require("one_monokai").setup({
    use_cmd = false
})

