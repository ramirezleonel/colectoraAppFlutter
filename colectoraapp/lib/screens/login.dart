import 'package:flutter/material.dart';

class Login extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.blue,
      body:Container(
          child :Stack(
            children: <Widget>[
              ClipPath(
                clipper: BackgroundShape(),
                child:Container(
                  width: double.infinity,
                  height: 300,

                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Colors.blue, Colors.lightBlue,Colors.blue,Colors.lightBlue])

                  ),

                ),
              ),
              SafeArea(
                  child: Center(
                      child: SingleChildScrollView(
                        child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            margin:EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10),
                            child: Container(
                                padding: EdgeInsets.all( 20),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 5.0,
                                          offset: Offset(1.0,5.0,),
                                          spreadRadius: 5.0
                                      )
                                    ]
                                ),
                                child:  Column(
                                  children: <Widget>[
                                    Icon(Icons.person,size: 100.0),
                                    Padding(
                                      padding:EdgeInsets.only(bottom: 30),
                                    ),
                                    TextFormField(
                                      decoration: const InputDecoration(
                                          labelText: 'Usuario',
                                          icon: const Padding(
                                              padding: const EdgeInsets.only(top: 15.0),
                                              child: const Icon(Icons.person))),
                                    ),
                                    TextFormField(

                                      decoration: const InputDecoration(
                                          labelText: 'Contraseña',
                                          icon: const Padding(
                                              padding: const EdgeInsets.only(top: 15.0),
                                              child: const Icon(Icons.lock))),
                                      obscureText: true,
                                    ),
                                    Padding(
                                      padding:EdgeInsets.only(bottom: 50),
                                    ),
                                    FlatButton(
                                      color: Colors.blue,
                                      textColor: Colors.white,
                                      disabledColor: Colors.grey,
                                      disabledTextColor: Colors.black,
                                      splashColor: Colors.blueAccent,
                                      onPressed: () {
                                        Navigator.of(context).pushReplacementNamed('ingresoMercaderia');
                                      },
                                      child: Text(
                                        "Ingresar",
                                        style: TextStyle(fontSize: 20.0),
                                      ),
                                    )
                                  ],
                                )
                            )
                        ),
                      )
                  )
              )

            ],
          )
      )
    );
  }


}
class BackgroundShape extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width/2, size.height -100,size.width, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}