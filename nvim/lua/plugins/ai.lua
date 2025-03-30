return {

	{
		"monkoose/neocodeium",
		event = "VeryLazy",
		config = function()
			local neocodeium = require("neocodeium")
			neocodeium.setup()
			vim.keymap.set("i", "<C-k>", neocodeium.accept)
		end,
	},

	{
		"olimorris/codecompanion.nvim",
		event = "VeryLazy",
		keys = {
			{
				"<leader>ii",
				function()
					require("codecompanion").actions({})
				end,
				desc = "Toggle Code Companion",
			},
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			adapters = {
				-- LLMs -------------------------------------------------------------------
				anthropic = "anthropic",
				azure_openai = "azure_openai",
				copilot = "copilot",
				deepseek = "deepseek",
				gemini = "gemini",
				githubmodels = "githubmodels",
				huggingface = "huggingface",
				novita = "novita",
				mistral = "mistral",
				ollama = "ollama",
				openai = "openai",
				xai = "xai",
				-- NON-LLMs ---------------------------------------------------------------
				non_llms = {
					jina = "jina",
				},
				-- OPTIONS ----------------------------------------------------------------
				opts = {
					allow_insecure = false, -- Allow insecure connections?
					cache_models_for = 1800, -- Cache adapter models for this long (seconds)
					proxy = nil, -- [protocol://]host[:port] e.g. socks5://127.0.0.1:9999
					show_defaults = true, -- Show default adapters
				},
			},
			strategies = {
				inline = {
					adapter = "openai",
				},
				cmd = {
					adapter = "openai",
				},
				-- CHAT STRATEGY ----------------------------------------------------------
				chat = {
					adapter = "openai",
					roles = {
						---The header name for the LLM's messages
						---@type string|fun(adapter: CodeCompanion.Adapter): string
						llm = function(adapter)
							return "CodeCompanion (" .. adapter.formatted_name .. ")"
						end,

						---The header name for your messages
						---@type string
						user = "Me",
					},
					tools = {
						groups = {
							["full_stack_dev"] = {
								description = "Full Stack Developer - Can run code, edit code and modify files",
								system_prompt = "**DO NOT** make any assumptions about the dependencies that a user has installed. If you need to install any dependencies to fulfil the user's request, do so via the Command Runner tool. If the user doesn't specify a path, use their current working directory.",
								tools = {
									"cmd_runner",
									"editor",
									"files",
								},
							},
						},
						["cmd_runner"] = {
							callback = "strategies.chat.agents.tools.cmd_runner",
							description = "Run shell commands initiated by the LLM",
							opts = {
								requires_approval = true,
							},
						},
						["editor"] = {
							callback = "strategies.chat.agents.tools.editor",
							description = "Update a buffer with the LLM's response",
						},
						["files"] = {
							callback = "strategies.chat.agents.tools.files",
							description = "Update the file system with the LLM's response",
							opts = {
								requires_approval = true,
							},
						},
					},
				},
			},
		},
	},
}
