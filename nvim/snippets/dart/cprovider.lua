return {
	require("luasnip").parser.parse_snippet(
		"cprovider",
		[[import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '${1}.g.dart';

@Riverpod(keepAlive: true)
${2} ${3}(Ref ref) => ${2}();

class ${2} {
  static get provider => ${3}Provider;
}
]]
	),
}
