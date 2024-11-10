return {
	require("luasnip").parser.parse_snippet(
		"fproject",
		[[require("flutter-tools").setup_project({
			$0
})]]
	),
}
