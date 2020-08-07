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
}