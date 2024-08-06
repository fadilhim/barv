import 'package:barv/barv.dart';
import 'package:flutter/material.dart';

class BarvImage extends StatelessWidget {
  const BarvImage(
    this.url, {
    super.key,
    required this.height,
    required this.width,
    this.fit,
    this.errorImagePath,
  });

  final String url;
  final double height;
  final double width;
  final BoxFit? fit;
  final String? errorImagePath;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      height: height,
      width: width,
      fit: fit,
      loadingBuilder: (
        context,
        child,
        loadingProgress,
      ) {
        if (loadingProgress == null) return child;
        return BarvShimmerLoading(
          width: width,
          height: height,
        );
      },
      errorBuilder: (context, exception, stackTrace) {
        if (errorImagePath == null) {
          return const SizedBox.shrink();
        }
        return Image.asset(
          errorImagePath!,
          fit: BoxFit.cover,
          height: height,
          width: double.infinity,
        );
      },
    );
  }
}
