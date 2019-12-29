import 'package:e_commerce/compenents/horizental_view.dart';
import 'package:e_commerce/compenents/products.dart';
import 'package:e_commerce/screens/cart.dart';
import 'package:e_commerce/screens/login.dart';
import 'package:e_commerce/widgets/imagesc.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {


    return  Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.pink,
        title: Text('Shopapp' ,style: TextStyle(color: Colors.white,  )),
        actions: <Widget>[
          new IconButton(icon:Icon(Icons.search , color: Colors.white,), onPressed :() {}),
          new IconButton(icon:Icon(Icons.shopping_cart , color: Colors.white,), onPressed :() {
            Navigator.push(context,
              MaterialPageRoute(builder: (context)=> new Cart() ),
            );

          }),

        ],
      ),
      drawer: Drawer(
       child: new ListView(
         children: <Widget>[
           new UserAccountsDrawerHeader(
             accountName: Text('Abdel Munaim '),
             accountEmail: Text('mounaimrca41@gmail.com'),
             currentAccountPicture: GestureDetector(
               child: new CircleAvatar(
                 backgroundColor: Colors.deepPurpleAccent,
                 child: Icon(Icons.person , color: Colors.white,),
               ),
             ),
             decoration: new BoxDecoration(
               color: Colors.lightBlue,
             ),
           ),
//          body
           InkWell(
             onTap: () {},
             child: ListTile(
               title: Text('Home Page'),
               leading: Icon(Icons.home , color: Colors.red,),
                ),
           ),
           InkWell(
             onTap: () {},
             child: ListTile(
               title: Text('My Account'),
               leading: Icon(Icons.person , color: Colors.red,),
             ),
           ),
           InkWell(
             onTap: () {},
             child: ListTile(
               title: Text('My Orders'),
               leading: Icon(Icons.shopping_basket ,color: Colors.red, ),
             ),
           ),
           InkWell(
             onTap: () {
               Navigator.push(context,
                 MaterialPageRoute(builder: (context)=> new Cart() ),
               );
             },
             child: ListTile(
               title: Text('Shopping cart'),
               leading: Icon(Icons.shopping_cart , color: Colors.red,),
             ),
           ),
           InkWell(
             onTap: () {},
             child: ListTile(
               leading: Icon(Icons.favorite, color: Colors.red,),
               title: Text('Favorite'),
             ),
           ),
           Divider(),
           InkWell(
             onTap: () {},
             child: ListTile(
               title: Text('Settings'),
               leading: Icon(Icons.settings ),
             ),
           ),
           InkWell(
             onTap: () {},
             child: ListTile(
               title: Text('About'),
               leading: Icon(Icons.help ,color: Colors.lightBlueAccent,),
             ),
           ),
           InkWell(
             onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
             },
             child: ListTile(
               title: Text('Log out'),
               leading: Icon(Icons.keyboard_return ),
             ),
           ),
         ],
       ),
      ),

      body: new Column(
        children: <Widget>[
          //image carousel begins here
          images_carousel,

          //padding widget
          new Padding(padding: const EdgeInsets.all(4.0),
            child: Container(
                alignment: Alignment.centerLeft,
                child: Text('Categories')),
          ),

          //Horizental List View begins here
          HorizentalList(),

          //padding widget
          new Padding(padding: const EdgeInsets.all(4.0)
            ,child: Container(
                alignment: Alignment.centerLeft,
                child: Text('Recent Products')
            ),),

          //Grid View
          Flexible(
            child: Products(),
          ),
        ],
      ),

    );
  }
}
