import 'package:colectoraapp/screens/DetalleProducto.dart';
import 'package:flutter/material.dart';
import 'package:stepper_counter_swipe/stepper_counter_swipe.dart';
class ListItemProducto extends StatefulWidget {
  final int id;
  final String nombre;
  final String codigoBarra;
  final double precio;
   int cantidad;


//  final ValueChanged<bool> accionPadre;
    final Function(bool,int id) accionPadre;
  final Function(int id,int cantidad) accionCantidad;
  ListItemProducto({this.id,this.nombre,this.codigoBarra,this.cantidad,this.precio,this.accionPadre,this.accionCantidad});

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
            trailing:contador(),
            onLongPress:(){
              toggleSelection(widget.id);
            },
          onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DetalleProducto(id:widget.id,nombre: widget.nombre,codigoBarra: widget.codigoBarra,precio: widget.precio,)));
          },//
          // what should I put here,
        )
      ]),
    );
  }

  Widget contador(){
   return StepperSwipe(
      initialValue:1,
      iconsColor: Colors.blue,
      speedTransitionLimitCount: 1,
      firstIncrementDuration: Duration(milliseconds: 100),
      secondIncrementDuration: Duration(milliseconds: 100),
      direction: Axis.horizontal,
      dragButtonColor: Colors.blue,
      withSpring: true,
      maxValue:1000,
      stepperValue:widget.cantidad,
      withNaturalNumbers: true,
      withFastCount: true,
      onChanged: (int cantidad) => {
      widget.accionCantidad(widget.id,cantidad)
      }
    );
  }

 toggleSelection(int id) {
    setState(() {
      if (isSelected) {
        mycolor=Colors.white;
        isSelected = false;
        widget.accionPadre(false,id);
      } else {
        mycolor=Colors.grey[300];
        isSelected = true;
        widget.accionPadre(true,id);
      }
    });
  }
}
