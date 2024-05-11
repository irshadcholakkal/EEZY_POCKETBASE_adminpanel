import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customeTextField({
  TextEditingController? controller,
  String? labelText,
  Widget? icon,
  bool? obsecure,
  String? Function(String?)? validator,
  void Function(String)? onSubmitted, 
}) {

  return TextFormField(
    controller: controller,
    validator: validator,
    onFieldSubmitted: onSubmitted,
    obscureText: obsecure ?? false,
    decoration: InputDecoration(
      enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(width: .2)),
      focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(width: .2)),
      labelText: labelText,
      labelStyle: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
      suffixIcon: icon,
    ),
  );
}
