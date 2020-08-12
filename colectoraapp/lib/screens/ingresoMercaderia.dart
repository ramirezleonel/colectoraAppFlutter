import 'dart:convert';

import 'package:colectoraapp/Model/producto.dart';
import 'package:colectoraapp/Providers/ApiManager.dart';
import 'package:colectoraapp/Widget/ListItemProducto.dart';
import 'package:colectoraapp/Widget/ListaDrawer.dart';
import 'package:colectoraapp/Widget/appBarCustom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class IngresoMercaderia extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _IngresoMercaderia();
  }
}

class _IngresoMercaderia extends State<IngresoMercaderia>{
  String codigoBarra = "";
  bool isSelected = false;
  bool isBotonBorrar = false;
  int contador = 0;
  List<int> seleccionadoEliminar = new List<int>();

  var colorAppBar=Colors.blue;
  var tituloAppBar=Text("Ingreso de Mercadería");

  Future <Producto> productos ;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  List <Producto> listaProductos = new List<Producto>();
  final TextEditingController textEditingController = new TextEditingController();
  final api = ApiManager();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(

      key:scaffoldKey,
      appBar:AppBar(
        backgroundColor: colorAppBar,
        title: tituloAppBar,
        actions: <Widget>[
          _botonBorrarProducto(),
        ],
      ),
      drawer: Drawer(
        child: ListaDrawer(),
    ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
           _inputCodigoBarra(),
            _listaProductos(),
            _botonGuardarIngreso()
          ],
        ),
      ),
    );
  }

  _actualizarStepperSwipe(int id,int cantidad) {
    setState(() {
      productos = null;
      listaProductos.firstWhere((producto) => producto.id == id).cantidad = cantidad;
    });
  }
  _actualizarBotonBorrar(bool isSelected,int id) {

    setState(() {
      if(isSelected == true){
        this.contador++;
        seleccionadoEliminar.add(id);
      }else{
        this.contador--;
        seleccionadoEliminar.remove(id);
      }
      productos = null;
      if(this.contador > 0 ){
        colorAppBar = Colors.grey;
        isBotonBorrar = true;

      }else{
        _DeseleccionarTodo();
      }
    });
  }
  _DeseleccionarTodo(){
    isBotonBorrar = false;
    colorAppBar = Colors.blue;
    contador = 0;
    tituloAppBar = Text("Ingreso de Mercadería");
  }

  Widget _botonBorrarProducto(){
    return Visibility(
      visible: isBotonBorrar,
       child: IconButton(icon: Icon(Icons.delete), onPressed: (){
         setState(() {
           seleccionadoEliminar.forEach((id) {
             listaProductos.removeWhere((producto) => producto.id == id);
           });
           _DeseleccionarTodo();
         });
       }),
    );
  }
  Widget _inputCodigoBarra(){
    return TextField(
      decoration: new InputDecoration(labelText: "Codigo de Barra"),
      keyboardType: TextInputType.number,
      onChanged: onChange,
      controller: textEditingController,
      autofocus: true,
    );
  }
  void onChange(String val){
    if(val.length == 13){
      setState(() {
        codigoBarra = val ;
        productos = fetchProducto(codigoBarra);
        textEditingController.clear();
      });
    }
  }
  Widget _botonGuardarIngreso(){

    return  Container(
        child: ButtonTheme(
          minWidth: 300.0,
          child: RaisedButton(
            onPressed: () {
              if(listaProductos.length> 0){
                fetchGuardarIngreso().then((estadoServer) => {
                  if(estadoServer == 200){
                    _showDialog("El ingreso de Mercadería se ha guardado con exito")
                  }else{
                    _showDialog("Ha ocurrido un error al guardar",true)
                  }
                });
              }else{
                _showDialog("No existen productos para guardar");
              }
            },
            child: Text("Guardar"),
            colorBrightness: Brightness.dark,
          ),
        )
    );
  }
   _showDialog(String texto,[bool error])  {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(texto),
          actions: <Widget>[
            FlatButton(
              child: Text('Aceptar'),
              onPressed: () {
                if(error == null){
                  setState(() {
                    productos = null;
                    this.listaProductos.clear();
                  });
                }
              Navigator.of(context).pop();

              },
            ),
          ],
        );
      },
    );
  }

//  Widget _listaPrueba(){
//    return Container(
//      child:Expanded(
//         child: ListView(
//           children: <Widget>[
//             ListItemProducto(id: 1,cantidad: 2,codigoBarra: "4334343434",nombre: "Pan dulce",accionPadre: _actualizarBotonBorrar),
//             ListItemProducto(id: 3,cantidad: 3,codigoBarra: "4334343434",nombre: "Coca-cola",accionPadre: _actualizarBotonBorrar ),
//             ListItemProducto(id: 2,cantidad: 4,codigoBarra: "4334343434",nombre: "Sal fina" ,accionPadre: _actualizarBotonBorrar),
//           ],
//         )
//
//      ),
//
//    );
//  }

  Widget _listaProductos() {
    return  Container(
        child: FutureBuilder<Producto>(
            future: productos,
            builder: (context, snapshot) {
              if (!snapshot.hasData && snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                    margin: EdgeInsets.all(20.0),
                    child:Center(child: CircularProgressIndicator())
                );
              }
              if(snapshot.hasData && snapshot.connectionState == ConnectionState.done){
                bool encontrado = false;

                listaProductos.forEach((producto){
                  if(producto.codigoBarra == snapshot.data.codigoBarra){
                    encontrado = true;
                    producto.cantidad += 1;
                  }
                });

                if(encontrado ==false){
                  if(snapshot.data.id != null){
                    listaProductos.add(snapshot.data);
                  }else{
                    Future.delayed(Duration.zero, () {
                      scaffoldKey.currentState.showSnackBar(
                          SnackBar(
                              content: Text("No se ha encontrado el producto"),
                              backgroundColor: Colors.orangeAccent
                          )
                      );
                    });
                 }
                }
              }
              return Expanded(
                child: ListView.builder(
                    key: _listKey,
                    itemCount: listaProductos.length ,
                    itemBuilder: (context,index){

                     return ListItemProducto(id: listaProductos[index].id,
                         cantidad: listaProductos[index].cantidad,
                         codigoBarra:listaProductos[index].codigoBarra,
                         nombre: listaProductos[index].nombre,
                         precio: listaProductos[index].precio,
                         accionPadre: _actualizarBotonBorrar,
                         accionCantidad : _actualizarStepperSwipe);
                    }
                ),
              );
            }
        )
    );
  }

  /*consumir api*/
  Future<Producto> fetchProducto(String codBarra) async {
    return await api.getProducto(codBarra);
  }

  Future<int> fetchGuardarIngreso() async {
    return await api.postIngreso(listaProductos);
  }

}