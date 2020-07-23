import 'package:colectoraapp/Perfil.dart';
import 'package:colectoraapp/RetiroMercaderia.dart';
import 'package:colectoraapp/screens/ingresoMercaderia.dart';
import 'package:flutter/material.dart';

class Navegation extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Navegation();
  }

}

class _Navegation extends State<Navegation>{
  int indexTap = 0;
  final List<Widget> widgetChildren= [
    IngresoMercaderia(),
    RetiroMercaderia(),
    Perfil(),

  ];
  void onTapTapped(int index){
setState(() {
  indexTap = index;
});
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: widgetChildren[indexTap],

      bottomNavigationBar: Theme(
        data : Theme.of(context).copyWith(
          canvasColor: Color(0XFF0F52BA),
          primaryColor: Colors.white,
        ),child: BottomNavigationBar(
        onTap:onTapTapped ,
        currentIndex: indexTap,
        items:[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.send),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text(""),
          ),
        ]
      ),
      ),
    );
  }
  
}