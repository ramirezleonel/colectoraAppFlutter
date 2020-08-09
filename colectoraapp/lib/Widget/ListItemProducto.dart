import 'package:flutter/material.dart';
class ListItemProducto extends StatefulWidget {
  final int id;
  final String nombre;
  final String codigoBarra;
  final int cantidad;

  final ValueChanged<bool> accionPadre;
  ListItemProducto({this.id,this.nombre,this.codigoBarra,this.cantidad,this.accionPadre});

  @override
  _ListItemProductoState createState() => _ListItemProductoState();
}

class _ListItemProductoState extends State<ListItemProducto> {
  var isSelected = false;
  var mycolor=Colors.white;

  @override
  Widget build(BuildContext context) {
    return new Card(
      color: mycolor,
      child: new Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        new ListTile(
            selected: isSelected,
            title: new Text(widget.nombre),
            subtitle: new Text(widget.codigoBarra),
            trailing: new Text('${widget.cantidad}'),
            onLongPress: toggleSelection // what should I put here,
        )
      ]),
    );
  }

  void toggleSelection() {
    setState(() {
      if (isSelected) {
        mycolor=Colors.white;
        isSelected = false;
        widget.accionPadre(false);
      } else {
        mycolor=Colors.grey[300];
        isSelected = true;
        widget.accionPadre(true);
      }
    });
  }
}
