import 'package:barv/src/presentation/themes/themes.dart';
import 'package:flutter/material.dart';

class BarvSnackBar extends SnackBar {
  const BarvSnackBar._({
    super.key,
    required this.text,
    required this.color,
    required super.content,
  }) : super(
          behavior: SnackBarBehavior.floating,
          backgroundColor: color,
        );

  /// Text to display in snackbar.
  final String text;

  /// background color of snackbar.
  final Color color;

  static void showSuccess(
    BuildContext context, {
    required String text,
    Widget? icon,
  }) {
    final snackBar = BarvSnackBar._(
      text: text,
      color: BarvColor.chloro,
      content: Row(
        children: [
          if (icon != null) icon,
          if (icon != null) const SizedBox(width: 14),
          Expanded(
            child: Text(
              text,
              style: BarvTypography.caption(color: BarvColor.albin),
            ),
          ),
        ],
      ),
    );

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void showFailed(BuildContext context, {String? text, Widget? icon}) {
    final errorText = text ??
        'An Error has been occured, please contact our support center (code: 9000})';

    final snackBar = BarvSnackBar._(
      text: errorText,
      color: BarvColor.hemoglobin,
      content: Row(
        children: [
          if (icon != null) icon,
          if (icon != null) const SizedBox(width: 14),
          Expanded(
            child: Text(
              errorText,
              style: BarvTypography.caption(color: BarvColor.albin),
            ),
          ),
        ],
      ),
    );

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void basic(
    BuildContext context, {
    required String text,
    Widget? icon,
  }) {
    final snackBar = BarvSnackBar._(
      text: text,
      color: const Color(0xCD434343),
      content: Row(
        children: [
          if (icon != null) icon,
          if (icon != null) const SizedBox(width: 14),
          Expanded(
            child: Text(
              text,
              style: BarvTypography.caption(color: BarvColor.albin),
            ),
          ),
        ],
      ),
    );

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
