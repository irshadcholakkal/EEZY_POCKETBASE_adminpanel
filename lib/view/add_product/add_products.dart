import 'package:eezy_admin/model/image-picker.dart';
import 'package:eezy_admin/model/services/categories/categories_service.dart';
import 'package:eezy_admin/model/services/categories/categories_model.dart';
import 'package:eezy_admin/model/services/product/product_data.dart';
import 'package:eezy_admin/utils/colors.dart';
import 'package:eezy_admin/utils/variable.dart';
import 'package:eezy_admin/view-model/custom_multiple_dropdown.dart';
import 'package:eezy_admin/view-model/custom_textfield.dart';
import 'package:eezy_admin/widgets/custom_toggle.dart';
import 'package:eezy_admin/widgets/custome_button.dart';
import 'package:eezy_admin/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m_toast/m_toast.dart';

import '../../model/getx_controller.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../../view-model/custome_dropdown.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class AddProductPage extends StatelessWidget {
  
  AddProductPage({super.key});

  final Control controller = Get.put(Control());

  @override
  Widget build(BuildContext context) {
    ShowMToast toast = ShowMToast(context);
    
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: width! * 0.01,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      //image 1
                      fetchImage(1);
                    },
                    child: Obx(
                      () => Container(
                          width: width! * 0.3,
                          height: hight! * 0.3,
                          color: black,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (controller.imageBytes1.value != null)
                                Image.memory(
                                  controller.imageBytes1.value!,
                                  width: width! * 0.3,
                                  height: hight! * 0.3,
                                  // fit: BoxFit.fill,
                                ),
                              if (controller.imageBytes1.value == null)
                                Center(
                                    child: Text("Add Image",
                                        style: GoogleFonts.rubik(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: white)))
                            ],
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: width! * 0.01,
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      //image 2

                      fetchImage(2);
                    },
                    child: Obx(
                      () => Container(
                          width: width! * 0.1,
                          height: hight! * 0.1,
                          color: black,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (controller.imageBytes2.value != null)
                                Image.memory(
                                  controller.imageBytes2.value!,
                                  width: width! * 0.1,
                                  height: hight! * 0.1,
                                  // fit: BoxFit.fill,
                                ),
                              if (controller.imageBytes2.value == null)
                                Center(
                                    child: Text("Add Image",
                                        style: GoogleFonts.rubik(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: white)))
                            ],
                          )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      //image 3

                      fetchImage(3);
                    },
                    child: Obx(
                      () => Container(
                          width: width! * 0.1,
                          height: hight! * 0.1,
                          color: black,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (controller.imageBytes3.value != null)
                                Image.memory(
                                  controller.imageBytes3.value!,
                                  width: width! * 0.1,
                                  height: hight! * 0.1,
                                  // fit: BoxFit.fill,
                                ),
                              if (controller.imageBytes3.value == null)
                                Center(
                                    child: Text("Add Image",
                                        style: GoogleFonts.rubik(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: white)))
                            ],
                          )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      //image 4

                      fetchImage(4);
                    },
                    child: Obx(
                      () => Container(
                          width: width! * 0.1,
                          height: hight! * 0.1,
                          color: black,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (controller.imageBytes4.value != null)
                                Image.memory(
                                  controller.imageBytes4.value!,
                                  width: width! * 0.1,
                                  height: hight! * 0.1,
                                  // fit: BoxFit.fill,
                                ),
                              if (controller.imageBytes4.value == null)
                                Center(
                                    child: Text("Add Image",
                                        style: GoogleFonts.rubik(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: white)))
                            ],
                          )),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
              width: width! * 0.55,
              child: customeTextField(
                  labelText: "Product Name", controller: productname)),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: width! * 0.55,
            child: Obx(
              () => CustomDropDown(
                items: [
                  ...controller.dropdownCategoryItems.map((category) => TextValueItem(
                        text: category.field.toString(),
                        value: category,
                      )),
                  TextValueItem(text: ' + Add New Category', value: 'add'),
                ],
                onChanged: (value) {
                  if (value == 'add') {
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
                                    text: "Add New Category ",
                                    textcolor: black),
                                InkWell(
                                  onTap: () {
                                    fetchCategoryImage();
                                  },
                                  child: Obx(
                                    () => Container(
                                        width: width! * 0.2,
                                        height: hight! * 0.2,
                                        color: black,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            if (controller
                                                    .categoryimage.value !=
                                                null)
                                              Image.memory(
                                                controller.categoryimage.value!,
                                                width: width! * 0.2,
                                                height: hight! * 0.2,
                                                fit: BoxFit.cover,
                                              ),
                                            if (controller
                                                    .categoryimage.value ==
                                                null)
                                              Center(
                                                  child: Text("Add Image",
                                                      style: GoogleFonts.rubik(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: white)))
                                          ],
                                        )),
                                  ),
                                ),
                                SizedBox(
                                    width: width! * 0.55,
                                    child: customeTextField(
                                        labelText: "Category Name",
                                        controller: addCategory)),
                                Obx(
                                  () => SizedBox(
                                    width: width! * 0.2,
                                    height: hight! * .06,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        bool? success;
                                        controller.addcategorysaveButton.value =
                                            true;
                                        for (var dropdownItems
                                            in controller.dropdownCategoryItems) {
                                          if (dropdownItems.field ==
                                              addCategory.text.trim()) {
                                            print(
                                                "aaaaaa${dropdownItems.field}");

                                            controller.categoryExists.value =
                                                true;
                                            break;
                                          }
                                        }

                                        if (controller.categoryExists.value ==
                                            true) {
                                          controller.addcategorysaveButton
                                              .value = false;
                                          addCategory.clear();
                                          toast.errorToast(
                                              message: "Failed",
                                              alignment: Alignment.bottomLeft);
                                        } else {
                                          await createNewCategory(
                                              addCategory.text, context);
                                          controller.addcategorysaveButton
                                              .value = false;
                                          addCategory.clear();

                                          controller.categoryimage.value!
                                              .clear();

                                          Get.back();
                                        }
                                        if (success == true) {
                                          controller.addcategorysaveButton
                                              .value = false;
                                          addCategory.clear();

                                          controller.categoryimage.value!
                                              .clear();

                                          Get.back();
                                        } else {
                                          controller.addcategorysaveButton
                                              .value = false;
                                          addCategory.clear();
                                          controller.categoryimage.value!
                                              .clear();
                                          Get.back();
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
                                          controller.addcategorysaveButton.value
                                              ? CircularProgressIndicator(
                                                  color: Colors.white)
                                              : const Text('Save',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                    ),
                                  ),
                                )
                              ],
                            )),
                          ),
                        );
                      },
                    );
                  } else {
                    controller.selectedCategory.value = value;
                  }
                },
                icon: const Icon(Icons.keyboard_arrow_down_outlined),
                filled: false,
                hintText: 'Category',
                contentPadding: const EdgeInsets.all(20),
              ),
            ),
          ),
          SizedBox(
              width: width! * 0.55,
              child: customeTextField(
                  labelText: "Product Description",
                  controller: productdescription)),
          SizedBox(
              width: width! * 0.55,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Colors",
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  MultipleChoiceBlockPicker(
                    pickerColors: [],
                    onColorsChanged: (List<Color> colors) {
                      print(colors);
                      controller.selectedColors.assignAll(colors);
                    },
                  ),
                ],
              )),
          SizedBox(
            width: width! * 0.55,
            child: Obx(
              () => CustomDropDown(
                items: [
                  if (controller.selectedCategory.value == null)
                    TextValueItem(text: 'Select a category', value: null),
                  if (controller.selectedCategory.value != null)
                    ...controller.brands
                        .where((field) => field.field.any((category) =>
                            category == controller.selectedCategory.value?.id))
                        .map((name) => TextValueItem(
                              text: name.name.toString(),
                              value: name,
                            )),
                  if (controller.selectedCategory.value != null)
                    TextValueItem(text: ' + Add New Brand', value: 'add'),
                ],
                onChanged: (categories) {
                  if (categories == 'add') {
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
                                    text: "Add New Brand ", textcolor: black),
                                InkWell(
                                  onTap: () {
                                    fetchBrandImage();
                                  },
                                  child: Obx(
                                    () => Container(
                                        width: width! * 0.2,
                                        height: hight! * 0.2,
                                        color: black,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            if (controller
                                                    .imageBytesBrand.value !=
                                                null)
                                              Image.memory(
                                                controller
                                                    .imageBytesBrand.value!,
                                                width: width! * 0.2,
                                                height: hight! * 0.2,
                                                fit: BoxFit.cover,
                                              ),
                                            if (controller
                                                    .imageBytesBrand.value ==
                                                null)
                                              Center(
                                                  child: Text("Add Image",
                                                      style: GoogleFonts.rubik(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: white)))
                                          ],
                                        )),
                                  ),
                                ),
                                SizedBox(
                                    width: width! * 0.55,
                                    child: customeTextField(
                                        labelText: "Brand Name",
                                        controller: addBrand)),
                                Obx(
                                  () => SizedBox(
                                    width: width! * 0.2,
                                    height: hight! * .06,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        bool? success;
                                        controller.addBrandsaveButton.value =
                                            true;
                                        late bool brandExists = controller
                                            .brands
                                            .any((brand) => brand.name.contains(
                                                addBrand.text.trim()));

                                        if (brandExists) {
                                          controller.addBrandsaveButton.value =
                                              false;
                                          addBrand.clear();
                                          toast.errorToast(
                                              message: "Failed",
                                              alignment: Alignment.bottomLeft);
                                        } else {
                                          success = await createNewBrand(
                                              addBrand.text, context);
                                        }
                                        if (success == true) {
                                          controller.imageBytesBrand.value!
                                              .clear();
                                          controller.addBrandsaveButton.value =
                                              false;
                                          addBrand.clear();
                                          addBrand.dispose();
                                          Get.back();
                                        } else {
                                          controller.addBrandsaveButton.value =
                                              false;
                                          addBrand.clear();
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
                                      child: controller.addBrandsaveButton.value
                                          ? CircularProgressIndicator(
                                              color: Colors.white)
                                          : const Text('Save',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                    ),
                                  ),
                                )
                              ],
                            )),
                          ),
                        );
                      },
                    );
                  } else {
                    controller.selectedBrand.value = categories;
                  }
                },
                icon: const Icon(Icons.keyboard_arrow_down_outlined),
                filled: false,
                hintText: 'Brand',
                contentPadding: const EdgeInsets.all(20),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: width! * 0.55,
            child: Obx(() {
              List<TextValue> dropdownItems = [];

              if (controller.selectedCategory.value == null) {
                dropdownItems.add(TextValue(
                    text: 'Select a category',
                    value: null,
                    isSelectable: false));
              } else {
                var filteredSizes = controller.sizes
                    .where((field) => field.field.any((category) =>
                        category == controller.selectedCategory.value?.id))
                    .map((size) =>
                        TextValue(text: size.size.toString(), value: size))
                    .toList();

                if (filteredSizes.isNotEmpty) {
                  dropdownItems.addAll(filteredSizes);
                } else {
                  dropdownItems.add(TextValue(
                      text: 'No Variant available',
                      value: null,
                      isSelectable: false));
                }
              }

              return CustomMultipleDropDown(
                items: dropdownItems,
                onChanged: (selectedItems) {
                  controller.selectedSize.value = selectedItems
                      .where((item) => item is Sizes)
                      .cast<Sizes>()
                      .toList();
                },
                icon: const Icon(Icons.keyboard_arrow_down_outlined),
                filled: false,
                hintText: 'Variant',
                contentPadding: const EdgeInsets.all(20),
              );
            }),
          ),
          SizedBox(
              width: width! * 0.55,
              child: customeTextField(
                  labelText: "Product Price", controller: productprice)),
          SizedBox(
            // width: width! * 0.55,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "# In Stock",
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                CustomSwitch(
                  value: controller.isStock.value,
                  onChanged: (value) {
                    controller.isStock.value = value;
                  },
                ),
              ],
            ),
          ),
          SizedBox(
              width: width! * 0.55,
              child: customeTextField(
                labelText: "Stock",
                controller: stockCount,
              )),
          SizedBox(
            // width: width! * 0.55,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "# Offer",
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                CustomSwitch(
                  value: controller.offer.value,
                  onChanged: (value) {
                    controller.offer.value = value;
                  },
                ),
              ],
            ),
          ),
          SizedBox(
              width: width! * 0.55,
              child: customeTextField(
                labelText: "Offer Price",
                controller: offerPrice,
              )),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  width: width! * 0.2,
                  child: customeButton(
                      text: "cancel",
                      onpressed: () {
                        controller.addProductButtonBool.value =
                            !controller.addProductButtonBool.value;
                      },
                      bgColor: const MaterialStatePropertyAll(Colors.black))),
              Obx(
                () => SizedBox(
                    width: width! * 0.2,
                    height: hight! * .06,
                    child: ElevatedButton(
                        onPressed: () async {
                          if (controller.alreadyExisted.value == false)
                            controller.addProductButtonBool.value =
                                !controller.addProductButtonBool.value;
                          controller.saveButton.value =
                              !controller.saveButton.value;

                          //  await saveToStore();
                          await storeProductrData(context).then((value) =>
                              controller.saveButton.value =
                                  !controller.saveButton.value);
                          productdescription.clear();
                          productname.clear();
                          productprice.clear();
                          offerPrice.clear();
                          stockCount.clear();
                          brand.clear();
                          controller.imageBytes1.value = null;
                          controller.imageBytes2.value = null;
                          controller.imageBytes3.value = null;
                          controller.imageBytes4.value = null;

                          controller.productsList.refresh();

                          print("==============sucess====================");
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.black),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40))),
                        ),
                        child: controller.saveButton.value
                            ? customeText(text: "Save", textcolor: white)
                            : const CircularProgressIndicator(
                                color: white,
                                strokeCap: StrokeCap.round,
                              ))),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
