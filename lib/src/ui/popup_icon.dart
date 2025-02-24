import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Mixin for handling icons in a popup.
mixin PopupIcon {
  /// The icon resource, which can be a `String` (asset path) or a `Widget`.
  late final dynamic resource;

  /// Safely retrieves the icon resource.
  ///
  /// - If `resource` is a `String`, it assumes an SVG asset.
  /// - If `resource` is a `Widget`, it returns the widget.
  /// - Otherwise, returns an empty box.
  Widget? get tryResource {
    try {
      if (resource is String) return SvgPicture.asset(resource);
      if (resource is Widget) return resource;
      return const SizedBox.shrink();
    } catch (_) {
      return null;
    }
  }
}
