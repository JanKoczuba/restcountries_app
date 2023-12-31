import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
@injectable
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: SplashRoute.page,
      initial: true,
    ),
    AutoRoute(page: SignInRoute.page),
    AutoRoute(page: CountriesRoute.page),
    AutoRoute(page: CountryDetailsRoute.page),
  ];
}
