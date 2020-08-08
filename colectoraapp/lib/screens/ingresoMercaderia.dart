import 'dart:convert';

import 'package:colectoraapp/Model/producto.dart';
import 'package:colectoraapp/Providers/ApiManager.dart';
import 'package:colectoraapp/Widget/ListaDrawer.dart';
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
  Future <Producto> productos ;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  List <Producto> listaProductos = new List<Producto>();
  final TextEditingController textEditingController = new TextEditingController();
  final api = ApiManager();

  Future<Producto> fetchProducto(String codBarra) async {
      return await api.getProducto(codBarra);
  }

  Future<int> fetchGuardarIngreso() async {
    return await api.postIngreso(listaProductos);
  }
  void onChange(String val){
    if(val.length == 13){
      setState(() {
        codigoBarra = val ;
        productos = fetchProducto(codigoBarra);
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
      ),drawer: Drawer(
        child: ListaDrawer(),
    ),
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
                child: FutureBuilder<Producto>(
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
                            key: _listKey,
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
                  onPressed: () {
                    if(listaProductos.length> 0){
                      fetchGuardarIngreso().then((estadoServer) => {
                        if(estadoServer == 200){
                          _showDialog("El ingreso de Mercadería se ha guardado con exito")
                        }else{
                          _showDialog("Ha ocurrido un error al guardar",true)
                        }
                      });
                    }else{
                      _showDialog("No existen productos para guardar");
                    }

                  },
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

   _showDialog(String texto,[bool error])  {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(texto),
          actions: <Widget>[
            FlatButton(
              child: Text('Aceptar'),
              onPressed: () {
                if(error == null){
                  setState(() {
                    productos = null;
                    this.listaProductos.clear();
                  });
                }
              Navigator.of(context).pop();

              },
            ),
          ],
        );
      },
    );
  }
}