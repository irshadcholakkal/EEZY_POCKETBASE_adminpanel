
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



List<List<Widget>>dashBoardItem=[
  [const Icon(Icons.shopping_cart_rounded),Text(" DASHBOARD",style: GoogleFonts.rubik(fontSize: 15,fontWeight: FontWeight.w500),)],
   [const Icon(Icons.line_weight_sharp),Text(" ALL PRODUCTS",style: GoogleFonts.rubik(fontSize: 15,fontWeight: FontWeight.w500),)],
    [const Icon(Icons.paste_outlined),Text(" ORDER LIST",style: GoogleFonts.rubik(fontSize: 15,fontWeight: FontWeight.w500),)],
        [const Icon(Icons.people_alt_rounded),Text(" USERS",style: GoogleFonts.rubik(fontSize: 15,fontWeight: FontWeight.w500),)]


];


List<Map<String, List<Widget>>> combinedList = [
  {
    'typeOfOrders': [
      Text("Total Orders", style: GoogleFonts.rubik(fontSize: 15, fontWeight: FontWeight.w500)),
    ],
    'typeOfOrdersValues': [
      const Icon(Icons.shopping_cart_rounded),
      Row(
        children: [
          Text("₹", style: GoogleFonts.rubik(fontSize: 20, fontWeight: FontWeight.w500)),
          Text("230", style: GoogleFonts.rubik(fontSize: 20, fontWeight: FontWeight.w500)),
        ],
      ),
       Text("3", style: GoogleFonts.rubik(fontSize: 15, fontWeight: FontWeight.w500))
    ],
  },
  {
    'typeOfOrders': [
      Text("Active Orders", style: GoogleFonts.rubik(fontSize: 15, fontWeight: FontWeight.w500)),
    ],
    'typeOfOrdersValues': [
      const Icon(Icons.shopping_cart_rounded),
      Row(
        children: [
          Text("₹", style: GoogleFonts.rubik(fontSize: 20, fontWeight: FontWeight.w500)),
          Text("230", style: GoogleFonts.rubik(fontSize: 20, fontWeight: FontWeight.w500)),
        ],
      ),
      Text("3", style: GoogleFonts.rubik(fontSize: 15, fontWeight: FontWeight.w500))
    ],
  },
  {
    'typeOfOrders': [
      Text("Completed Orders", style: GoogleFonts.rubik(fontSize: 15, fontWeight: FontWeight.w500)),
    ],
    'typeOfOrdersValues': [
      const Icon(Icons.shopping_cart_rounded),
      Row(
        children: [
          Text("₹", style: GoogleFonts.rubik(fontSize: 20, fontWeight: FontWeight.w500)),
          Text("230", style: GoogleFonts.rubik(fontSize: 20, fontWeight: FontWeight.w500)),
        ],
      ),
       Text("3", style: GoogleFonts.rubik(fontSize: 15, fontWeight: FontWeight.w500))
    ],
  },
  {
    'typeOfOrders': [
      Text("Return Orders", style: GoogleFonts.rubik(fontSize: 15, fontWeight: FontWeight.w500)),
    ],
    'typeOfOrdersValues': [
      const Icon(Icons.shopping_cart_rounded),
     Row(
        children: [
          Text("₹", style: GoogleFonts.rubik(fontSize: 20, fontWeight: FontWeight.w500)),
          Text("230", style: GoogleFonts.rubik(fontSize: 20, fontWeight: FontWeight.w500)),
        ],
      ),
       Text("3", style: GoogleFonts.rubik(fontSize: 15, fontWeight: FontWeight.w500))
    ],
  },
];
