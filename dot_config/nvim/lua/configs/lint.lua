local lint = require("lint")

lint.linters_by_ft = {
	python = { "ruff" },
	markdown = { "markdownlint", "vale" },
	yaml = { "yamllint" },
	ansible = { "ansible-lint" },
	-- javascript = { "eslint" },
	-- typescript = { "eslint" },
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	callback = function()
		lint.try_lint()
	end,
})
