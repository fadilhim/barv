import 'dart:ui';

import 'package:barv/barv.dart';
import 'package:barv/src/presentation/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

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

class BarvShimmerLoading extends StatelessWidget {
  const BarvShimmerLoading({
    super.key,
    required this.width,
    required this.height,
    this.boxDecoration,
  });

  const BarvShimmerLoading.circular({
    super.key,
    this.width = double.infinity,
    required this.height,
  }) : boxDecoration = const ShapeDecoration(
    color: BarvColor.calcium,
    shape: CircleBorder(),
  );

  final double width;
  final double height;
  final Decoration? boxDecoration;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: BarvColor.calcium,
      highlightColor: BarvColor.albin,
      enabled: true,
      child: Container(
        width: width,
        height: height,
        decoration: boxDecoration ??
            BoxDecoration(
              color: BarvColor.calcium,
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ).r,
            ),
      ),
    );
  }
}
