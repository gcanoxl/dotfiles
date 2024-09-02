return {
	require("luasnip").parser.parse_snippet(
		"notifier",
		[[ 
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '$1_provider.g.dart';

@riverpod
class $2 extends _$$2 {

  @override
  ${3:void} build() {
    return $4;
  }
	$0
	]]
	),
}
