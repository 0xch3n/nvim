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
