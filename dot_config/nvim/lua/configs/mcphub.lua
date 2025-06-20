require("mcphub").setup({
	-- config = vim.fn.expand("~/.config/nvim/mcpservers.json"),
	auto_approve = false,
	extensions = {
		avante = {
			make_slash_commands = true, -- make /slash commands from MCP server prompts
		},
		-- codecompanion = {
		-- 	show_result_in_chat = true,
		-- 	make_vars = true,
		-- 	make_slash_commands = true,
		-- },
	},
})
