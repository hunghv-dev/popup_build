import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:popup_build/src/ui/popup_icon.dart';

class _TestPopupIcon with PopupIcon {}

void main() => group('PopupIcon', () {
      test('tryResource should return null when resource is not set', () {
        final icon = _TestPopupIcon();
        expect(icon.tryResource, isNull);
      });

      test('tryResource should return SvgPicture when resource is a String',
          () {
        final icon = _TestPopupIcon();
        icon.resource = 'assets/icon.svg';
        expect(icon.tryResource, isA<SvgPicture>());
      });

      test('tryResource should return the widget when resource is a Widget',
          () {
        final icon = _TestPopupIcon();
        icon.resource = const Icon(Icons.star);
        expect(icon.tryResource, isA<Icon>());
      });

      test('tryResource should return SizedBox.shrink when resource is invalid',
          () {
        final icon = _TestPopupIcon();
        icon.resource = 123;
        expect(icon.tryResource, isA<SizedBox>());
      });
    });
