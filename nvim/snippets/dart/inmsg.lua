return {
	require('luasnip').parser.parse_snippet("inmsg",
		[[String get $1 {
  return Intl.message(
    "$2",
    name: "$1",
    desc: '$3',
  );
}
]]
	)
}
