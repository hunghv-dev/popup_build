import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:popup_build/src/popup_bottom_sheet.dart';

void main() => group('PopupBottomSheet', () {
      testWidgets('PopupBottomSheet can be created',
          (WidgetTester tester) async {
        final popup = PopupBottomSheet(
          Container(height: 200, color: Colors.white),
          marginTop: 10.0,
          isExpanded: true,
          isDismissible: false,
        );

        expect(popup.marginTop, 10.0);
        expect(popup.isExpanded, true);
        expect(popup.isDismissible, false);
      });

      testWidgets('PopupBottomSheet should open modal bottom sheet',
          (WidgetTester tester) async {
        final popup = PopupBottomSheet(
          Container(height: 200, color: Colors.white),
        );

        await tester.pumpWidget(MaterialApp(
          home: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () => popup.show(context),
                child: const Text('Open Bottom Sheet'),
              );
            },
          ),
        ));

        await tester.tap(find.text('Open Bottom Sheet'));
        await tester.pumpAndSettle();

        expect(find.byType(Container), findsOneWidget);
      });
    });
