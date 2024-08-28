return {
	require("luasnip").parser.parse_snippet(
		"provider",
		[[final $1Provider = Provider<$2>((ref) {
	return $3;
});
			]]
	),
}
