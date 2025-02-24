import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:popup_build/src/popup.dart';

class _TestPopup extends Popup {
  _TestPopup(super.builder);

  @override
  Future show(BuildContext context) => Future.value();
}

void main() {
  group('Popup', () {
    test('should return the builder widget when build is called', () {
      final popup = _TestPopup(const Text('Content'));
      expect(popup.builder, isA<Text>());
    });

    test('should set padding when spacing is called', () {
      final popup = _TestPopup(const Text('Content'));
      popup.spacing(padding: const EdgeInsets.all(10.0));
      expect(popup.tryPadding, equals(const EdgeInsets.all(10.0)));
    });

    test('should set icon when icon is called', () {
      final popup = _TestPopup(const Text('Content'));
      popup.icon('assets/icon.svg');
      expect(popup.tryResource, isA<SvgPicture>());
    });

    test('should set start button when button is called', () {
      final popup = _TestPopup(const Text('Content'));
      popup.button(const Text('Start'));
      popup.button(const Text('End'));
      expect(popup.tryStart, isA<Text>());
      expect(popup.tryEnd, isA<Text>());
    });

    testWidgets('Popup can be created through a subclass',
        (WidgetTester tester) async {
      final popup = _TestPopup(const Text('Popup Content'));

      expect(popup.backgroundColor, isNull);
      expect(popup.borderRadius, isA<BorderRadius>());
      expect(popup.isHorizontalButton, isTrue);
    });

    testWidgets('Popup builds provided content', (WidgetTester tester) async {
      final popup = _TestPopup(const Text('Popup Content'));

      await tester.pumpWidget(MaterialApp(home: popup));

      expect(find.text('Popup Content'), findsOneWidget);
    });
  });
}
