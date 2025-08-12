return {
	"nvimdev/dashboard-nvim",
	event = "vimEnter",
	opts = {
		theme = "doom",
		config = {
			header = {
				" ",
				"██╗██╗  ██╗ █████╗ ████████╗███████╗████████╗██╗  ██╗███████╗██╗    ██╗ ██████╗ ██████╗ ██╗     ██████╗ ",
				"██║██║  ██║██╔══██╗╚══██╔══╝██╔════╝╚══██╔══╝██║  ██║██╔════╝██║    ██║██╔═══██╗██╔══██╗██║     ██╔══██╗",
				"██║███████║███████║   ██║   █████╗     ██║   ███████║█████╗  ██║ █╗ ██║██║   ██║██████╔╝██║     ██║  ██║",
				"██║██╔══██║██╔══██║   ██║   ██╔══╝     ██║   ██╔══██║██╔══╝  ██║███╗██║██║   ██║██╔══██╗██║     ██║  ██║",
				"██║██║  ██║██║  ██║   ██║   ███████╗   ██║   ██║  ██║███████╗╚███╔███╔╝╚██████╔╝██║  ██║███████╗██████╔╝",
				"╚═╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝ ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═════╝ ",
				" ",
				string.format(
					"                                                  %s                                                    ",
					require("config.utils").version
				),
				" ",
			},
			center = {
				{
					icon = "  ",
					desc = "New",
					action = "",
					key = "N",
				},
				{
					icon = "  ",
					desc = "Find",
					action = "Telescope live_grep",
					key = "F",
				},
				{
					icon = "  ",
					desc = "Lazy",
					action = "Lazy",
					key = "L",
				},
				{
					icon = "  ",
					desc = "Mason",
					action = "Mason",
					key = "M",
				},
				{
					icon = "  ",
					desc = "Todo",
					action = "edit ~/.config/nvim/README.md",
					key = "T",
				},
				{
					icon = "  ",
					desc = "Quit",
					action = "exit",
					key = "Q",
				},
			},
			footer = { "Where my friday !!! 😭😭😭" },
			vertical_center = true,
		},
	},
	config = function(_, opts)
		require("dashboard").setup(opts)

        if vim.api.nvim_buf_get_name(0) == "" then
            vim.cmd "Dashboard"
        end

		vim.cmd("highlight DashboardFooter cterm=NONE gui=NONE")
	end,
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
	},
}
