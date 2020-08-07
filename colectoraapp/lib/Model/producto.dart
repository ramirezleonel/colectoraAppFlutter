import 'package:flutter/material.dart';

class Producto {
  final int id;
  final String nombre;
  final String codigoBarra;
   int cantidad;
  Producto({this.id,this.nombre,this.codigoBarra,this.cantidad});

  factory Producto.fromJson(Map<String, dynamic> json) {
    return Producto(
      id: json['idArticulo'],
      nombre: json['nombre'],
      codigoBarra: json['codigoBarra'],
      cantidad: 1,
    );
  }
}

