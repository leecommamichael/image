import 'dart:io';
import 'package:image/image.dart';
import 'package:test/test.dart';

import '../test_util.dart';

void pixelateTest() {
  test('pixelate', () {
    final bytes = File('test/_data/png/buck_24.png').readAsBytesSync();
    final i0 = PngDecoder().decodeImage(bytes)!;
    final i1 = i0.clone();
    pixelate(i0, 10);
    File('$tmpPath/out/filter/pixelate_upperLeft.png')
      ..createSync(recursive: true)
      ..writeAsBytesSync(encodePng(i0));

    pixelate(i1, 10, mode: PixelateMode.average);
    File('$tmpPath/out/filter/pixelate_average.png')
      ..createSync(recursive: true)
      ..writeAsBytesSync(encodePng(i1));
  });
}
