return {
	require("luasnip").parser.parse_snippet(
		"fmodel",
		[[import 'package:freezed_annotation/freezed_annotation.dart';

part '$1.freezed.dart';

@freezed
class $2 with _$$2 {
  const factory $2({
		$0,
  }) = _$2;
}]]
	),
}
