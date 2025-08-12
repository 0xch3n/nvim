return {
	"dstein64/nvim-scrollview",
	event = "VeryLazy",
	main = "scrollview",
	opts = {
		excluded_filetypes = { "nvimtree" },
		current_only = true,
		winblend = 75,
		base = "right",
		column = 1,
	},
}
