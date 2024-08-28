return {
	require("luasnip").parser.parse_snippet(
		"stfConsumer",
		[[import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class $1 extends ConsumerStatefulWidget {
  const $1({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _$1State();
}

class _$1State extends ConsumerState<$1> {
  @override
  Widget build(BuildContext context) {
    return ${0:Container()};
  }
}
]]
	),
}
