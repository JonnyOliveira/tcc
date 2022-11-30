import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:projeto_app/routers/routers.dart';

void main() async {
  runApp(GetMaterialApp(
    localizationsDelegates: const [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: const [
      Locale('pt'),
    ],
    locale: const Locale('pt'),
    theme: ThemeData(primaryColor: Colors.white),
    debugShowCheckedModeBanner: false,
    getPages: [
      ...HomeRouters.routers,
    ],
    initialRoute: '/login',
  ));
}
