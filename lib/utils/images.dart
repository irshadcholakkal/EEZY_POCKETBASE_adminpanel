import 'package:flutter/material.dart';

final hideImage = Image.asset(
  "assets/images/hide.png",
  scale: 24,
);
final viewImage = Image.asset("assets/images/view.png", scale: 24);
Image passwordHide = Image.asset(
  "Assets/hide.png",
  scale: 24,
);
ClipRRect firstSlideImage = ClipRRect(
  borderRadius: const BorderRadius.all(Radius.circular(20)),
  child: Image.asset(
    "assets/images/first demo.jpg",
    fit: BoxFit.fill,
  ),
);
ClipRRect secondSlideImage = ClipRRect(
  borderRadius: const BorderRadius.all(Radius.circular(20)),
  child: Image.asset("assets/images/second demo.jpg",fit: BoxFit.fill,),);
ClipRRect thirdSlideImage = ClipRRect(
  borderRadius: const BorderRadius.all(Radius.circular(20)),
  child: Image.asset("assets/images/third demo.jpg",fit: BoxFit.fill,));
List <Image>cartImages = [
  Image.asset("assets/images/produt.jpg",fit: BoxFit.cover,),
  Image.asset("assets/images/product 1.2.jpg",fit: BoxFit.cover,),
  Image.asset("assets/images/produt.jpg",fit: BoxFit.cover),
 
];
//   child: Image.asset(
//     "assets/images/third demo.jpg",
//     fit: BoxFit.fill,
//   ),
// );
Image gnavprofileImage = Image.asset(
  "assets/images/profile.png",
  width: 20,
  height: 20,
);
Image gnavhomeImage = Image.asset(
  "assets/images/home.png",
  width: 20,
  height: 20,
);
Image gnavnotificationImage = Image.asset(
  "assets/images/notification.png",
  width: 20,
  height: 20,
);
Image gnavcartImage = Image.asset(
  "assets/images/cart.png",
  width: 20,
  height: 20,
);
