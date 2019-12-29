import 'package:flutter/material.dart';

class HorizentalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_location: 'assets/images2/cats/004-ring-1.png',
            image_caption: 'ring',
          ),
          Category(
            image_location: 'assets/images2/cats/022-bangle.png',
            image_caption: 'bracelet',
          ),
          Category(
            image_location: 'assets/images2/cats/026-gem.png',
            image_caption: 'diamond',
          ),
          Category(
            image_location: 'assets/images2/cats/010-wristwatch.png',
            image_caption: 'watch',
          ),
          Category(
            image_location: 'assets/images2/cats/009-bracelet.png',
            image_caption: 'pearl necklace',
          ),
          Category(
            image_location: 'assets/images2/cats/006-earrings-1.png',
            image_caption: 'earrings',
          ),
          Category(
            image_location: 'assets/images2/cats/008-necklace.png',
            image_caption: 'necklace',
          ),
          Category(
            image_location: 'assets/images2/cats/029-tiara.png',
            image_caption: 'hairlace',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;
  Category({
    this.image_caption,
    this.image_location,
});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: (){},
        child: Container(
            width: 80.0,
          child: ListTile(
            title: Image.asset(image_location,width: 40.0,height: 40.0,),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(image_caption,style: new TextStyle(fontSize: 12.0),),
            ),
          ),
        ),
      ) ,
    );
  }
}

