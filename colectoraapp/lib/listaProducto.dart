import 'package:colectoraapp/Model/productoModel.dart';
import 'package:colectoraapp/screens/ProductoItem.dart';
import 'package:flutter/material.dart';


class ListaProducto extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
  return _ListaProducto();
  }

}

class _ListaProducto extends State<ListaProducto>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    mostrarLista() {
      return <ProductoModel>[
        ProductoModel(id: 1, nombre: "facundo"),
        ProductoModel(id: 2, nombre: "facundo"),
        ProductoModel(id: 3, nombre: "facundo"),
      ];
    }

   lista() {
     return ListView(
       children: <Widget>[
         ListTile(title: Text("prueba"),),
         ListTile(title: Text("prueba"),),
         ListTile(title: Text("prueba"),),
       ],
     );
   }

  }


}