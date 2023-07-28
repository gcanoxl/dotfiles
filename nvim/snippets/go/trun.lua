return {
	require('luasnip').parser.parse_snippet("trun",
		[[
		t.Run("$1", func(t *testing.T) {
			$0
	})
]]
	)
}
