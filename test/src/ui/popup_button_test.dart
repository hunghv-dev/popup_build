import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:popup_build/src/ui/popup_button.dart';

class _TestPopupButton with PopupButton {}

void main() => group('PopupButton', () {
      test('tryStart should return null when start is not set', () {
        final button = _TestPopupButton();
        expect(button.tryStart, isNull);
      });

      test('tryStart should return start widget when set', () {
        final button = _TestPopupButton();
        button.start = const Text('Start');
        expect(button.tryStart, isA<Text>());
      });

      test('tryEnd should return null when end is not set', () {
        final button = _TestPopupButton();
        expect(button.tryEnd, isNull);
      });

      test('tryEnd should return end widget when set', () {
        final button = _TestPopupButton();
        button.end = const Text('End');
        expect(button.tryEnd, isA<Text>());
      });
    });
