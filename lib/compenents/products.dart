
import 'package:e_commerce/screens/product_details.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  var product_list = [
    {
      "name":"indian necklace",
      "picture":"assets/images2/products/indian_gold_necklace.jpg",
      "old price":1020,
      "price":1520,
    },
    {
      "name":"Gold ring",
      "picture":"assets/images2/products/interface.jpg",
      "old price":230,
      "price":355,
    },
    {
      "name":"Collier",
      "picture":"assets/images2/products/Collier.jpg",
      "old price":71,
      "price":105,
    },

    {
      "name":"Diamond earrings",
      "picture":"assets/images2/products/women1.jpg",
      "old price":199,
      "price":275,
    },
    {
      "name":"wombst",
      "picture":"assets/images2/products/wombst.jpg",
      "old price":230,
      "price":545,
    },
    {
      "name":"Men's bracelet",
      "picture":"assets/images2/products/braceletH.jpg",
      "old price":13,
      "price":20,
    },
  ];
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount:product_list.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // l7ad li ikon f ligne
        ),
        itemBuilder: (BuildContext context , int index){
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Single_prod(
              prod_name: product_list[index]['name'],
              prod_picture: product_list[index]['picture'],
              prod_old_price: product_list[index]['old price'],
              prod_price: product_list[index]['price'],
            ),
          );
        }
    );
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Single_prod({this.prod_name,this.prod_picture,this.prod_old_price,this.prod_price});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: prod_name,
        child: Material(
          child: InkWell(

            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
              //Here we are passing the values of the product to product details page
                builder: (context) => new ProductDetails(
                  product_detail_name: prod_name,
                  product_detail_new_price: prod_price,
                  product_detail_old_price: prod_old_price,
                  product_detail_picture: prod_picture,
                )
            )),

            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: new Row(
                  children: <Widget>[
                    Expanded(
                      child: new Text(prod_name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),),
                    ),
                    new Text("\$$prod_price",
                      style: TextStyle(color: Colors.red , fontWeight: FontWeight.bold,fontSize: 16.0),),
                    new Text("\$$prod_old_price",
                      style: TextStyle(color: Colors.grey ,fontWeight: FontWeight.w400,fontSize: 10.0,decoration: TextDecoration.lineThrough),),
                  ],
                ),
              ),
              child: Image.asset(prod_picture, fit: BoxFit.cover,),
            ),
          ),
        ),
      ),
    );
  }
}

