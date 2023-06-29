import 'package:craft_dynamic/craft_dynamic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:h_f_b/screens/auth/activationScreen.dart';
import 'package:h_f_b/screens/auth/loginScreen.dart';
import 'package:h_f_b/screens/auth/splashScreen.dart';
import 'package:h_f_b/utils/theme/AppTheme.dart';



final _auth = AuthRepository();
final _home = HomeRepository();
final _pref = CommonSharedPref();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await _pref.addActivationData("254741445461", "4970441960");
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  String isActivated = await _pref.getAppIsActivated() ?? "false";
  runApp(
      DynamicCraftWrapper(
        dashboard:
        isActivated == "true" ? const LoginScreen() : ActivationScreen(),
        appLoadingScreen: const SplashScreen(),
        appTimeoutScreen: const LoginScreen(),
        appInactivityScreen: const LoginScreen(),
        appTheme: AppTheme().appTheme,
        menuProperties: MenuProperties(iconSize: 35,backgroundColor: Colors.transparent),
        menuScreenProperties: MenuScreenProperties(childAspectRatio: .8),
      ));
}

extension test on APIService{
  void testExtension()async {
    var reqBody = await dioRequestBodySetUp("ACTIVA");
    var res = performDioRequest(reqBody);
  }
}


