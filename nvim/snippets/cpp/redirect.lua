return {
	require("luasnip").parser.parse_snippet(
		"redirect",
		[[#ifdef LOCAL
  freopen("in.txt", "r", stdin);
  freopen("out.txt", "w", stdout);
#endif]]
	),
}
