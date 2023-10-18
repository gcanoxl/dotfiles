return {
	require('luasnip').parser.parse_snippet("cle",
		[[class ${1:ClassName} extends ${2:ParentClassName} {
	$0
}
]]
	)
}
