import 'package:admin_dasboard/providers/auth_provider.dart';
import 'package:admin_dasboard/providers/sidemenu_provider.dart';
import 'package:admin_dasboard/router/router.dart';
import 'package:admin_dasboard/ui/views/blank_view.dart';
import 'package:admin_dasboard/ui/views/dashboard_view.dart';
import 'package:admin_dasboard/ui/views/icons_view.dart';
import 'package:admin_dasboard/ui/views/login_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class DashboardHandlers {
  
  static Handler dashboard = Handler(
    handlerFunc: (context, params) {

      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SidemenuProvider>(context, listen: false).setCurrentPageUrl(Flurorouter.dashboardRoute); 

      if (authProvider.authStatus == AuthStatus.authenticated) return const DashboardView();

    
      return const LoginView();
    },
  );

  static Handler icons = Handler(
    handlerFunc: (context, params) {

      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SidemenuProvider>(context, listen: false).setCurrentPageUrl(Flurorouter.iconsRoute);

      if (authProvider.authStatus == AuthStatus.authenticated) return const IconsView();

    
      return const LoginView();
    },
  );

  static Handler blank = Handler(
    handlerFunc: (context, params) {

      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SidemenuProvider>(context, listen: false).setCurrentPageUrl(Flurorouter.blankPageRoute);

      if (authProvider.authStatus == AuthStatus.authenticated) return const BlankView();

    
      return const LoginView();
    },
  );
}