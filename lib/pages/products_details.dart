import 'package:flutter/material.dart';
import 'package:shopping_app/pages/cart.dart';

class ProductsDetails extends StatefulWidget {
  final productName;
  final productPicture;
  final productOldprice;
  final productPrice;

  ProductsDetails(
      {this.productName, this.productOldprice, this.productPicture, this.productPrice});

  @override
  _ProductsDetailsState createState() => _ProductsDetailsState();
}

class _ProductsDetailsState extends State<ProductsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        title: new Text('Details'),
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
            tooltip: "Shopping cart",
            onPressed: () =>
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) => ShoppingCart())),
          )
        ],
      ),

      body: ListView(
        children: <Widget>[
          Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.productPicture),
              ),
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: new Text("${widget.productName}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16.0),),
                  title: new Row(
                    children: <Widget>[
                      Expanded(
                          child: new Text("\₹${widget.productOldprice}",
                            style: TextStyle(color: Colors.grey,
                                decoration: TextDecoration.lineThrough),)
                      ),
                      Expanded(
                          child: new Text("\₹${widget.productPrice}",
                            style: TextStyle(fontWeight: FontWeight.bold,
                                color: Colors.red),)
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: new Text("Size"),
                            content: new Text("Choose the Size"),
                            actions: <Widget>[
                              new MaterialButton(onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                                child: new Text("Close"),)
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: new Text("Size")
                      ),
                      Expanded(
                        child: new Icon(Icons.arrow_drop_down),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: new Text("Color"),
                            content: new Text("Choose the Color"),
                            actions: <Widget>[
                              new MaterialButton(onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                                child: new Text("Close"),)
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: new Text("Color")
                      ),
                      Expanded(
                        child: new Icon(Icons.arrow_drop_down),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: new Text("Quantity"),
                            content: new Text("Choose the Qty"),
                            actions: <Widget>[
                              new MaterialButton(onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                                child: new Text("Close"),)
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: new Text("Qty")
                      ),
                      Expanded(
                        child: new Icon(Icons.arrow_drop_down),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.redAccent,
                  textColor: Colors.white,
                  child: new Text(
                    "Buy Now", style: TextStyle(fontWeight: FontWeight.bold),),
                ),
              ),
              IconButton(
                icon: Icon(Icons.add_shopping_cart, color: Colors.red,),
                onPressed: () {},
                tooltip: "Add Shopping Cart",),
              IconButton(icon: Icon(Icons.favorite_border, color: Colors.red,),
                onPressed: () {},
                tooltip: "Favourite",)
            ],
          ),
          Divider(),
          new ListTile(
            title: Text("Products details",
              style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text(
                "qwtrrfyjbkjkhio jkio  mjhkuh khknkjnihnmh mjkn,nlij  ,hinlkjpolm;ojufnkihiohnkhoik,mnkljn,h,kjhkjn,jnlkn ,mnm njn ,mnklnlnlkbvffjvmoijgveorpedjkmvrfkfrokgfmvf"),
          ),
          Divider(),
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  "Product name", style: TextStyle(color: Colors.grey),),),
              Padding(padding: const EdgeInsets.all(5.0),
                child: new Text("${widget.productName}"),)
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  "Product brand", style: TextStyle(color: Colors.grey),),),
              Padding(padding: const EdgeInsets.all(5.0),
                child: new Text("V-Mart"),)
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  "Product condition", style: TextStyle(color: Colors.grey),),),
              Padding(padding: const EdgeInsets.all(5.0),
                child: new Text("New"),)
            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text("Similar Products",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Container(
            height: 350.0,
            child: SimilarProducts(),
          )
        ],
      ),
    );
  }
}

class SimilarProducts extends StatefulWidget {
  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
  var productList = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "old_price": 5000,
      "price": 4500
    },

    {
      "name": "Trouser",
      "picture": "images/products/pants1.jpg",
      "old_price": 2000,
      "price": 1000
    },
    {
      "name": "Flower Skirt",
      "picture": "images/products/skt1.jpeg",
      "old_price": 1000,
      "price": 850
    },

  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productList.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return SimilarSingleProduct(
            productName: productList[index]['name'],
            productPicture: productList[index]['picture'],
            productOldprice: productList[index]['old_price'],
            productPrice: productList[index]['price'],
          );
        });
  }
}

class SimilarSingleProduct extends StatelessWidget {
  final productName;
  final productPicture;
  final productOldprice;
  final productPrice;

  SimilarSingleProduct(
      {this.productName, this.productOldprice, this.productPicture, this.productPrice});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: productName,
        child: Material(
          child: InkWell(
            onTap: () =>
                Navigator.of(context).push(
                    new MaterialPageRoute(
                        builder: (context) =>
                        new ProductsDetails(
                            productName: productName,
                            productOldprice: productOldprice,
                            productPicture: productPicture,
                            productPrice: productPrice
                        ))),
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(productName,
                    style: TextStyle(fontWeight: FontWeight.bold),),
                  title: Text(
                    "\₹$productPrice", style: TextStyle(color: Colors.red),),
                  subtitle: Text("\₹$productOldprice",
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w800,
                        decoration: TextDecoration.lineThrough),),
                ),
              ),
              child: Image.asset(productPicture,
                fit: BoxFit.cover,),
            ),
          ),),),
    );
  }
}