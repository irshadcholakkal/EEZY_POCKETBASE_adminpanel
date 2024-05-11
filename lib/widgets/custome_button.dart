
import 'package:eezy_admin/utils/colors.dart';
import 'package:eezy_admin/utils/variable.dart';
import 'package:eezy_admin/widgets/widgets.dart';
import 'package:flutter/material.dart';

Widget customeButton(
    {String? text,
    
    void Function()? onpressed,
    MaterialStateProperty<Color?>? bgColor}) {
  return SizedBox(
    width: width!* .9,
    height: hight!* .06,
    child: ElevatedButton(
      onPressed: onpressed,
      style: ButtonStyle(
        backgroundColor: bgColor,
        shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
      ),
      child: customeText(text: text, textcolor: white),
    ),
  );
}


  


   
   










