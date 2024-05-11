

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    Key? key,
    this.name,
    this.initialValue,
    this.alignment,
    this.width,
    this.margin,
    this.focusNode,
    this.icon,
    this.autofocus,
    this.textStyle,
    required this.items,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  final String? name;

  final dynamic initialValue;

  final Alignment? alignment;

  final double? width;

  final EdgeInsetsGeometry? margin;

  final FocusNode? focusNode;

  final Widget? icon;

  final bool? autofocus;

  final TextStyle? textStyle;

  final List<TextValueItem> items;

  final String? hintText;

  final TextStyle? hintStyle;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;

  final EdgeInsets? contentPadding;

  final InputBorder? borderDecoration;

  final Color? fillColor;

  final bool? filled;

  final FormFieldValidator<dynamic>? validator;

  final void Function(dynamic)? onChanged;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: dropDownWidget,
          )
        : dropDownWidget;
  }

  Widget get dropDownWidget => Container(
        width: width ?? double.maxFinite,
        margin: margin,
        child: FormBuilderDropdown(
          name: name ??
              "form_dropdown_field_${DateTime.now().microsecondsSinceEpoch}",
          initialValue: initialValue,
          focusNode: focusNode ?? FocusNode(),
          icon: icon,
          autofocus: autofocus ?? false,
          style: textStyle,
          items: items.map<DropdownMenuItem>((item) {
            return DropdownMenuItem(
              value: item.value,
              child: Text(
                item.text,
                overflow: TextOverflow.ellipsis,
                style: hintStyle,
              ),
            );
          }).toList(),
          decoration: decoration,
          validator: validator,
          onChanged: onChanged,
        ),
      );

  InputDecoration get decoration => InputDecoration(
        hintText: hintText ?? "",
        hintStyle: hintStyle,
        prefixIcon: prefix,
        prefixIconConstraints: prefixConstraints,
        suffixIcon: suffix,
        suffixIconConstraints: suffixConstraints,
        isDense: true,
        contentPadding: contentPadding ??
            const EdgeInsets.only(
              left: 10,
              top:10,
              bottom:
                 10,
            ),
        fillColor: fillColor,
        filled: filled,
        border: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                10,
              ),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(
               10
              ),
              borderSide: const BorderSide(
                color:Colors.grey,
                width: 1,
              ),
            ),
        focusedBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(
10              ),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
      );
}

class TextValueItem<T> {
  final String text;
  final T value;

  TextValueItem({
    required this.text,
    required this.value,
  });
}








