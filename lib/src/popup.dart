import 'package:flutter/material.dart';
import 'ui/popup_button.dart';
import 'ui/popup_button_layout.dart';
import 'ui/popup_icon.dart';
import 'ui/popup_spacing.dart';

/// An abstract class for creating customizable popups.
///
/// This base class is designed to be extended by specific popup types
/// like dialogs and bottom sheets.
abstract class Popup extends StatelessWidget
    with PopupSpacing, PopupIcon, PopupButton, PopupButtonLayout {
  /// The widget that builds the main content of the popup.
  final Widget builder;

  /// Background color of the popup.
  final Color? backgroundColor;

  /// Border radius of the popup container.
  final BorderRadius borderRadius;

  /// Determines if buttons should be arranged horizontally.
  final bool isHorizontalButton;

  /// Constructor for `Popup`.
  Popup(
    this.builder, {
    super.key,
    this.backgroundColor,
    this.borderRadius = const BorderRadius.all(Radius.circular(4.0)),
    this.isHorizontalButton = true,
  });

  /// Sets spacing properties for the popup.
  ///
  /// - `padding`: Outer padding of the popup.
  /// - `contentPadding`: Padding for the inner content.
  /// - `buttonSpacing`: Spacing between action buttons.
  Popup spacing({
    EdgeInsets? padding,
    EdgeInsets? contentPadding,
    double? buttonSpacing,
  }) {
    if (tryPadding == null) this.padding = padding;
    if (tryContentPadding == null) this.contentPadding = contentPadding;
    if (tryButtonSpacing == null) this.buttonSpacing = buttonSpacing;
    return this;
  }

  /// Sets the icon for the popup.
  ///
  /// - `icon`: Can be an asset path or a widget.
  Popup icon(icon) {
    if (tryResource == null) resource = icon;
    return this;
  }

  /// Adds a button to the popup.
  ///
  /// - `button`: The button widget to be added.
  /// If `start` is empty, the button is assigned to `start`,
  /// otherwise, it is assigned to `end`.
  Popup button(Widget button) {
    tryStart == null
        ? start = button
        : tryEnd == null
            ? end = button
            : null;
    return this;
  }

  /// Retrieves the button layout, arranged based on `isHorizontalButton`.
  Widget? get buttons => layout(
        start: tryStart,
        spacing: tryButtonSpacing,
        end: tryEnd,
        isHorizontal: isHorizontalButton,
      );

  /// Abstract method to show the popup.
  Future show(BuildContext context);

  /// Builds the popup UI.
  @override
  Widget build(BuildContext context) => builder;
}
