import 'package:colectoraapp/Model/producto.dart';
import 'package:flutter/material.dart';

class Ingreso {
  final int idproveedor ;
  final String tipocomprobante;
  final double iva ;
  final String serie;
  final String correlativa;
  final String estado;
  final String movimiento;
  final List<Producto> detalle_Movstocks;

  Ingreso({this.idproveedor,this.tipocomprobante,
    this.iva,this.serie,this.correlativa,this.estado,
    this.movimiento,this.detalle_Movstocks});

  factory Ingreso.fromJson(Map<String, dynamic> json) {
    return Ingreso(
      idproveedor: json['idproveedor'],
      tipocomprobante: json['tipocomprobante'],
      iva: json['iva'],
      serie: json['serie'],
      correlativa: json['correlativa'],
      estado: json['estado'],
      movimiento: json['movimiento'],
      detalle_Movstocks: json['detalle_Movstocks'],
    );
  }
}

