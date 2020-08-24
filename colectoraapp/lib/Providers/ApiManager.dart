import 'dart:convert';

import 'package:colectoraapp/Model/producto.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  String _url = 'http://192.168.0.197:9999';

  Future<Producto> getProducto(String codigoBarra) async {

    final response = await http.get(
      _url + '/barra/${codigoBarra}',
    );
    String source = Utf8Decoder().convert(response.bodyBytes);
    final decodedResponse = json.decode(source);

    final producto = Producto.fromJson(decodedResponse);

    return producto;
  }
  Future<int> postIngreso(List<Producto> producto) async {

   var mapProducto = producto.map((p) => {"idarticulo" : p.id ,
     "precio":0,
     "cantidad": p.cantidad
   }).toList();

    final jsonIngreso = jsonEncode(<String, dynamic>{
        "idproveedor" : 1,
        "tipocomprobante" : "COLECTORA",
        "iva" : 21.00,
        "serie" : "1",
        "correlativa" : "0",
        "estado" : "EMITIDO",
        "movimiento" : "INGRESO",
        "detalle_Movstocks": mapProducto
    });

    final response = await http.post(
      _url + '/stock',
      headers: {"Content-Type": "application/json"},
      body: jsonIngreso,
    );

    return response.statusCode;

  }
}