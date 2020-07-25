import 'package:colectoraapp/Model/productoModel.dart';
import 'package:colectoraapp/screens/ProductoItem.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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



Future<ProductoModel> fetchPost(String codBarra) async {
  final response =
  await http.get('http://192.168.0.247:9590/articulo/codbarra/${codBarra}');

  if (response.statusCode == 200) {
    // Si la llamada al servidor fue exitosa, analiza el JSON
    productos.add(ProductoModel(id: 1,nombre: "mayonesa",codigoBarra:codBarra));

  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to load post');
  }
  textEditingController.clear();
}


  void onChange(String val){

    if(val.length == 13){
      setState(() {
        codigoBarra = val ;
        fetchPost(codigoBarra);
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
                autofocus: true,
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