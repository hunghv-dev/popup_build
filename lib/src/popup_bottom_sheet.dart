import 'package:flutter/material.dart';
import 'popup.dart';

/// A bottom sheet popup that extends the `Popup` class.
class PopupBottomSheet extends Popup {
  /// Top margin of the bottom sheet.
  final double marginTop;

  /// Determines if the bottom sheet should be fully expanded.
  final bool isExpanded;

  /// Determines if the bottom sheet can be dismissed by tapping outside.
  final bool isDismissible;

  /// Constructor for `PopupBottomSheet`.
  ///
  /// - `marginTop`: Space between the top of the screen and the bottom sheet.
  /// - `isExpanded`: Whether the content takes up the full height.
  /// - `isDismissible`: Whether tapping outside dismisses the sheet.
  PopupBottomSheet(
    super.builder, {
    super.key,
    super.backgroundColor,
    super.borderRadius,
    super.isHorizontalButton,
    this.marginTop = 0.0,
    this.isExpanded = false,
    this.isDismissible = true,
  });

  /// Displays the bottom sheet popup.
  @override
  Future show(BuildContext context) => showModalBottomSheet(
        context: context,
        elevation: 0.0,
        isScrollControlled: true,
        constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height -
                MediaQuery.of(Navigator.of(context).context).padding.top -
                marginTop),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        isDismissible: isDismissible,
        builder: (context) => Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SafeArea(
            child: Padding(
              padding: tryPadding ?? EdgeInsets.zero,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  tryResource ?? const SizedBox.shrink(),
                  Flexible(
                    fit: isExpanded ? FlexFit.tight : FlexFit.loose,
                    child: Padding(
                      padding: tryContentPadding ?? EdgeInsets.zero,
                      child: this,
                    ),
                  ),
                  buttons ?? const SizedBox.shrink(),
                ],
              ),
            ),
          ),
        ),
      );
}
