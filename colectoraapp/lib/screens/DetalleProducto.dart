import 'package:colectoraapp/Widget/ListaDrawer.dart';
import 'package:flutter/material.dart';

class DetalleProducto extends StatelessWidget {
  final int id;
  final String nombre;
  final String codigoBarra;
  final double precio;
  const DetalleProducto({Key key, this.id, this.nombre,this.codigoBarra,this.precio}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: Text("Detalle del Producto"),
        ),
        body:SingleChildScrollView(
          child:Container(
              padding: EdgeInsets.all(15.0),
              child: Card(
                  child: Center(
                    child:Column(
                      children: <Widget>[
                        SizedBox(height: 25),
                        texto("Producto",25,FontWeight.bold),
                        SizedBox(height: 25),
                        texto("ID",20,FontWeight.bold),
                        SizedBox(height: 10),
                        texto("${this.id}",18,FontWeight.normal),
                        SizedBox(height: 25),
                        texto("Nombre",20,FontWeight.bold),
                        SizedBox(height: 10),
                        texto("${this.nombre}",18,FontWeight.normal),
                        SizedBox(height: 25),
                        texto("Codigo de Barra",20,FontWeight.bold),
                        SizedBox(height: 10),
                        texto("${this.codigoBarra}",18,FontWeight.normal),
                        SizedBox(height: 25),
                        texto("Precio",20,FontWeight.bold),
                        SizedBox(height: 10),
                        texto("${this.precio}",20,FontWeight.bold),
                        SizedBox(height: 40),


                      ],
                    ),
                  )

              )
          )

        )

    );
  }

  Widget texto(String texto,double fontSize,FontWeight fontWeight){
    return Text(texto,style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize
    ));
  }


}
