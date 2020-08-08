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
  Future<String> postIngreso(List<Producto> producto) async {

    Map <String,dynamic> map= new  Map <String,dynamic>() ;

    producto.forEach((producto) => {

      map["idarticulo"] = producto.id,
      map["precio"] = 0,
      map["cantidad"] = producto.cantidad}
      );
    print(map);
    final jsonIngreso = jsonEncode(<String, dynamic>{
        "idproveedor" : 1,
        "tipocomprobante" : "COLECTORA",
        "iva" : 21.00,
        "serie" : "1",
        "correlativa" : "0",
        "estado" : "EMITIDO",
        "movimiento" : "INGRESO",
        "detalle_Movstocks":
        [
          map
        ]

    });


    final response = await http.post(
      _url + '/stock',
      headers: {"Content-Type": "application/json"},
      body: jsonIngreso,
    );
    print(response.statusCode);
    return response.body;
  return "";
  }
}