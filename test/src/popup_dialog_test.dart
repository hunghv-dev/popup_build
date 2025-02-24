import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:popup_build/src/popup_dialog.dart';

void main() => group('PopupDialog', () {
      testWidgets('PopupDialog can be created', (WidgetTester tester) async {
        final popup = PopupDialog(
          Container(width: 200, height: 100, color: Colors.white),
          insetPadding: const EdgeInsets.all(20.0),
        );

        expect(popup.insetPadding, const EdgeInsets.all(20.0));
      });

      testWidgets('PopupDialog should open dialog',
          (WidgetTester tester) async {
        final popup = PopupDialog(
          Container(width: 200, height: 100, color: Colors.white),
        );

        await tester.pumpWidget(MaterialApp(
          home: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () => popup.show(context),
                child: const Text('Open Dialog'),
              );
            },
          ),
        ));

        await tester.tap(find.text('Open Dialog'));
        await tester.pumpAndSettle();

        expect(find.byType(Container), findsOneWidget);
      });
    });
