import 'package:flutter/material.dart';

class HorizontalView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(imageLocation: "images/cats/tshirt.png", caption: 'T-Shirt'),
          Category(imageLocation: "images/cats/dress.png", caption: 'Dress'),
          Category(imageLocation: "images/cats/formal.png", caption: 'Formal'),
          Category(imageLocation: "images/cats/informal.png", caption: 'Informal'),
          Category(imageLocation: "images/cats/shoe.png", caption: 'Shoe'),
          Category(imageLocation: "images/cats/jeans.png", caption: 'Jeans'),
          Category(imageLocation: "images/cats/accessories.png", caption: 'Accessories'),

        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imageLocation;
  final String caption;

  Category({this.imageLocation, this.caption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 80.0,
          child: ListTile(
            title: Image.asset(imageLocation, width: 60.0, height: 60.0),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(caption, style: new TextStyle(fontSize: 12.0)),
            ),
          ),
        ),
      ),
    );
  }
}