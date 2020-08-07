import 'package:colectoraapp/Model/producto.dart';
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
      return <Producto>[
        Producto(id: 1, nombre: "facundo"),
        Producto(id: 2, nombre: "facundo"),
        Producto(id: 3, nombre: "facundo"),
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