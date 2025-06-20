require("avante").setup({
	provider = "ollama", -- top-level preferred provider
	auto_suggestions_provider = "ollama",
	providers = {
		gemini = {
			__inherited_from = "openai",
			endpoint = "https://generativelanguage.googleapis.com/v1beta/openai/",
			api_key_name = "GEMINI_API_KEY",
			model = "gemini-2.0-flash",
		},
		openrouter = {
			__inherited_from = "openai",
			endpoint = "https://openrouter.ai/api/v1",
			api_key_name = "OPENROUTER_API_KEY",
			model = "deepseek/deepseek-r1",
		},
		ollama = {
			endpoint = "http://localhost:11434",
			model = "qwen2.5-coder:latest",
		},
		ollamagcr = {
			__inherited_from = "ollama",
			endpoint = "OLLAMA_GCR_URL",
			model = "qwen2.5-coder:7b",
		},
		openai = {
			endpoint = "https://api.openai.com/v1",
			api_key_name = "OPENAI_API_KEY",
			model = "gpt-4o",
			extra_request_body = {
				timeout = 30000,
				temperature = 0.75,
				max_completion_tokens = 8192,
			},
		},
	},
	system_prompt = function()
		local hub = require("mcphub").get_hub_instance()
		return hub and hub:get_active_servers_prompt() or ""
	end,
	custom_tools = function()
		return {
			require("mcphub.extensions.avante").mcp_tool(),
		}
	end,
})
