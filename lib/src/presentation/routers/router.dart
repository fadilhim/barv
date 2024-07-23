import 'package:auto_route/auto_route.dart';
import 'package:barv/src/presentation/features/features.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Router')
class BarvRouter extends _$BarvRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      path: '/success',
      page: SuccessRouter.page,
    ),
  ];
}
