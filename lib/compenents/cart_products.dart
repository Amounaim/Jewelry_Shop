import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var Products_on_cart = [
    {
      "name":"Shapes Necklace",
      "picture":"assets/images2/products/HighJewelry.jpg",
      "price":678,
      "size":"17.7",
      "color":'Silver', //Metal Color
      "Quantity":1,
    },
    {
      "name":"Leather Bracelet",
      "picture":"assets/images2/products/cst1.jpg",
      "price":39,
      "size":"M",
      "color":'Black',
      "Quantity":1,
    },
    {
      "name":"multicolour Bracelet",
      "picture":"assets/images2/products/kids3.jpg",
      "price":10,
      "size":"S",
      "color":'Multicolour ',
      "Quantity":1,
    },
    {
      "name":"Gold rong",
      "picture":"assets/images2/products/rings.jpg",
      "price":1290,
      "size":"M",
      "color":'Gold',
      "Quantity":1,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: Products_on_cart.length,
      itemBuilder: (context , index) {
        return new Single_cart_product(
          cart_prod_name: Products_on_cart[index]["name"],
          cart_prod_picture: Products_on_cart[index]["picture"],
          cart_prod_size: Products_on_cart[index]["size"],
          cart_prod_qty: Products_on_cart[index]["Quantity"],
          cart_prod_color:Products_on_cart[index]["color"],
          cart_prod_price:Products_on_cart[index]["price"],
        );
      }
    );
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_size;
  final cart_prod_color;
  var cart_prod_qty;
  final cart_prod_price;

  Single_cart_product({
    this.cart_prod_name,this.cart_prod_color,this.cart_prod_picture,
    this.cart_prod_price,this.cart_prod_qty,this.cart_prod_size,
});



  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
//    ========= LEADING SECTION ================
        leading: new Image.asset(cart_prod_picture,width: 50.0,height: 50.0,),

//    ========= TITLE SECTION ================
        title: new Text(cart_prod_name),

//    ========= SUBTITLE SECTION ================
        subtitle: new Column(
          children: <Widget>[
//        ROW INSIDE THE COLUMN            
            new Row(
              children: <Widget>[
//    ============This section is for size of the product=============
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text("Size:"),),

                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(cart_prod_size , style: TextStyle(color: Colors.red,),),),

//       ==============This section is for size of the product============

                new Padding(padding: const EdgeInsets.fromLTRB(20.0,8.0,8.0,8.0),
                  child: new Text("Color:"),
                ),

                new Padding(padding: const EdgeInsets.all(3),
                  child: new Text(cart_prod_color ,style: TextStyle(color: Colors.red,),),
                ),


              ],
            ),

//     =================THIS SECTION IS FOR THE PRODUCT PRICE ==============
          
            new Container(
              alignment: Alignment.topLeft,
                child: new Text('\$${cart_prod_price}', style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,),),
            ),
          ],
        ),

        trailing: FittedBox(
          fit: BoxFit.fill,
          child: Column(
            children: <Widget>[
              IconButton(icon: Icon(Icons.arrow_drop_up,color: Colors.red),iconSize: 38, onPressed: () {}),
              Text('${cart_prod_qty}',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              IconButton(icon: Icon(Icons.arrow_drop_down,color: Colors.red,),iconSize: 38, onPressed: () {}),
              /*new IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: (){
              addQuantity();
              //refreach page
            }), */

            ],
          ),
        ),




      ),
    );
  }

  void addQuantity(){
    cart_prod_qty = cart_prod_qty+1;
  }


}
