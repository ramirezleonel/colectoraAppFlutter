import 'package:flutter/material.dart';
import 'package:stepper_counter_swipe/stepper_counter_swipe.dart';
class ListItemProducto extends StatefulWidget {
  final int id;
  final String nombre;
  final String codigoBarra;
   int cantidad;

//  final ValueChanged<bool> accionPadre;
    final Function(bool,int id) accionPadre;
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
            trailing:  StepperSwipe(
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
              onChanged: (int val) => widget.cantidad = val,
            ),
            onLongPress:(){
              toggleSelection(widget.id);
            } // what should I put here,
        )
      ]),
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
