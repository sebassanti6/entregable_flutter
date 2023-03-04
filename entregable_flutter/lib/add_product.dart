import 'package:app_crud_flutter/home_page.dart';
import 'package:app_crud_flutter/text_box.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddProduct();
}

class _AddProduct extends State<AddProduct> {
  late TextEditingController controllerName;
  late TextEditingController controllerDescription;
  late TextEditingController controllerPrice;
  late TextEditingController controllerCant;
  
  get cant => null;


  @override
  void initState() {
    controllerName = new TextEditingController();
    controllerDescription = new TextEditingController();
    controllerPrice = new TextEditingController();
    controllerCant = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Crear nuevo producto"),
        ),
        body: ListView(
          children: [
            
            TextBox(controllerName, "Ingrese los datos que se solicitan"),
            TextBox(controllerName, "Nombre"),
            TextBox(controllerDescription, "Descripcion"),
            TextBox(controllerPrice, "Precio"),
            TextBox(controllerCant, "Cantidad"),

            ElevatedButton(
                onPressed: () {
                  String name = controllerName.text;
                  String description = controllerDescription.text;
                  String price = controllerPrice.text;

                  if (name.isNotEmpty &&
                      description.isNotEmpty &&
                      price.isNotEmpty) {
                    Navigator.pop(
                        context,
                        new Product(
                            name: name,
                            description: description,
                            price: price,
                            cant: cant
                          ));
                  }
                },
                child: Text("Producto almacenado"))
          ],
        ));
  }
}
