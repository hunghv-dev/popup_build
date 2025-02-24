import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:popup_build/src/ui/popup_spacing.dart';

class _TestPopupSpacing with PopupSpacing {}

void main() => group('PopupSpacing', () {
      test('tryPadding should return null when padding is not set', () {
        final spacing = _TestPopupSpacing();
        expect(spacing.tryPadding, isNull);
      });

      test('tryPadding should return padding when set', () {
        final spacing = _TestPopupSpacing();
        spacing.padding = const EdgeInsets.all(10.0);
        expect(spacing.tryPadding, equals(const EdgeInsets.all(10.0)));
      });

      test(
          'tryContentPadding should return null when contentPadding is not set',
          () {
        final spacing = _TestPopupSpacing();
        expect(spacing.tryContentPadding, isNull);
      });

      test('tryContentPadding should return contentPadding when set', () {
        final spacing = _TestPopupSpacing();
        spacing.contentPadding = const EdgeInsets.symmetric(vertical: 10.0);
        expect(spacing.tryContentPadding,
            equals(const EdgeInsets.symmetric(vertical: 10.0)));
      });

      test('tryButtonSpacing should return null when buttonSpacing is not set',
          () {
        final spacing = _TestPopupSpacing();
        expect(spacing.tryButtonSpacing, isNull);
      });

      test('tryButtonSpacing should return buttonSpacing when set', () {
        final spacing = _TestPopupSpacing();
        spacing.buttonSpacing = 20.0;
        expect(spacing.tryButtonSpacing, equals(20.0));
      });
    });
