import 'package:admin_dasboard/providers/auth_provider.dart';
import 'package:admin_dasboard/providers/sidemenu_provider.dart';
import 'package:admin_dasboard/router/router.dart';
import 'package:admin_dasboard/services/local_storage.dart';
import 'package:admin_dasboard/services/navigation_service.dart';
import 'package:admin_dasboard/ui/layouts/auth/auth_layout.dart';
import 'package:admin_dasboard/ui/layouts/dashboard/dashboard_layout.dart';
import 'package:admin_dasboard/ui/layouts/splash/splash_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async { 
  await LocalStorage.configurePrefs();
  Flurorouter.configureRoutes();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => AuthProvider()
        ),
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => SidemenuProvider()
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Dashboard',
      initialRoute: '/',
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: NavigationService.navigatorKey,
      builder: (_, child) {

        final authProvider = Provider.of<AuthProvider>(context);

        if(authProvider.authStatus == AuthStatus.checking) return const SplashLayout();

        if(authProvider.authStatus == AuthStatus.authenticated) {
          return DashboardLayout(child: child!);
        } else {
          return AuthLayout(child: child!);
        }
      }, //AuthLayout( child: child!),
      theme: ThemeData.light().copyWith(
        scrollbarTheme: const ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.5)
        )
      )),
    );
  }
}