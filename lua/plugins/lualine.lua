return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	event = "VeryLazy",
	main = "lualine",
	opts = {
		options = {
			theme = "auto",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
		},
		extensions = { "nvim-tree" },
		sections = {
			lualine_b = { "branch", "diff" },
			lualine_c = {
				"filename",
			},
			lualine_x = {
				"filesize",
				{
					"fileformat",
					symbols = { unix = " ", mac = " ", dos = " " },
				},
				"encoding",
				"filetype",
			},
		},
	},
}
