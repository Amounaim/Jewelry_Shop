import 'package:e_commerce/compenents/products.dart';
import 'package:e_commerce/screens/home_page.dart';

import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name ;
  final product_detail_new_price ;
  final product_detail_old_price ;
  final product_detail_picture ;

  ProductDetails({
    this.product_detail_name,this.product_detail_new_price,
    this.product_detail_old_price,this.product_detail_picture
});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amberAccent,
      child: new Scaffold(

        appBar: new AppBar(
          elevation: 0.1,
          backgroundColor: Colors.pink,
          title: InkWell(
              onTap: (){Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>new HomePage()),
              );},
              child: Text('Shopapp' ,style: TextStyle(color: Colors.white,  ))),
          actions: <Widget>[
            new IconButton(icon:Icon(Icons.search , color: Colors.white,), onPressed :() {}),
          ],
        ),

        body:new ListView(
          children: <Widget>[
            new Container(
              height: 250.0,
              child: GridTile(
                child: Container(
                  color: Colors.white,
                  child: Image.asset(widget.product_detail_picture ),
                ),
                footer: new Container(
                  color: Colors.white70,
                  child: new ListTile(
                    leading: new Text(widget.product_detail_name ,
                      style: TextStyle(fontWeight: FontWeight.bold , fontSize: 16.0),),

                    title: new Row(
                      children: <Widget>[
                        Expanded(
                          child: new Text("\$${widget.product_detail_old_price}",
                            style: TextStyle(color: Colors.grey , decoration: TextDecoration.lineThrough),),
                        ),
                        Expanded(
                          child: new Text("\$${widget.product_detail_new_price}",
                            style: TextStyle(color: Colors.red , fontWeight: FontWeight.bold),),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),

//           ============= The first buttons  ===============

            Row(
              children: <Widget>[

//          ========== the size button =========
                Expanded(
                  child: MaterialButton(
                    onPressed: (){
                      showDialog(context: context ,
                          builder: (context){ return new AlertDialog(
                            title: new Text("size"),
                            content: new Text("Choose the size"),
                            actions: <Widget>[
                              new MaterialButton(onPressed: (){ Navigator.of(context).pop(context); } ,
                                child: new Text("Close"),
                              ),
                            ],
                          );}
                          );
                    },
                    color: Colors.white,
                    textColor: Colors.grey,
                    elevation: 0.2,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: new Text("size"),
                        ),
                        Expanded(
                          child: new Icon(Icons.arrow_drop_down),
                        ),
                      ],
                    ),
                  ),
                ),

//         ========== the Color button =========
                Expanded(
                  child: MaterialButton(
                    onPressed: (){
                      showDialog(context: context ,
                          builder: (context){ return new AlertDialog(
                            title: new Text("Color"),
                            content: new Text("Choose the color"),
                            actions: <Widget>[
                              new MaterialButton(onPressed: (){ Navigator.of(context).pop(context); } ,
                                child: new Text("Close"),
                              ),
                            ],
                          );}
                      );
                    },
                    color: Colors.white,
                    textColor: Colors.grey,
                    elevation: 0.2,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: new Text("Colors"),
                        ),
                        Expanded(
                          child: new Icon(Icons.arrow_drop_down),
                        ),
                      ],
                    ),
                  ),
                ),

//          ========== the Quantity button =========
                Expanded(
                  child: MaterialButton(
                    onPressed: (){
                      showDialog(context: context ,
                          builder: (context){ return new AlertDialog(
                            title: new Text("Quantity"),
                            content: new Text("Choose the quantity"),
                            actions: <Widget>[
                              new MaterialButton(onPressed: (){ Navigator.of(context).pop(context); } ,
                                child: new Text("Close"),
                              ),
                            ],
                          );}
                      );
                    },
                    color: Colors.white,
                    textColor: Colors.grey,
                    elevation: 0.2,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: new Text("Qty"),
                        ),
                        Expanded(
                          child: new Icon(Icons.arrow_drop_down),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),

//           ============= The Second buttons  ===============
            Row(
              children: <Widget>[

//          ========== Buy Now button with 2 icons=========
                Expanded(
                  child: MaterialButton(
                    onPressed: (){},
                    color: Colors.red,
                    textColor: Colors.white,
                    elevation: 0.2,
                    child: new Text("By now")
                  ),
                ),

                new IconButton(
                    icon:Icon(Icons.add_shopping_cart ,color: Colors.red),
                    onPressed: (){},
                ),
                new IconButton(
                  icon:Icon(Icons.favorite_border , color: Colors.red ),
                  onPressed: (){},
                ),
              ],
            ),

            Divider(color: Colors.lightBlueAccent),
            new ListTile(
              title: new Text("Product details"),
              subtitle: new Text("Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page"
                  " avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500, quand"
                  " un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices "
                  "de texte. Il n'a pas fait que survivre cinq siècles, mais s'est aussi adapté à la bureautique informatique"
                  ", sans que son contenu n'en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de "
                  "feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des "
                  "applications de mise en page de texte, comme Aldus PageMaker."),
            ),

            Divider(color: Colors.lightBlueAccent),

            new Row(
              children: <Widget>[
                Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0,5.0 ,5.0),
                child: new Text('Product name' , style: TextStyle(color: Colors.grey),) ,
                ),
                Padding(padding:EdgeInsets.all(5.0),
                child: new Text(widget.product_detail_name),
                ),
              ],
            ),

            new Row(
              children: <Widget>[
                Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0,5.0 ,5.0),
                  child: new Text('Product brand' , style: TextStyle(color: Colors.grey),) ,
                ),

//               Remember to create the product brand
                Padding(padding:EdgeInsets.all(5.0),
                  child: new Text("Brand X"),
                ),
              ],
            ),

//               Add the product condition
            new Row(
              children: <Widget>[
                Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0,5.0 ,5.0),
                  child: new Text('Product conditions' , style: TextStyle(color: Colors.grey),) ,
                ),
                Padding(padding:EdgeInsets.all(5.0),
                  child: new Text("NEW"),
                ),
              ],
            ),

//         SIMILAR PRODUCT SECTION:
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Text('Similar products'),
            ),
            Container(
              height: 360,
              child: Similar_products(),
            ),

          ],
        ),
      ),
    );
  }
}






class Similar_products extends StatefulWidget {
  @override
  _Similar_productsState createState() => _Similar_productsState();
}

class _Similar_productsState extends State<Similar_products> {

  var product_list = [

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
          return Similar_single_prod(
            prod_name: product_list[index]['name'],
            prod_picture: product_list[index]['picture'],
            prod_old_price: product_list[index]['old price'],
            prod_price: product_list[index]['price'],
          );
        }
    );
  }
}


class Similar_single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Similar_single_prod({this.prod_name,this.prod_picture,this.prod_old_price,this.prod_price});

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