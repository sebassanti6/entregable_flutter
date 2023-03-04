import 'package:app_crud_flutter/add_product.dart';
import 'package:app_crud_flutter/message_response.dart';
import 'package:flutter/material.dart';
import 'package:app_crud_flutter/modify_product.dart';

class Home_Page extends StatefulWidget {
  final String _title;
  Home_Page(this._title);
  @override
  State<StatefulWidget> createState() => _Home_Page();
}

class _Home_Page extends State<Home_Page> {
  List<Product> products = [
    Product(
        name: 'Cuaderno',
        description: 'Rayado 100 hojas, cocido',
        price: '4000',
        cant: '4'),
    Product(
        name: 'Cartilla',
        description: 'Cuadriculado 300 hojas, simple',
        price: '8000',
        cant: '8'),
    Product(
        name: 'Libro',
        description: 'Doblelínea 100 hojas, cocido',
        price: '3000',
        cant: '2')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget._title),
        ),
        body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ModifyProduct(products[index])))
                    .then((newProduct) {
                  if (newProduct != null) {
                    setState(() {
                      products.removeAt(index);

                      products.insert(index, newProduct);

                      messageResponse(
                          context, newProduct.name + " ha sido modificado correctamente!");
                    });
                  }
                });
              },
              onLongPress: () {
                removeProduct(context, products[index]);
              },
              title: Text(products[index].name),
              subtitle: Text(products[index].description +
                  " COP(Moneda colombiana) " +
                  products[index].price),
              leading: Card(
                child: Text(products[index].name.substring(0, 1)),
              ),
              trailing: Icon(
                Icons.emoji_objects,
                color: Colors.red,
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                    context, MaterialPageRoute(builder: (_) => AddProduct()))
                .then((newProduct) {
              if (newProduct != null) {
                setState(() {
                  products.add(newProduct);
                  messageResponse(context,
                      newProduct.name + "ha sido creado con exito!...");
                });
              }
            });
          },
          tooltip: "Add new product",
          child: Icon(Icons.add),
        ));
  }

  removeProduct(BuildContext context, Product product) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          
              title: Text("Eliminar producto"),
              content: Text("Esta seguro de eliminar a " + product.name + "?"),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      this.products.remove(product);
                      Navigator.pop(context);
                    });
                  },
                  child: Text(
                    "Eliminar",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancelar",
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ],
            ));
  }
}

class Product {
  var name;
  var description;
  var price;
  var cantidad;

  Product({this.name, this.description, this.price, this.cantidad, required cant});

  get cant => null;
}
