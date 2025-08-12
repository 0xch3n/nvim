local M = {}

local version = vim.fn.matchstr(vim.fn.execute('version'), 'NVIM v\\zs[^\\n]*')
M.version = version


return M
