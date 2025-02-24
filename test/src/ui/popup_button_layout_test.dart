import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:popup_build/src/ui/popup_button_layout.dart';

class _TestPopupButtonLayout with PopupButtonLayout {}

void main() => group('PopupButtonLayout', () {
      testWidgets('should return null when both start and end are null',
          (WidgetTester tester) async {
        final layout = _TestPopupButtonLayout();
        expect(
            layout.layout(start: null, end: null, isHorizontal: true), isNull);
      });

      testWidgets('should return a SizedBox with start widget when end is null',
          (WidgetTester tester) async {
        final layout = _TestPopupButtonLayout();
        const startWidget = Text('Start');
        final result =
            layout.layout(start: startWidget, end: null, isHorizontal: true);

        expect(result, isA<SizedBox>());
        expect((result as SizedBox).child, equals(startWidget));
      });

      testWidgets(
          'should return a Row with start and end widgets when isHorizontal is true',
          (WidgetTester tester) async {
        final layout = _TestPopupButtonLayout();
        const startWidget = Text('Start');
        const endWidget = Text('End');
        final result = layout.layout(
            start: startWidget,
            end: endWidget,
            spacing: 10.0,
            isHorizontal: true);

        expect(result, isA<Row>());
        final row = result as Row;
        expect(row.children.length, equals(3));
        expect(row.children[0], isA<Expanded>());
        expect(row.children[2], isA<Expanded>());
      });

      testWidgets(
          'should return a Column with start and end widgets when isHorizontal is false',
          (WidgetTester tester) async {
        final layout = _TestPopupButtonLayout();
        const startWidget = Text('Start');
        const endWidget = Text('End');
        final result = layout.layout(
            start: startWidget,
            end: endWidget,
            spacing: 10.0,
            isHorizontal: false);

        expect(result, isA<Column>());
        final column = result as Column;
        expect(column.children.length, equals(3));
        expect(column.children[0], isA<SizedBox>());
        expect(column.children[2], isA<SizedBox>());
      });
    });
