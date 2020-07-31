import 'package:colectoraapp/retiroMercaderia.dart';
import 'package:colectoraapp/screens/ingresoMercaderia.dart';
import 'package:colectoraapp/SplashScreen/splash.dart';
import 'package:colectoraapp/screens/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Colectora App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash',
      routes: {
    'splash'  : (BuildContext context) => Splash(),
    'login' : (BuildContext context) => Login(),
    'ingresoMercaderia'  : (BuildContext context) => IngresoMercaderia(),
    'retiroMercaderia'  : (BuildContext context) => RetiroMercaderia(),

    },

    );
  }
}

