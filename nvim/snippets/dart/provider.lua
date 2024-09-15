return {
	require("luasnip").parser.parse_snippet(
		"provider",
		[[import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '${1}_provider.g.dart';

@riverpod
${2:dynamic} ${3}(Ref ref) {
	${0}
} ]]
	),
}
