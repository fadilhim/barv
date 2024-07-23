import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:barv/src/presentation/themes/themes.dart';
import 'package:barv/src/presentation/widget/widgets.dart';
import 'package:flutter/material.dart';

class BarvSimpleDialog extends StatefulWidget {
  final String title;
  final String message;
  final String confirmText;
  final VoidCallback? onConfirm;
  final Widget? image;

  final List<DialogNoteContent>? notes;

  const BarvSimpleDialog._({
    required this.title,
    required this.message,
    required this.confirmText,
    this.onConfirm,
    this.image,
    this.notes,
  });

  static void showDialog(
    BuildContext context, {
    required String title,
    required String message,
    String confirmText = 'Ok, Barvt it',
    VoidCallback? onConfirm,
    Widget? image,
    List<DialogNoteContent>? notes,
  }) {
    showModal<void>(
      context: context,
      configuration:
          const FadeScaleTransitionConfiguration(barrierDismissible: false),
      builder: (context) => BarvSimpleDialog._(
        title: title,
        message: message,
        onConfirm: onConfirm,
        image: image,
        confirmText: confirmText,
        notes: notes,
      ),
    );
  }

  @override
  State<BarvSimpleDialog> createState() => _BarvSimpleDialogState();
}

class _BarvSimpleDialogState extends State<BarvSimpleDialog> {
  @override
  Widget build(BuildContext context) {
    final isLightMode = Theme.of(context).brightness == Brightness.light;

    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 350.0,
        ),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color:
              isLightMode ? BarvColor.albin : BarvColor.analgesic.withOpacity(0.85),
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (widget.image != null) const SizedBox(height: 16.0),
            if (widget.image != null) widget.image!,
            if (widget.image != null) const SizedBox(height: 30.0),
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: BarvTypography.title(
                color: isLightMode ? BarvColor.analgesic : BarvColor.albin,
              ),
            ),
            const SizedBox(height: 12.0),
            Text(
              widget.message,
              textAlign: TextAlign.center,
              style: BarvTypography.caption(
                color: isLightMode ? BarvColor.analgesic : BarvColor.albin,
              ),
            ),
            if (widget.notes != null && widget.notes!.isNotEmpty)
              const SizedBox(height: 12.0),
            if (widget.notes != null && widget.notes!.isNotEmpty)
              _BuildNoteContainer(notes: widget.notes!),
            const SizedBox(height: 24.0),
            BarvButton(
              padding: 12,
              height: 38,
              textStyle: BarvTypography.text(
                  fontWeight: BarvFontWeight.bold, color: BarvColor.albin),
              text: widget.confirmText,
              onPressed: () {
                widget.onConfirm?.call();
                AutoRouter.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DialogNoteContent {
  final String title;
  final String message;

  DialogNoteContent({required this.title, required this.message});
}

class _BuildNoteContainer extends StatelessWidget {
  final List<DialogNoteContent> notes;

  const _BuildNoteContainer({Key? key, required this.notes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLightMode = Theme.of(context).brightness == Brightness.light;

    final children = <Widget>[];

    for (final content in notes) {
      children.addAll([
        Text(
          content.title,
          style: BarvTypography.caption(
            color: isLightMode ? BarvColor.analgesic : BarvColor.albin,
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          content.message,
          style: BarvTypography.caption(
            color: isLightMode ? BarvColor.anaesthesia : BarvColor.iron,
          ),
        ),
        const SizedBox(height: 8.0),
      ]);
    }

    return Container(
      decoration: BoxDecoration(
        color: BarvColor.hemoglobin.withOpacity(isLightMode ? 0.1 : 0.2),
        shape: BoxShape.rectangle,
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }
}
