local status_ok, flatten = pcall(require, "flatten")
if not status_ok then
    vim.notify("Flatten can't be found", "error", { title = "Start-up" })
    return
end

flatten.setup({
    callbacks = {
        -- Called when a request to edit file(s) is received
        pre_open = function()
        end,
        -- Called after a file is opened
        -- Passed the buf id, win id, and filetype of the new window
        post_open = function(bufnr, winnr, filetype)
        end,
        -- Called when a file is open in blocking mode, after it's done blocking
        -- (after bufdelete, bufunload, or quitpre for the blocking buffer)
        block_end = function()
        end,
    },
    -- <String, Bool> dictionary of filetypes that should be blocking
    block_for = {
        gitcommit = true
    },
    -- Window options
    window = {
        -- Options:
        -- current        -> open in current window (default)
        -- tab            -> open in new tab
        -- split          -> open in split
        -- vsplit         -> open in vsplit
        -- func(new_bufs) -> only open the files, allowing you to handle window opening yourself.
        -- Argument is an array of buffer numbers representing the newly opened files.
        open = "tab",
        -- Affects which file gets focused when opening multiple at once
        -- Options:
        -- "first"        -> open first file of new files (default)
        -- "last"         -> open last file of new files
        focus = "first"
    }
})
