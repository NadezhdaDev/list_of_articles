import 'package:flutter/material.dart';

import '../../presentation/attributes/config/app_parameters.dart';
import '../../presentation/attributes/la_app_config.dart';
import '../../presentation/navigation/la_route_path.dart';
import '../../presentation/navigation/la_router.dart';

class EntryPoints {
  static late LAAppConfig projectAppConfig;

  static Future<void> main(LAAppConfig appConfig) async {
    projectAppConfig = appConfig;
    WidgetsFlutterBinding.ensureInitialized();

    return runApp(MaterialApp(
      navigatorKey: globalKey,
      initialRoute: LARoutePath.authScreen,
      onGenerateRoute: (routeSettings) => LARouter.getAppRouteFactory(
        routeSettings,
      ),
      onGenerateInitialRoutes: (initialRoute) => [
        LARouter.getAppRouteFactory(
          RouteSettings(
            name: initialRoute,
          ),
        ),
      ],
    ));
  }
}
