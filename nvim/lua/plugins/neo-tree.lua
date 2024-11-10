local function generate_screen(state)
	-- TODO: write a template plugin to make it easier to use
	local node = state.tree:get_node()
	if not node or node.type ~= "directory" then
		return
	end

	local function generate_screen_files(path, name)
		local screen_dir = path .. "/" .. name
		local components_dir = screen_dir .. "/components"
		local screen_file = screen_dir .. "/" .. name .. "_screen.dart"
		local body_file = components_dir .. "/" .. name .. "_body.dart"

		vim.fn.mkdir(components_dir, "p")

		local function process_name(n)
			local parts = vim.fn.split(n, "_")
			local capitalized_parts = {}
			for _, part in ipairs(parts) do
				local pname = part:gsub("^%l", string.upper)
				table.insert(capitalized_parts, pname)
			end
			return table.concat(capitalized_parts)
		end

		local pname = process_name(name)
		-- screen file
		vim.fn.writefile({
			"import 'package:flutter/material.dart';",
			"",
			"import 'components/" .. name .. "_body.dart';",
			"",
			"class " .. pname .. "Screen extends StatelessWidget {",
			"  static const String routeName = '/" .. name .. "';",
			"",
			"  const " .. pname .. "Screen({super.key});",
			"",
			"  @override",
			"  Widget build(BuildContext context) {",
			"    return const Scaffold(",
			"      body: " .. pname .. "Body(),",
			"    );",
			"  }",
			"}",
		}, screen_file)
		-- body file
		vim.fn.writefile({
			"import 'package:flutter/material.dart';",
			"",
			"class " .. pname .. "Body extends StatelessWidget {",
			"  const " .. pname .. "Body({super.key});",
			"",
			"  @override",
			"  Widget build(BuildContext context) {",
			"    return const Placeholder();",
			"  }",
			"}",
		}, body_file)

		vim.cmd("edit " .. screen_file)
		vim.cmd("edit " .. body_file)
	end

	vim.ui.input("screen_name: ", function(name)
		if name ~= "" then
			generate_screen_files(node.path, name)
		end
	end)
end
return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = { "MunifTanjim/nui.nvim" },
	config = function()
		vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
		require("neo-tree").setup({
			window = {
				width = 30,
				mappings = {
					["<tab>"] = "open",
					["O"] = "expand_all_nodes",
					["C"] = "close_all_subnodes",
				},
			},
			filesystem = {
				filtered_items = {
					hide_by_pattern = { -- uses glob style patterns
						"*.g.dart",
						"*.freezed.dart",
					},

					always_show = {
						".gitignore",
						".nvim.lua",
					},
				},
				window = {
					mappings = {
						["<C-g>"] = generate_screen,
					},
				},
				use_libuv_file_watcher = true,
				follow_current_file = {
					enabled = true,
					leave_dirs_open = true,
				},
			},
		})
	end,
}
