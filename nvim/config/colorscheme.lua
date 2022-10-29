local colorscheme = "deus"

local is_colorscheme_avaiable = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not is_colorscheme_avaiable then
    vim.notify("Colorscheme " .. colorscheme .. " not found!")
end

