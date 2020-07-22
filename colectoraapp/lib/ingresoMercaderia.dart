import 'package:flutter/material.dart';


class IngresoMercaderia extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: new Container(
          padding: const EdgeInsets.all(25.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
            TextField(
                decoration: new InputDecoration(labelText: "Codigo de Barra"),
                keyboardType: TextInputType.number,

              ),
            ],
          )),
      appBar: AppBar(

        title: Text("Ingreso de Mercadería"),
        centerTitle: true,

      ),


    );
  }


}