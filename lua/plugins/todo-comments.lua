return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "VeryLazy",
	main = "todo-comments",
	opts = {},
	keys = {
		{ "<leader>ut", "<Cmd>TodoTelescope<CR>", desc = "todo list", silent = true },
	},
}
