import 'package:flutter/widgets.dart';

/// Mixin for managing spacing and padding in a popup.
mixin PopupSpacing {
  /// Padding around the popup.
  late final EdgeInsets? padding;

  /// Padding for the content inside the popup.
  late final EdgeInsets? contentPadding;

  /// Spacing between buttons inside the popup.
  late final double? buttonSpacing;

  /// Safely retrieves `padding`, returning `null` if uninitialized.
  EdgeInsets? get tryPadding {
    try {
      return padding;
    } catch (_) {
      return null;
    }
  }

  /// Safely retrieves `contentPadding`, returning `null` if uninitialized.
  EdgeInsets? get tryContentPadding {
    try {
      return contentPadding;
    } catch (_) {
      return null;
    }
  }

  /// Safely retrieves `buttonSpacing`, returning `null` if uninitialized.
  double? get tryButtonSpacing {
    try {
      return buttonSpacing;
    } catch (_) {
      return null;
    }
  }
}
