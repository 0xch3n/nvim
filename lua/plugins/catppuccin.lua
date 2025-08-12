return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function (_, opts)
        require("catppuccin").setup({
            flavour = "auto",
            background = {
                light = "latte",
                dark = "macchiato",
            },
            transparent_background = true,
            show_end_of_buffer = false,
            color_overrides = {
                latte = {
                },
            },
        })
        vim.cmd.colorscheme "catppuccin"
    end
}
