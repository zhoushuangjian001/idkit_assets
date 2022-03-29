import 'package:idkit_assets/idkit_assets.dart';
import 'package:test/test.dart';

void main() {
  test('calculate', () {
    var va = 'assets\\a\\b.txt';
    va = va.replaceAll('\\', '/');
    print(va);
    help();
  });
}
