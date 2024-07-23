// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$BarvRouter extends RootStackRouter {
  // ignore: unused_element
  _$BarvRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    SuccessRouter.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SuccessPage(),
      );
    }
  };
}

/// generated route for
/// [SuccessPage]
class SuccessRouter extends PageRouteInfo<void> {
  const SuccessRouter({List<PageRouteInfo>? children})
      : super(
          SuccessRouter.name,
          initialChildren: children,
        );

  static const String name = 'SuccessRouter';

  static const PageInfo<void> page = PageInfo<void>(name);
}
