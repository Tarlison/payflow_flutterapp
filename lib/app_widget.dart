import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payflow_flutterapp/modules/barcode_scanner/barcode_scanner_page.dart';
import 'package:payflow_flutterapp/modules/home/home_page.dart';
import 'package:payflow_flutterapp/modules/insert_boleto/insert_boleto_page.dart';
import 'package:payflow_flutterapp/modules/login/login_page.dart';
import 'package:payflow_flutterapp/modules/splash/splash_page.dart';
import 'shared/themes/app_colors.dart';

class AppWidget extends StatelessWidget {
  AppWidget() {
    //bloquear virada de tela
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pay Flow',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: AppColors.primary,
      ),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashPage(),
        "/home": (context) => HomePage(),
        "/login": (context) => LoginPage(),
        "/barcode_scanner": (context) => BarcodeScannerPage(),
        "/insert_boleto_page": (context) => InsertBoletoPage(),
      },
    );
  }
}
