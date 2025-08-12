vim.g.mapleader = " "

local open_terminal = "<Cmd>split | terminal<CR>"

local function save_file()
	local buffer_is_modified = vim.api.nvim_get_option_value("modified", { buf = 0 })
	if buffer_is_modified then
		vim.cmd("write")
	else
		print("Buffer not modified. No writing is done.")
	end
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
end

local function undo()
	local mode = vim.api.nvim_get_mode().mode
	if mode == "n" or mode == "i" or mode == "v" then
		vim.cmd("undo")
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
	end
end

local function comment(pos)
    return function()
        local row = vim.api.nvim_win_get_cursor(0)[1]
        local total_lines = vim.api.nvim_buf_line_count(0)
        local commentstring = vim.bo.commentstring
        local cmt = string.gsub(commentstring, "%%s", "")
        local index = string.find(commentstring, "%%s")

        local target_line
        if pos == "below" then
            if row == total_lines then
                target_line = vim.api.nvim_buf_get_lines(0, row-1, row, true)[1]
            else
                target_line = vim.api.nvim_buf_get_lines(0, row, row + 1, true)[1]
            end
        else
            target_line = vim.api.nvim_get_current_line()
        end

        if pos == "end" then
            if string.find(target_line, "%S") then
                cmt = " " .. cmt
                index = index + 1
            end
            vim.api.nvim_buf_set_lines(0, row-1, row, false, {target_line .. cmt})
            vim.api.nvim_win_set_cursor(0, {row, #target_line + index -2})
        else
            local line_start = string.find(target_line, "%S") or (#target_line + 1)
            local blank = string.sub(target_line, 1, line_start - 1)

            if pos == "above" then
                vim.api.nvim_buf_set_lines(0, row - 1, row -1, true, {blank .. cmt})
                vim.api.nvim_win_set_cursor(0, { row, #blank + index -2})
            end

            if pos == "below" then
                vim.api.nvim_buf_set_lines(0, row, row, true, { blank .. cmt})
                vim.api.nvim_win_set_cursor(0, {row + 1, #blank + index - 2})
            end
        end

        vim.api.nvim_feedkeys("a", "n", false)
    end
end

local function comment_line()
	local line = vim.api.nvim_get_current_line()
	local row = vim.api.nvim_win_get_cursor(0)[1]
	local commentstring = vim.bo.commentstring
	local cmt = string.gsub(commentstring, "%%s", "")
	local index = string.find(commentstring, "%%s")

    -- process blank row
	if not string.find(line, "%S") then
		vim.api.nvim_buf_set_lines(0, row - 1, row, false, { line .. cmt })
		vim.api.nvim_win_set_cursor(0, { row, #line + index - 1 })
        vim.api.nvim_feedkeys("a", "n", false)
	else
		require("vim._comment").toggle_lines(row, row, { row, 0 })
	end
end

vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set({ "n", "i" }, "<C-z>", undo)

vim.keymap.set("n", "<C-t>", open_terminal)
vim.keymap.set({ "n", "i", "v" }, "<C-s>", save_file)

-- cmd control
vim.keymap.set("c", "<C-h>", "<Left>", { silent = true })
vim.keymap.set("c", "<C-l>", "<Right>", { silent = true })
vim.keymap.set("c", "<C-0>", "<Home>", { silent = true })
vim.keymap.set("c", "<C-4>", "<End>", { silent = true })
vim.keymap.set("c", "<A-w>", "<S-Right>", { silent = true })
vim.keymap.set("c", "<A-b>", "<S-Left>", { silent = true })

-- comment
vim.keymap.set("n", "gcc", comment_line)
vim.keymap.set("n", "gcO", comment "above")
vim.keymap.set("n", "gco", comment "below")
vim.keymap.set("n", "gcA", comment "end")

-- add line in normal mode
vim.keymap.set("n", "<A-o>", "o<Esc>")
vim.keymap.set("n", "<A-O>", "O<Esc>")
