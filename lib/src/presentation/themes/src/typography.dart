import 'package:barv/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BarvTypography extends TextStyle {
  const BarvTypography._({
    Color? color,
    required String typeface,
    required FontWeight fontWeight,
    required double fontSize,
    required double letterSpacing,
    double? lineHeight,
  }) : super(
    color: color,
    fontFamily: typeface,
    fontWeight: fontWeight,
    fontSize: fontSize,
    letterSpacing: letterSpacing,
    height: lineHeight,
  );

  factory BarvTypography.header({Color? color}) =>
      BarvTypography._(
        color: color,
        typeface: FontFamily.roboto,
        fontWeight: FontWeight.w900,
        fontSize: 37.sp,
        letterSpacing: 0.25,
      );

  factory BarvTypography.title({Color? color}) =>
      BarvTypography._(
        color: color,
        typeface: FontFamily.roboto,
        fontWeight: FontWeight.w700,
        fontSize: 20.sp,
        letterSpacing: 0.15,
        lineHeight: 1.1,
      );

  factory BarvTypography.text({
    Color? color,
    BarvFontWeight fontWeight = BarvFontWeight.regular,
  }) =>
      BarvTypography._(
        color: color,
        typeface: FontFamily.roboto,
        fontWeight: _fontWeight(fontWeight),
        fontSize: 17.sp,
        letterSpacing: 0.15,
      );

  factory BarvTypography.paragraph({
    Color? color,
    BarvFontWeight fontWeight = BarvFontWeight.regular,
  }) =>
      BarvTypography._(
        color: color,
        typeface: FontFamily.roboto,
        fontWeight: _fontWeight(fontWeight),
        fontSize: 17.sp,
        letterSpacing: 0.15,
        lineHeight: 1.5,
      );

  factory BarvTypography.caption({
    Color? color,
    BarvFontWeight fontWeight = BarvFontWeight.regular,
  }) =>
      BarvTypography._(
        color: color,
        typeface: FontFamily.roboto,
        fontWeight: _fontWeight(fontWeight),
        fontSize: 15.sp,
        letterSpacing: 0.1,
      );

  factory BarvTypography.small({
    Color? color,
    BarvFontWeight fontWeight = BarvFontWeight.regular,
  }) =>
      BarvTypography._(
        color: color,
        typeface: FontFamily.roboto,
        fontWeight: _fontWeight(fontWeight),
        fontSize: 13.sp,
        letterSpacing: 0.1,
      );
}

FontWeight _fontWeight(BarvFontWeight type) {
  switch (type) {
    case BarvFontWeight.bold:
      return FontWeight.w700;
    case BarvFontWeight.semiBold:
      return FontWeight.w600;
    case BarvFontWeight.regular:
      return FontWeight.w400;
  }
}

enum BarvFontWeight {
  bold,
  regular,
  semiBold,
}
