return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(_, _, diagnostics_dict, _)
				local indicator = " "
				for level, number in pairs(diagnostics_dict) do
					local symbol
					if level == "error" then
						symbol = " "
					elseif level == "warning" then
						symbol = " "
					else
						symbol = " "
					end
					indicator = indicator .. number .. symbol
				end
				return indicator
			end,
		},
	},
	keys = {
		{ "<leader>bh", ":BufferLineCyclePrev<CR>", desc = "prev buffer", silent = true },
		{ "<leader>bl", ":BufferLineCycleNext<CR>", desc = "next buffer", silent = true },
		{ "<leader>bq", ":bdelete<CR>", desc = "close current buffer", silent = true },
		{ "<leader>bo", ":BufferLineCloseOthers<CR>", desc = "close other buffers", silent = true },
		{ "<leader>bp", ":BufferLinePick<CR>", desc = "pick buffer", silent = true },
		{ "<leader>bc", ":BufferLinePickClose<CR>", desc = "pick close", silent = true },
	},
	lazy = false,
}
