return {

	{
		"monkoose/neocodeium",
		event = "VeryLazy",
		config = function()
			local neocodeium = require("neocodeium")
			neocodeium.setup({
				enabled = true,
				silent = true,
				filetypes = {
					help = false,
					gitrebase = false,
					["."] = false,
					["cpp"] = false,
				},
			})
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
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
		opts = {
			provider = "openai",
			providers = {
				openai = {
					endpoint = "https://api.openai.com/v1",
					model = "gpt-4o-mini-2024-07-18",
					timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
					extra_request_body = {
						temperature = 0,
						max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
						reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
					},
				},
			},
			mappings = {
				---@class AvanteConflictMappings
				diff = {
					ours = "co",
					theirs = "ct",
					all_theirs = "ca",
					both = "cb",
					cursor = "cc",
					next = "]x",
					prev = "[x",
				},
				suggestion = {
					accept = "<M-l>",
					next = "<M-]>",
					prev = "<M-[>",
					dismiss = "<C-]>",
				},
				jump = {
					next = "]]",
					prev = "[[",
				},
				submit = {
					normal = "<CR>",
					insert = "<C-s>",
				},
				-- NOTE: The following will be safely set by avante.nvim
				ask = "<leader>ia",
				edit = "<leader>ie",
				refresh = "<leader>ir",
				focus = "<leader>if",
				toggle = {
					default = "<leader>it",
					debug = "<leader>id",
					hint = "<leader>ih",
					suggestion = "<leader>is",
					repomap = "<leader>iR",
				},
				sidebar = {
					apply_all = "A",
					apply_cursor = "a",
					retry_user_request = "r",
					edit_user_request = "e",
					switch_windows = "<Tab>",
					reverse_switch_windows = "<S-Tab>",
					remove_file = "d",
					add_file = "@",
					close = { "<Esc>", "q" },
					---@alias AvanteCloseFromInput { normal: string | nil, insert: string | nil }
					---@type AvanteCloseFromInput | nil
					close_from_input = nil, -- e.g., { normal = "<Esc>", insert = "<C-d>" }
				},
				files = {
					add_current = "@", -- Add current buffer to selected files
				},
				select_model = "<leader>i?", -- Select model command
				select_history = "<leader>ih", -- Select history command
			},
		},
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		build = "make",
		-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"echasnovski/mini.pick", -- for file_selector provider mini.pick
			"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
			"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
			"ibhagwan/fzf-lua", -- for file_selector provider fzf
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			"zbirenbaum/copilot.lua", -- for providers='copilot'
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
			{
				-- Make sure to set this up properly if you have lazy=true
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},
}
