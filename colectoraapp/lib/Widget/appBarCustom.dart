import 'package:flutter/material.dart';

class AppBarCustom extends StatefulWidget{
  @override
  _AppBarCustomState createState() => _AppBarCustomState();

}

class _AppBarCustomState extends State<AppBarCustom>{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  AppBar(
      title: Text("Ingreso de Mercaderia"),
    );
  }
}


