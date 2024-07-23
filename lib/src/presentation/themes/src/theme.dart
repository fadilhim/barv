import 'package:barv/src/presentation/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BarvTheme {
  const BarvTheme._();

  static ThemeData lightTheme() => ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: BarvColor.albin,
          onPrimary: BarvColor.tosca,
          secondary: BarvColor.aqua,
          onSecondary: BarvColor.albin,
          error: BarvColor.hemoglobin,
          onError: BarvColor.albin,
          surface: Colors.transparent,
          onSurface: BarvColor.analgesic,
        ),
        brightness: Brightness.light,
        scaffoldBackgroundColor: BarvColor.albin,
        primaryColor: BarvColor.tosca,
        unselectedWidgetColor: BarvColor.iron,
        disabledColor: BarvColor.iron,
        dialogBackgroundColor: BarvColor.albin,
        appBarTheme: AppBarTheme(
          backgroundColor: BarvColor.tosca,
          foregroundColor: BarvColor.albin,
          elevation: 0.5,
          centerTitle: true,
          toolbarHeight: 56.h,
          titleTextStyle: BarvTypography.title(
            color: BarvColor.analgesic,
          ),
        ),
        cardTheme: const CardTheme(
          color: BarvColor.albin,
          elevation: 2,
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
            TargetPlatform.fuchsia: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
          },
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          elevation: 20,
          enableFeedback: true,
          backgroundColor: BarvColor.albin,
          selectedItemColor: BarvColor.tosca,
          unselectedItemColor: BarvColor.analgesic,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
        ),
        canvasColor: BarvColor.albin,
        dividerTheme: const DividerThemeData(
          color: BarvColor.iron,
          thickness: 0.5,
        ),
      );

  static ThemeData darkTheme() => ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: BarvColor.hydro,
      onPrimary: BarvColor.albin,
      secondary: BarvColor.aqua,
      onSecondary: BarvColor.albin,
      error: BarvColor.hemoglobin,
      onError: BarvColor.albin,
      surface: Colors.transparent,
      onSurface: BarvColor.analgesic,
    ),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: BarvColor.albin,
    primaryColor: BarvColor.hydro,
    unselectedWidgetColor: BarvColor.iron,
    disabledColor: BarvColor.iron,
    dialogBackgroundColor: BarvColor.albin,
    appBarTheme: AppBarTheme(
      backgroundColor: BarvColor.tosca,
      foregroundColor: BarvColor.analgesic,
      elevation: 0.5,
      centerTitle: true,
      toolbarHeight: 56.h,
      titleTextStyle: BarvTypography.title(
        color: BarvColor.analgesic,
      ),
    ),
    cardTheme: const CardTheme(
      color: BarvColor.albin,
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.fuchsia: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
      },
    ),
    dividerTheme: const DividerThemeData(
      color: BarvColor.iron,
      thickness: 0.5,
    ),
  );
}
