import 'package:flutter/material.dart';

class ProductoModel {
  final int id;
  final String nombre;
  final String codigoBarra;
  ProductoModel({this.id,this.nombre,this.codigoBarra});
  factory ProductoModel.fromJson(Map<String, dynamic> json) {
    return ProductoModel(
      id: json['idArticulo'],
      nombre: json['nombre'],
      codigoBarra: json['codigo'],
    );
  }
}

