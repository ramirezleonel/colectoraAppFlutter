import 'dart:convert';

import 'package:colectoraapp/Model/productoModel.dart';
import 'package:flutter/cupertino.dart';
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
  Future <ProductoModel> productos ;
  List <ProductoModel> listaProductos = new  List<ProductoModel>();
  final TextEditingController textEditingController = new TextEditingController();

  Future<ProductoModel> fetchProducto(String codBarra) async {
    final response =
    await http.get('http://192.168.0.247:9590/articulo/codbarra/${codBarra}');

    if (response.statusCode == 200 ) {
      // Si la llamada al servidor fue exitosa, analiza el JSON

      return ProductoModel.fromJson(json.decode(response.body));
    } else {
      // Si la llamada no fue exitosa, lanza un error.
      throw Exception('Error no se encontró el producto');
    }
  }

  void onChange(String val){
    if(val.length == 13){
      setState(() {
        codigoBarra = val ;
        productos =  fetchProducto(codigoBarra);
        textEditingController.clear();
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
                child: FutureBuilder<ProductoModel>(
                    future: productos,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData && snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          margin: EdgeInsets.all(20.0),
                          child:Center(child: CircularProgressIndicator())
                        );
                      }
                      if(snapshot.hasData && snapshot.connectionState == ConnectionState.done){
                        bool encontrado = false;
                          listaProductos.forEach((producto){
                            if(producto.codigoBarra == snapshot.data.codigoBarra){
                              encontrado = true;
                              producto.cantidad += 1;
                            }
                          });
                          if(encontrado ==false){
                            listaProductos.add(snapshot.data);
                          }
                      }
                      return Expanded(
                        child: ListView.builder(
                            itemCount: listaProductos.length ,
                            itemBuilder: (context,index){
                              return ListTile(
                                title: Text('${listaProductos[index].nombre}'),
                                subtitle: Text('${listaProductos[index].codigoBarra}'),
                                trailing: Text('${listaProductos[index].cantidad}'),
                                  onTap: () { /* react to the tile being tapped */ }
                              );
                            }
                        ),
                      );
                    }
                )
            ),
            Container(

              child: ButtonTheme(
                minWidth: 300.0,
                child: RaisedButton(
                  onPressed: () {},
                  child: Text("Guardar"),
                  colorBrightness: Brightness.dark,
                ),
              )

            )
          ],
        ),
      ),
    );
  }


}