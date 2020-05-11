import 'package:flutter/material.dart';
import 'package:shopping_app/pages/products_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productList = [
    {
      "name":"Blazer",
      "picture":"images/products/blazer1.jpeg",
      "old_price":5000,
      "price":4500
    },
     {
      "name":"Red Dress",
      "picture":"images/products/dress1.jpeg",
      "old_price":6500,
      "price":5500
    },
     {
      "name":"Bag",
      "picture":"images/w1.jpeg",
      "old_price":2500,
      "price":1500
    },
      {
      "name":"Trouser",
      "picture":"images/products/pants1.jpg",
      "old_price":2000,
      "price":1000
    },
      {
      "name":"Flower Skirt",
      "picture":"images/products/skt1.jpeg",
      "old_price":1000,
      "price":850
    },
     {
      "name":"Pink Skirt",
      "picture":"images/products/skt2.jpeg",
      "old_price":1550,
      "price":999
    },
      {
      "name":"Heels",
      "picture":"images/products/hills1.jpeg",
      "old_price":500,
      "price":450
    },
    
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productList.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context,int index){
        return SingleProduct(
         productName: productList[index]['name'],
         productPicture: productList[index]['picture'],
         productOldprice: productList[index]['old_price'],
         productPrice: productList[index]['price'],
        );
      });
  }
}

class SingleProduct extends StatelessWidget {
  final productName;
  final productPicture;
  final productOldprice;
  final productPrice;
  SingleProduct({this.productName,this.productOldprice,this.productPicture,this.productPrice});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: productName,
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (context)=> new ProductsDetails(
                  productName:productName,
                  productOldprice:productOldprice,
                  productPicture:productPicture,
                  productPrice:productPrice
                ))),
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(productName,style:TextStyle(fontWeight: FontWeight.bold),),
                  title: Text("\₹$productPrice",style: TextStyle(color: Colors.red),),
                  subtitle: Text("\₹$productOldprice",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w800,
                    decoration: TextDecoration.lineThrough),),
                ),
              ),
              child: Image.asset(productPicture,
              fit: BoxFit.cover,) ,
            ),
          ),),),
    );
  }
}