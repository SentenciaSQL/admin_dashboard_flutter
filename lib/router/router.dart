import 'package:admin_dasboard/router/admin_hadlers.dart';
import 'package:admin_dasboard/router/dashboard_handler.dart';
import 'package:admin_dasboard/router/page_not_found_handlers.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {

  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';

  // Auth Router
  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';

  //Dashboard
  static String dashboardRoute = '/dashboard';
  static String iconsRoute = '/icons';
  static String blankPageRoute = '/blank_page';

  static void configureRoutes() {
    // Root Route
    router.define(rootRoute, handler: AdminHandlers.login, transitionType: TransitionType.none);
    // Auth Router
    router.define(loginRoute, handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(registerRoute, handler: AdminHandlers.register, transitionType: TransitionType.none);

    //Dashboard
    router.define(dashboardRoute, handler: DashboardHandlers.dashboard, transitionType: TransitionType.fadeIn);
    router.define(iconsRoute, handler: DashboardHandlers.icons, transitionType: TransitionType.fadeIn);
    router.define(blankPageRoute, handler: DashboardHandlers.blank, transitionType: TransitionType.fadeIn);

    // 404
    router.notFoundHandler = PageNotFoundHandlers.notFoundHandler;
  }
}