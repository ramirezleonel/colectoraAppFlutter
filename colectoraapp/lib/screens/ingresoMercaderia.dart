import 'package:colectoraapp/Model/productoModel.dart';
import 'package:colectoraapp/screens/ProductoItem.dart';
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
List<ProductoModel> productos = List<ProductoModel>();
final TextEditingController textEditingController = new TextEditingController();

  void onChange(String val){

    if(val.length == 13){
      setState(() {
        codigoBarra = codigoBarra + val +"\n";
        productos.add(ProductoModel(id: 1,nombre: "mayonesa",codigoBarra:codigoBarra.toString()));
        textEditingController.clear();
        codigoBarra = "";
      });
    }

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:
      AppBar(
         title: Text("Ingreso de Mercaderia"),
    ),drawer: Drawer(),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
            children: <Widget>[
              TextField(
                decoration: new InputDecoration(labelText: "Codigo de Barra"),
                keyboardType: TextInputType.number,
                onChanged: onChange,
                controller: textEditingController,
              ),
              Container(
                child: Expanded(
                 child: ListView.builder(
                   itemCount: productos.length ,
                   itemBuilder: (context,index){
                     return ListTile(
                       title: Text('${productos[index].codigoBarra}'),
                       subtitle: Text('${productos[index].nombre}'),
                     );
                   }
                  ),
                )
              ),
          ],
        ),
      ),
    );
  }


}