-------------------------------------------------
-- COLORSCHEMES
-------------------------------------------------
local ok, _ = pcall(vim.cmd, 'colorscheme base16-tokyo-night-dark')
-- black')
-- oceanicnext
-- solarized-dark
-- tokyo-night-dark

vim.api.nvim_create_autocmd("TextYankPost", {
	group = num_au,
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 120 })
	end,
})
