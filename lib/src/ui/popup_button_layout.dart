import 'package:flutter/widgets.dart';

/// Mixin to manage the layout of popup buttons.
mixin PopupButtonLayout {
  /// Returns a single widget occupying full width if either `start` or `end` exists.
  Widget? _single(Widget? start, Widget? end) => start != null || end != null
      ? SizedBox(width: double.infinity, child: start ?? end)
      : null;

  /// Creates a layout for the popup buttons.
  ///
  /// - `start`: The widget on the left (or top if vertical).
  /// - `spacing`: The space between `start` and `end`.
  /// - `end`: The widget on the right (or bottom if vertical).
  /// - `isHorizontal`: Determines if the layout is horizontal or vertical.
  Widget? layout({
    Widget? start,
    double? spacing,
    Widget? end,
    required bool isHorizontal,
  }) =>
      start != null && end != null
          ? isHorizontal
              ? Row(children: [
                  Expanded(child: start),
                  SizedBox(width: spacing),
                  Expanded(child: end),
                ])
              : Column(children: [
                  SizedBox(width: double.infinity, child: start),
                  SizedBox(height: spacing),
                  SizedBox(width: double.infinity, child: end),
                ])
          : _single(start, end);
}
