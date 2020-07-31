import 'package:colectoraapp/Widget/ListaDrawer.dart';

import 'package:flutter/material.dart';


class RetiroMercaderia extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Retiro_Mercaderia();
  }
}

class _Retiro_Mercaderia extends State<RetiroMercaderia>{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:
      AppBar(
        title: Text("Retiro de Mercaderia"),
      ),drawer: Drawer(
      child: ListaDrawer(),
    )

    );
  }


}