return {
	require('luasnip').parser.parse_snippet("cb",
		[[case ${1:identifierName}:
	$2
break;
$0
]]
	)
}
