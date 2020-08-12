import 'package:flutter/material.dart';

class Producto {
  final int id;
  final String nombre;
  final String codigoBarra;
  final double precio;
        int cantidad;
  Producto({this.id,this.nombre,this.codigoBarra,this.cantidad,this.precio});

  factory Producto.fromJson(Map<String, dynamic> json) {
    return Producto(
      id: json['id'],
      nombre: json['nombre'],
      codigoBarra: json['codigoBarra'],
      precio: json['precio'],
      cantidad: 1,
    );
  }
}

