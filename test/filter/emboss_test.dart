import 'dart:io';
import 'package:image/image.dart';
import 'package:test/test.dart';

import '../test_util.dart';

void embossTest() {
  test('emboss', () {
    final bytes = File('test/_data/png/buck_24.png').readAsBytesSync();
    final i0 = PngDecoder().decodeImage(bytes)!;
    emboss(i0);
    File('$tmpPath/out/filter/emboss.png')
      ..createSync(recursive: true)
      ..writeAsBytesSync(encodePng(i0));
  });
}
