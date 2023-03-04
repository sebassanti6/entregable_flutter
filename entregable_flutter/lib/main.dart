import 'package:app_crud_flutter/home_page.dart';
import 'package:flutter/material.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(fontFamily: 'Raleway', 
      
      primarySwatch: Colors.blue,),
      home: Home_Page("Primer Interaccion con Flutter Inventario"),
      color: Colors.green,
      
      
     
      
      

    );
    return materialApp;
  }

  


  Card miCard() {
  return Card(
    
    
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
  
    margin: EdgeInsets.all(15),
    
    elevation: 10,

    child: Column(
      children: <Widget>[

        // Usamos ListTile para ordenar la información del card como titulo, subtitulo e icono
        ListTile(
          //configuraciones adicionales a la hora de generar las limitantes y los estilos
          contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
          title: Text('Deseas ver mas configuraciones'),
          subtitle: Text(
              'Este es un lugar donde puedes explorar tarjetas.'),
          leading: Icon(Icons.home),
        ),
        
        
        // Usamos una fila para ordenar los botones del card
        
      ],
    ),
  );
}

//Tener muy en cuenta la modificacion a la hora de precionar el boton
  FlatButton({required Map Function() onPressed, required Text child}) {}


}
