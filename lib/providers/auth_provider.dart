import 'package:admin_dasboard/router/router.dart';
import 'package:admin_dasboard/services/local_storage.dart';
import 'package:admin_dasboard/services/navigation_service.dart';
import 'package:flutter/material.dart';

enum AuthStatus {
  checking,
  authenticated,
  notAuthenticated
}

class AuthProvider extends ChangeNotifier {

  String? _token;
  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider() {
    isAuthenticated();
  }

  login(String email, String password) {

    _token = 'hkjshkh4hh4w8yu98hfknbkjub.eouio3o390ija@#SDTR%%43f';
    LocalStorage.prefs.setString('token', _token!);

    authStatus = AuthStatus.authenticated;
    notifyListeners();
    NavigationService.replaceTo(Flurorouter.dashboardRoute);
    //isAuthenticated();
  }

  Future<bool> isAuthenticated() async{
    if(LocalStorage.prefs.getString('token') == null ) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    await Future.delayed(const Duration(microseconds: 1000));

    authStatus = AuthStatus.authenticated;
    notifyListeners();

    return true;
  }
}