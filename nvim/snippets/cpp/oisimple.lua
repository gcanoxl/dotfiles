return {
	require("luasnip").parser.parse_snippet(
		"oisimple",
		[[#include <iostream>
using namespace std;

int main() {
  ${0:cout << "hello world" << endl};
  return 0;
}]]
	),
}
