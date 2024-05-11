import 'package:eezy_admin/model/services/categories/categories_service.dart';
import 'package:eezy_admin/utils/colors.dart';
import 'package:eezy_admin/utils/variable.dart';
import 'package:eezy_admin/view-model/custom_textfield.dart';
import 'package:eezy_admin/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_toast/m_toast.dart';

import '../model/services/product/product_data.dart';

class CustomMultipleDropDown extends StatefulWidget {
  const CustomMultipleDropDown({
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
  final List? initialValue;
  final Alignment? alignment;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final FocusNode? focusNode;
  final Widget? icon;
  final bool? autofocus;
  final TextStyle? textStyle;
  final List<TextValue> items;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final Widget? suffix;
  final BoxConstraints? suffixConstraints;
  final EdgeInsets? contentPadding;
  final InputBorder? borderDecoration;
  final Color? fillColor;
  final bool filled;
  final FormFieldValidator<List>? validator;
  final void Function(List)? onChanged;

  @override
  _CustomMultipleDropDownState createState() => _CustomMultipleDropDownState();
}

class _CustomMultipleDropDownState extends State<CustomMultipleDropDown> {
  List selectedValues = [];

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      selectedValues = List.from(widget.initialValue!);
    }
  }

  void _showMultiSelectDialog(BuildContext context) {
        ShowMToast toast = ShowMToast(context);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: Text(widget.hintText ?? "Select Items"),
              content: SingleChildScrollView(
                child: Column(children: [
                  ...widget.items.map((item) {
                    return CheckboxListTile(
                      value: selectedValues.contains(item.value),
                      onChanged: (bool? checked) {
                        setDialogState(() {
                          if (checked == true) {
                            if (!selectedValues.contains(item.value)) {
                              selectedValues.add(item.value);
                            }
                          } else {
                            selectedValues.remove(item.value);
                          }
                        });
                        setState(() {});
                      },
                      title: Text(item.text),
                    );
                  }).toList(),
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text('Add New Varinat'),
                    onTap: () {
                      showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          content: Expanded(
                            flex: 10,
                            child: Container(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: Icon(Icons.close_rounded)),
                                ),
                                customeText(
                                    text: "Add New Variant ", textcolor: black),
                                SizedBox(
                                    width: width! * 0.55,
                                    child: customeTextField(
                                        labelText: "Variant",
                                        controller: addsize)),
                                // Obx(
                                //   () =>
                                SizedBox(
                                  width: width! * 0.2,
                                  height: hight! * .06,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      for (var Items in controller.sizes.where(
                                          (field) => field.field.any(
                                              (category) =>
                                                  category ==
                                                  controller.selectedCategory
                                                      .value))) {
                                        if (Items.field ==
                                            addsize.text.trim()) {
                                          print("aaaaaa${Items.field}");

                                          controller.sizeExists.value =
                                              true;
                                          break;
                                        }
                                      }

                                      if (controller.sizeExists.value ==
                                          true) {
                                        //  controller.addcategorysaveButton.toggle();
                                        addsize.clear();
                                        toast.errorToast(
                                            message: "Failed",
                                            alignment: Alignment.bottomLeft);
                                      } else {
                                        bool success = await createNewsize(
                                            addsize.text, context);

                                        if (success) {
                                          // controller.addcategorysaveButton.toggle();
                                          addsize.clear();
                                        } else {
                                          // controller.addcategorysaveButton.toggle();
                                          addsize.clear();
                                        }
                                      }
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.black),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(40)),
                                      ),
                                    ),
                                    child:
                                        //  !controller.addcategorysaveButton.value
                                        //     ? CircularProgressIndicator(
                                        //         color: Colors.white)
                                        const Text('Save',
                                            style:
                                                TextStyle(color: Colors.white)),
                                  ),
                                  // ),
                                )
                              ],
                            )),
                          ),
                        );
                      },
                    );
                      // Navigator.of(context).pop();

                      print('Add new item action');
                    },
                  ),
                ]),
              ),
              actions: [
                TextButton(
                  child: Text("Done"),
                  onPressed: () {
                     Get.back();
                    if (widget.onChanged != null) {
                      widget.onChanged!(selectedValues);
                    }
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showMultiSelectDialog(context),
      child: Container(
        width: widget.width ?? double.infinity,
        margin: widget.margin,
        padding: widget.contentPadding ??
            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: widget.fillColor ?? Colors.transparent,
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                selectedValues.isNotEmpty
                    ? selectedValues
                        .map((e) => widget.items
                            .firstWhere((item) => item.value == e,
                                orElse: () => TextValue(
                                    text: "", value: null, isSelectable: false))
                            .text)
                        .join(", ")
                    : widget.hintText ?? "Select items",
                style: widget.textStyle,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Icon(Icons.keyboard_arrow_down_outlined, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

class TextValue<T> {
  final String text;
  final T value;
  final bool isSelectable;

  TextValue({
    required this.text,
    required this.value,
    this.isSelectable = true,
  });
}
