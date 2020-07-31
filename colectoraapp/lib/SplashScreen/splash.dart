import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import '../pages/login_page.dart';
class Splash extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _splash();
  }
}

class _splash extends State<Splash>{
  @override
  void initState() {
    super.initState();
    correrTimer();
  }
   correrTimer ()async{
    var duracion = Duration(seconds: 4);
    return Timer(duracion,route);
  }

  route() async {
//      SharedPreferences prefs = await SharedPreferences.getInstance();
//      bool CheckValue = prefs.containsKey('autenticacion');
        Navigator.of(context).pushReplacementNamed('login');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image.asset('assets/logo_splash.png',width: 120),
                  margin: EdgeInsets.all(20),
              ),
              Padding(
                padding:EdgeInsets.only(bottom: 30),
              ),
              CircularProgressIndicator(
                strokeWidth: 2,
              )
            ],
          ),
        ),
      );
  }
}