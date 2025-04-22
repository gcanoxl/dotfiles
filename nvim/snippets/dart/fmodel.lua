return {
	require("luasnip").parser.parse_snippet(
		"fmodel",
		[[import 'package:freezed_annotation/freezed_annotation.dart';

part '$1.freezed.dart';
part '$1.g.dart';

@freezed
abstract class $2 with _$$2 {
  const factory $2({
		$0
  }) = _$2;

  factory $2.fromJson(Map<String, Object?> json)
      => _$$2FromJson(json);
}
		]]
	),
}
