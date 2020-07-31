import 'package:flutter/material.dart';

class Login extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
      body: SafeArea(

        child: SingleChildScrollView(
         child: Card(
              margin:EdgeInsets.all( 10),
              child: Container(
                  padding: EdgeInsets.all( 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 3.0,
                            offset: Offset(0.0,5.0),
                            spreadRadius: 3.0
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
      ),
    );
  }

}