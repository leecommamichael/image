import 'dart:io';

import 'package:image/image.dart';
import 'package:image/src/formats/cur_encoder.dart';
import 'package:test/test.dart';

import '../test_util.dart';

void curTest() {
  group('cur', () {
    test('encode', () {
      final image = Image(64, 64)
      ..clear(ColorRgb8(100, 200, 255));

      // Encode the image to CUR
      final png = CurEncoder().encodeImage(image);
      File('$tmpPath/out/cur/encode.cur')
        ..createSync(recursive: true)
        ..writeAsBytesSync(png);

      final image2 = Image(64, 64)
      ..clear(ColorRgb8(100, 255, 200));

      final png2 = CurEncoder(hotSpots: {1: Point(64, 64), 0: Point(64, 64)})
          .encodeImages([image, image2]);
      File('$tmpPath/out/cur/encode2.cur')
        ..createSync(recursive: true)
        ..writeAsBytesSync(png2);

      final image3 = Image(32, 64)
      ..clear(ColorRgb8(255, 100, 200));

      final png3 = CurEncoder().encodeImages([image, image2, image3]);
      File('$tmpPath/out/cur/encode3.cur')
        ..createSync(recursive: true)
        ..writeAsBytesSync(png3);
    });
  });
}
