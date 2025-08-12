return {
	"MagicDuck/grug-far.nvim",
	opts = {
		disableBufferLineNumbers = true,
		startInInsertMode = true,
		windowCreationCommand = "tabnew %",
	},
	keys = {
		{ "<leader>ug", "<cmd>GrugFar<CR>", desc = "find and replace", silent = true },
	},
}
