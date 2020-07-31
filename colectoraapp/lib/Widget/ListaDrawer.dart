import 'package:flutter/material.dart';

class ListaDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child:  Icon( Icons.person , color: Colors.white, size: 100.0),
          decoration: BoxDecoration(
            color: Colors.grey,
          ),
        ),
        ListTile(
            leading: Icon(Icons.assignment_turned_in, color:Colors.blue),
            title: Text('Ingreso de Mercaderia'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('ingresoMercaderia');
            }
        ),

        ListTile(
            leading: Icon(Icons.assignment, color:Colors.blue),
            title: Text('Retiro de Mercaderia'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('retiroMercaderia');
            }
        ),
        Divider(),
        ListTile(
            leading: Icon(Icons.exit_to_app, color:Colors.blue),
            title: Text('Cerrar sesión'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('login');
            }
        )
      ],
    );
  }

}