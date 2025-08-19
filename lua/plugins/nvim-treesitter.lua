return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = { "hiphish/rainbow-delimiters.nvim" },
	main = "nvim-treesitter.configs",
	branch = "main",
    lazy = false,
	opts = {
		ensure_installed = {
			"bash",
			"c",
			"c_sharp",
			"cpp",
			"css",
			"go",
			"html",
			"javascript",
			"json",
			"lua",
			"markdown",
			"markdown_inline",
			"python",
			"query",
			"rust",
			"toml",
			"typescript",
			"typst",
			"tsx",
			"vim",
			"vimdoc",
		},
	},
	config = function(_, opts)
		local nvim_treesitter = require("nvim-treesitter")
		nvim_treesitter.setup()

		local pattern = {}
		for _, parser in ipairs(opts.ensure_installed) do
			local has_parser, _ = pcall(vim.treesitter.language.inspect, parser)

			if not has_parser then
				nvim_treesitter.install(parser)
			else
				vim.list_extend(pattern, vim.treesitter.language.get_filetypes(parser))
			end
		end

		local group = vim.api.nvim_create_augroup("NvimTreesitterFt", { clear = true })
		vim.api.nvim_create_autocmd("FileType", {
			group = group,
			pattern = pattern,
			callback = function(ev)
				local max_filesize = 100 * 1024
				local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(ev.buf))
				if not (ok and stats and stats.size > max_filesize) then
					vim.treesitter.start()
                    -- if vim.bo.filetype ~= "dart" then
                    --     -- Conflicts with flutter-tools.nvim, causing performance issues
                    --     vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    -- end
				end
			end,
		})

		local rainbow_delimiters = require("rainbow-delimiters")
		vim.g.rainbow_delimiters = {
			strategy = {
				[""] = rainbow_delimiters.strategy["global"],
				vim = rainbow_delimiters.strategy["local"],
			},
			query = {
				[""] = "rainbow-delimiters",
				lua = "rainbow-blocks",
			},
			highlight = {
				"RainbowDelimiterRed",
				"RainbowDelimiterYellow",
				"RainbowDelimiterBlue",
				"RainbowDelimiterOrange",
				"RainbowDelimiterGreen",
				"RainbowDelimiterViolet",
				"RainbowDelimiterCyan",
			},
		}
		rainbow_delimiters.enable()

		vim.treesitter.language.register("query", "scheme")

		vim.api.nvim_exec_autocmds("FileType", { group = "NvimTreesitterFt" })
	end,
}
