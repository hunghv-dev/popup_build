import 'package:flutter/material.dart';
import 'popup.dart';

/// A dialog popup that extends the `Popup` class.
class PopupDialog extends Popup {
  /// Padding around the dialog inside the screen.
  final EdgeInsets? insetPadding;

  /// Constructor for `PopupDialog`.
  ///
  /// - `insetPadding`: Controls the spacing of the dialog from the screen edges.
  PopupDialog(
    super.builder, {
    super.key,
    super.backgroundColor,
    super.borderRadius,
    super.isHorizontalButton,
    this.insetPadding =
        const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
  });

  /// Displays the dialog popup.
  @override
  Future show(BuildContext context) => showGeneralDialog(
        context: context,
        pageBuilder: (_, __, ___) => Dialog(
          elevation: 0.0,
          insetPadding: insetPadding,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          child: Padding(
            padding: tryPadding ?? EdgeInsets.zero,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                tryResource ?? const SizedBox.shrink(),
                Padding(
                  padding: tryContentPadding ?? EdgeInsets.zero,
                  child: this,
                ),
                buttons ?? const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      );
}
