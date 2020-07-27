import 'package:flutter/material.dart';

class ProductoModel {
  final int id;
  final String nombre;
  final String codigoBarra;
   int cantidad;
  ProductoModel({this.id,this.nombre,this.codigoBarra,this.cantidad});

  factory ProductoModel.fromJson(Map<String, dynamic> json) {
    return ProductoModel(
      id: json['idArticulo'],
      nombre: json['nombre'],
      codigoBarra: json['codigo'],
      cantidad: 1,
    );
  }
}

