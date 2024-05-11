import 'package:eezy_admin/utils/colors.dart';
import 'package:eezy_admin/utils/variable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/getwidget.dart';


Widget brandName(size, colour, weight) {
  return FittedBox(
    fit: BoxFit.scaleDown,
    child: Text("EEZY",
        style: GoogleFonts.josefinSans(
            fontSize: size, fontWeight: weight, color: colour)),
  );
}
Widget adminpaneltext(size, colour, weight){
  return 
  Text("Admin-Panel",
      style: GoogleFonts.josefinSans(
          fontSize: size, fontWeight: weight, color: colour));
}

Widget customeText({String? text, Color? textcolor}) {
  return Text(
    
    "$text",
    overflow: TextOverflow.ellipsis,
    style: GoogleFonts.poppins(
        color: textcolor,
        fontWeight: FontWeight.w600,
        fontSize: 20,
        letterSpacing: 1),
  );
}


