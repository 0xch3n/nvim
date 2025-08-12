require("config.init")

vim.lsp.enable("lua_ls")
vim.lsp.enable("pyright")

-- Open help doc on right
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.txt",
    callback = function ()
        if vim.bo.buftype == "help" then
            vim.cmd.wincmd("L")
        end
    end,
})

-- Adjust font size
local function adjust_font_size(delte)
    local guifont = vim.opt.guifont:get()
    local new_size = tonumber(guifont:match("%d+$")) + delte
    vim.opt.guifont = guifont:gsub("%d+$", new_size)
end

-- vim.keymap.set('n', '<C-=>', function() adjust_font_size(1) end)
-- vim.keymap.set('n', '<C-->', function() adjust_font_size(-1) end)
