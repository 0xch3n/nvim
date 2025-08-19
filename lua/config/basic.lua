local g = vim.g
local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.cursorline = true

opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 0

opt.autoread = true

opt.splitright = true
opt.splitbelow = true

opt.ignorecase = true
opt.smartcase = true

opt.hlsearch = false

opt.showmode = false

opt.cmdheight = 1

opt.whichwrap = "<,>,[,]"

-- add mouse support for all modes
opt.mouse = "a"
opt.mousemodel = "extend"

-- auto change ime
local ime_autogroup = vim.api.nvim_create_augroup("ImeAutoGroup", { clear = true })

vim.api.nvim_create_autocmd("InsertLeave", {
    group = ime_autogroup,
    callback = function ()
        vim.system({ "macism" }, { text = true }, function(out)
            -- 用一个全局变量存储之前的语言
            PREVIOUS_IM_CODE_MAC = string.gsub(out.stdout, "\n", "")
        end)
        vim.cmd ":silent :!macism com.apple.keylayout.ABC"
    end
})

vim.api.nvim_create_autocmd("InsertEnter", {
    group = ime_autogroup,
    callback = function ()
        if PREVIOUS_IM_CODE_MAC then
            vim.cmd(":silent :!macism " .. PREVIOUS_IM_CODE_MAC)
        end
        PREVIOUS_IM_CODE_MAC = nil
    end
})
