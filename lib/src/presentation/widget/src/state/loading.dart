import 'dart:ui';

import 'package:barv/src/presentation/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BarvLoadingWidget extends StatefulWidget {
  const BarvLoadingWidget({
    super.key,
    this.isBlur = true,
    this.text,
    this.size,
  });

  final bool isBlur;
  final String? text;
  final double? size;

  @override
  State<BarvLoadingWidget> createState() => _BarvLoadingWidgetState();
}

class _BarvLoadingWidgetState extends State<BarvLoadingWidget> {
  @override
  Widget build(BuildContext context) {
    final child = Center(
      child: SizedBox(
        width: widget.size?.sp ?? 100.sp,
        height: widget.size?.sp ?? 100.sp,
        child: const CircularProgressIndicator(
          color: BarvColor.hydro,
        ),
      ),
    );

    if (widget.isBlur) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
        child: child,
      );
    } else {
      return child;
    }
  }
}
