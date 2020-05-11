import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopping_app/components/horizontal_listview.dart';
import 'package:shopping_app/components/products.dart';
import 'package:shopping_app/pages/cart.dart';
import 'package:shopping_app/pages/login.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LoginPage loginPage = new LoginPage();
  GoogleSignIn googleSignIn = new GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    //Horizontal Scrolling Images
    Widget imageCarousal = new Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/c1.jpg'),
          AssetImage('images/m1.jpeg'),
          AssetImage('images/w3.jpeg'),
          AssetImage('images/w4.jpeg'),
          AssetImage('images/m2.jpg'),
          AssetImage('images/w3.jpeg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 3000),
        dotSize: 4.0,
        dotColor: Colors.redAccent,
        indicatorBgPadding: 4.0,
      ),
    );
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.redAccent,
              expandedHeight: 250.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: new RichText(
                  text: TextSpan(
                      style: TextStyle(fontSize: 20.0),
                      children: <TextSpan>[
                        TextSpan(text: 'Shop',),
                        TextSpan(text: "N'",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: 'Style')
                      ]
                  ),
                ),
                background: imageCarousal,
              ),
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
                  onPressed: () =>
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => ShoppingCart())),
                )
              ],
            )
          ];
        },

        body: Column(
          children: <Widget>[
            //   imageCarousal,

            //Padding Widget
            Padding(padding: EdgeInsets.all(8.0),
              child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Text("Categories",
                      style: TextStyle(fontWeight: FontWeight.bold))),
            ),

            //Horizontal Categories
            HorizontalView(),
            Divider(height: 15.0,),
            new Padding(padding: const EdgeInsets.all(8.0),
              child: Container(
                  alignment: Alignment.bottomLeft,
                  child: new Text('Recent Products',
                      style: TextStyle(fontWeight: FontWeight.bold))),
            ),
            Flexible(child: Products()),

          ],
        ),
      ),
      drawer: new Drawer(
        elevation: 20.0,
        child: new ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text("Kamran Ahmed"),
              accountEmail: Text("coolkamran.ahmed@gmail.com"),
              currentAccountPicture: new GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.redAccent,
              ),
            ),
            InkWell(
              onTap: () =>
                  Navigator.of(context).pop(new MaterialPageRoute(
                      builder: (context) => new HomePage()
                  )),
              child: ListTile(
                title: Text("Home Page"),
                leading: Icon(Icons.home, color: Colors.red),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("My Account"),
                leading: Icon(Icons.person, color: Colors.red),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("My Orders"),
                leading: Icon(Icons.shopping_basket, color: Colors.red),
              ),
            ),
            InkWell(
              onTap: () =>
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (context) => ShoppingCart())),
              child: ListTile(
                title: Text("Shopping Cart"),
                leading: Icon(Icons.shopping_basket, color: Colors.red),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Favourites"),
                leading: Icon(Icons.favorite, color: Colors.red),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Settings"),
                leading: Icon(Icons.settings, color: Colors.grey),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("About"),
                leading: Icon(Icons.help, color: Colors.green),
              ),
            ),
               InkWell(
              onTap: () {
                googleSignIn.signOut();
                 Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => LoginPage()));
              },
              child: ListTile(
                title: Text("Logout"),
                leading: Icon(Icons.exit_to_app, color: Colors.orange),
              ),
            )
          ],
        ),
      ),
    );
  }
}