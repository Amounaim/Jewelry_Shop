

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget images_carousel = new Container(
  height: 200.0,
  child: new Carousel(
    boxFit: BoxFit.cover,
    images: [
      AssetImage('assets/images2/belles.jpg'),
      AssetImage('assets/images2/bijuterii.jpeg'),
      AssetImage('assets/images2/bijouxenf.png'),
      AssetImage('assets/images2/bonne.jpg'),
      AssetImage('assets/images2/petite.jpg'),
      AssetImage('assets/images2/men-wearing-jewelry.jpg'),
      AssetImage('assets/images2/mens-bracelet-features.jpg'),
      AssetImage('assets/images2/jewelry-mob.jpg'),
      AssetImage('assets/images2/wpr3.jpg'),
      AssetImage('assets/images2/wpr5.jpg'),
      AssetImage('assets/images2/men-bracelets.jpg'),
    ],
    autoplay: false,
    animationCurve: Curves.fastOutSlowIn,
    animationDuration: Duration(milliseconds: 1000),

    dotSize: 4.0,
    dotColor: Colors.deepPurpleAccent,
    indicatorBgPadding: 2.0,
  ),
);