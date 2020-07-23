import 'package:flutter/material.dart';


class IngresoMercaderia extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _IngresoMercaderia();
  }

}


class _IngresoMercaderia extends State<IngresoMercaderia>{
  String codigoBarra = "";


  void onChange(String val){
      setState(() {
        codigoBarra = codigoBarra + val +"\n";
      });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
         title: Text("Ingreso de Mercaderia"),
    ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: new InputDecoration(labelText: "Codigo de Barra"),
              keyboardType: TextInputType.number,
              onChanged: onChange,
            ),
            Text(codigoBarra)
          ],
        ),

      ),

    );
  }


}