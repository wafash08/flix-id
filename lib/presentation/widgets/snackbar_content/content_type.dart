import "package:flutter/material.dart";

import "default_colors.dart";

/// to handle failure, success, help and warning `ContentType` class is being used
class ContentType {
  const ContentType(this.message, [this.color]);

  /// message is `required` parameter
  final String message;

  /// color is optional, if provided null then `DefaultColors` will be used
  final Color? color;

  static const ContentType help = ContentType("help", DefaultColors.helpBlue);
  static const ContentType failure = ContentType(
    "failure",
    DefaultColors.failureRed,
  );
  static const ContentType success = ContentType(
    "success",
    DefaultColors.successGreen,
  );
  static const ContentType warning = ContentType(
    "warning",
    DefaultColors.warningYellow,
  );
}
