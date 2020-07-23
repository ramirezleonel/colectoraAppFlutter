import 'package:flutter/material.dart';


class ProductoItem extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Container(
     child: ListTile(
       leading: CircleAvatar(
         child: Text("L"),
       ),
         title: Text("Leonel Ramirez"),
       subtitle: Text("Prueba"),
     ),
   );
  }
  
}