import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Cart'),
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            tooltip: "Search",
            onPressed: () {
              debugPrint("Click on Search");
            },),
          new IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            tooltip: "Shopping Cart",
            onPressed: () {},
          )
        ],
      ),
      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: new Text('Total'),
                subtitle: new Text('\₹5000'),
              ),
            ),
            Expanded(
              child: new MaterialButton(onPressed: () {},
                child: new Text(
                    'Check Out', style: TextStyle(color: Colors.white)),
                color: Colors.red,),
            )
          ],
        ),
      ),
    );
  }
}