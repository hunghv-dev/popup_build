import 'package:flutter/widgets.dart';

/// Mixin for handling popup button components.
mixin PopupButton {
  /// Widgets for the start and end buttons.
  late final Widget start;
  late final Widget end;

  /// Safely retrieves the `start` widget if initialized, otherwise returns `null`.
  Widget? get tryStart {
    try {
      return start;
    } catch (_) {
      return null;
    }
  }

  /// Safely retrieves the `end` widget if initialized, otherwise returns `null`.
  Widget? get tryEnd {
    try {
      return end;
    } catch (_) {
      return null;
    }
  }
}
