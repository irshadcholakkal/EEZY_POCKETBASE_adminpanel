// ignore_for_file: must_be_immutable

import 'package:eezy_admin/model/getx_controller.dart';
import 'package:eezy_admin/model/services/categories/categories_service.dart';
import 'package:eezy_admin/model/services/product/product_details_model_class.dart';
import 'package:eezy_admin/utils/colors.dart';
import 'package:eezy_admin/utils/texts.dart';
import 'package:eezy_admin/utils/variable.dart';
import 'package:eezy_admin/view/add_product/add_products.dart';
import 'package:eezy_admin/widgets/custom_toggle.dart';
import 'package:eezy_admin/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m_toast/m_toast.dart';

import '../../model/image-picker.dart';
import '../../model/services/api_services.dart';
import '../../model/services/categories/categories_model.dart';
import '../../model/services/product/product_data.dart';
import '../../view-model/custom_multiple_dropdown.dart';
import '../../view-model/custom_textfield.dart';
import '../../view-model/custome_dropdown.dart';
import '../../widgets/custome_button.dart';

final Control controllerr = Get.put(Control());

class AllProducts extends StatelessWidget {
  AllProducts({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    ShowMToast toast = ShowMToast(context);

    hight = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Obx(() {
      return controllerr.addProductButtonBool.value
          ? Container(
              width: width,
              height: hight,
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      allProductsText,
                      InkWell(
                        onTap: () {
                          // getAllCategories();
                          // getAllSizes();
                          //getAllBrands();
                          controllerr.addProductButtonBool.value =
                              !controllerr.addProductButtonBool.value;
                        },
                        child: Container(
                          width: width! * 0.1,
                          height: hight! * 0.04,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: ShapeDecoration(
                            color: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: FittedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Icon(
                                  Icons.add_circle_outline_rounded,
                                  color: white,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: width! * 0.005,
                                ),
                                addProductButton,
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: hight! * 0.02,
                  ),
                  SizedBox(
                    width: width,
                    height: hight! * 0.8,
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4),
                        itemCount: controllerr.productsList.length,
                        itemBuilder: (context, index) {
                          String collectionId =
                              controllerr.productsList[index].collectionId;
                          String productId = controllerr.productsList[index].id;
                          List<String> imageFilename = controllerr
                              .productsList[index].field
                              .cast<String>();

                          String imageUrl =
                              '$imageBaseUrl$collectionId/$productId/';
                          // print("@@@@@@@@@@@@@@@@@@@${controller.productsList[index].imageUrl}@@@@@@@@@@@@@@2");
                          return InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    content: SingleChildScrollView(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: IconButton(
                                              onPressed: () {
                                                Get.back();
                                                controllerr.imageBytes1Update
                                                    .value = null;
                                                controllerr.imageBytes2Update
                                                    .value = null;
                                                controllerr.imageBytes3Update
                                                    .value = null;
                                                controllerr.imageBytes4Update
                                                    .value = null;
                                              },
                                              icon: const Icon(
                                                  Icons.close_rounded)),
                                        ),
                                        EditPage(
                                            collectionid: collectionId,
                                            imagefilename: imageFilename,
                                            baseUrl: imageUrl,
                                            product:
                                                controllerr.productsList[index])
                                      ],
                                    )),
                                  );
                                },
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              color: white,
                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(10),
                              //   color: white,
                              // ),
                              width: width! * 0.02,
                              height: hight! * 0.02,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    child: Image.network(
                                      imageUrl + imageFilename[0],
                                      fit: BoxFit.fill,
                                      height: hight! * 0.25,
                                      width: width,
                                    ),
                                  ),
                                  Center(
                                      child: customeText(
                                          text: controllerr
                                              .productsList[index].name,
                                          textcolor: black)),
                                  Text(
                                      "₹: ${controllerr.productsList[index].price}",
                                      style: GoogleFonts.rubik(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600))
                                ],
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
            )
          : AddProductPage();
    });
  }
}

class EditPage extends StatefulWidget {
  late String collectionid;
  String baseUrl;
  List<String> imagefilename;

  ProductData product;
  EditPage(
      {super.key,
      required this.collectionid,
      required this.imagefilename,
      required this.baseUrl,
      required this.product});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  Categories? categoryToSelect;
  late List<Color> selectedColors;
  Brands? brandToSelect;
  List<SizeSelection>? sizeToSelect;

  @override
  void initState() {
    super.initState();

    sizeToSelect = controllerr.sizes
        .where((size) => size.id == widget.product.size)
        .map((size) {
      return SizeSelection(
        size: size,
        isSelected: false,
      );
    }).toList();

    sizeToSelect = controllerr.sizes.map((size) {
      return SizeSelection(
        size: size,
        isSelected: size.id == widget.product.size,
      );
    }).toList();

    controllerr.isStock.value = widget.product.instock;
    controllerr.offer.value = widget.product.offer;

    productnameUpdate = TextEditingController(text: widget.product.name);
    productpriceUpdate =
        TextEditingController(text: widget.product.price.toString());
    productdescriptionUpdate =
        TextEditingController(text: widget.product.description);
    offerPriceUpdate =
        TextEditingController(text: widget.product.offerprice.toString());
    stockCountUpdate =
        TextEditingController(text: widget.product.stock.toString());

    categoryToSelect = controllerr.dropdownCategoryItems.firstWhere(
      (categoryItem) => categoryItem.id == widget.product.category,
    );
    brandToSelect = controllerr.brands.firstWhere(
      (brandItem) => brandItem.id == widget.product.brand,
    );

    selectedColors = widget.product.color.map((colorStr) {
      String hexColor = '0x$colorStr'; 
      return Color(int.parse(hexColor));
    }).toList();

    List<String> fetchedColorStrings = widget.product.color;
    
    List<Color> fetchedColors = fetchedColorStrings.map((colorStr) {
      return Color(int.parse('0xff$colorStr'));
    }).toList();

    selectedColors = fetchedColors;
   
  }

  // @override
  // void dispose() {
  //   productnameUpdate.dispose();
  //   productpriceUpdate.dispose();
  //   productdescriptionUpdate.dispose();
  //   offerPriceUpdate.dispose();
  //   stockCountUpdate.dispose();
  //   controllerr.isStock.value = false;
  //   controllerr.offer.value = false;
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final Control imageController = Get.put(Control());
    final Control controller1 = Get.put(Control());
    ShowMToast toast = ShowMToast(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (i) {
                Uint8List? imageBytes = getImageByIndex(i, imageController);

                return imageBytes != null
                    ? buildImageContainerUpdate(context, i, imageBytes)
                    : (widget.imagefilename.length > i
                        ? buildImageContainer(context, i)
                        : buildPlaceholderContainer(context, i));
              }),
            ),
          ),
          SizedBox(
              width: width! * 0.55,
              child: customeTextField(
                  labelText: "Product Name", controller: productnameUpdate)),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: width! * 0.55,
            child: Obx(
              () => CustomDropDown(
                items: [
                  ...controller1.dropdownCategoryItems
                      .map((category) => TextValueItem(
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
                                      icon: const Icon(Icons.close_rounded)),
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
                                            if (controller1
                                                    .categoryimage.value !=
                                                null)
                                              Image.memory(
                                                controller1
                                                    .categoryimage.value!,
                                                width: width! * 0.2,
                                                height: hight! * 0.2,
                                                fit: BoxFit.cover,
                                              ),
                                            if (controller1
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
                                        controller1
                                            .addcategorysaveButton.value = true;
                                        for (var dropdownItems in controller1
                                            .dropdownCategoryItems) {
                                          if (dropdownItems.field ==
                                              addCategory.text.trim()) {
                                            print(
                                                "aaaaaa${dropdownItems.field}");

                                            controller1.categoryExists.value =
                                                true;
                                            break;
                                          }
                                        }

                                        if (controller1.categoryExists.value ==
                                            true) {
                                          controller1.addcategorysaveButton
                                              .value = false;
                                          addCategory.clear();
                                          toast.errorToast(
                                              message: "Failed",
                                              alignment: Alignment.bottomLeft);
                                        } else {
                                          await createNewCategory(
                                              addCategory.text, context);
                                          controller1.addcategorysaveButton
                                              .value = false;
                                          addCategory.clear();

                                          controller1.categoryimage.value!
                                              .clear();

                                          Get.back();
                                        }
                                        if (success == true) {
                                          controller1.addcategorysaveButton
                                              .value = false;
                                          addCategory.clear();

                                          controller1.categoryimage.value!
                                              .clear();

                                          Get.back();
                                        } else {
                                          controller1.addcategorysaveButton
                                              .value = false;
                                          addCategory.clear();
                                          controller1.categoryimage.value!
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
                                      child: controller1
                                              .addcategorysaveButton.value
                                          ? const CircularProgressIndicator(
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
                    controller1.selectedCategory.value = value;
                  }
                },
                icon: const Icon(Icons.keyboard_arrow_down_outlined),
                filled: false,
                hintText: categoryToSelect == null
                    ? "Category"
                    : categoryToSelect!.field,
                contentPadding: const EdgeInsets.all(20),
              ),
            ),
          ),
          SizedBox(
              width: width! * 0.55,
              child: customeTextField(
                  labelText: "Product Description",
                  controller: productdescriptionUpdate)),
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
                  Row(children: [
                    Expanded(
                      child: MultipleChoiceBlockPicker(
                          availableColors: selectedColors,
                          pickerColors: [],
                          onColorsChanged: (List<Color> colors) {}),
                    ),
                    Expanded(
                      child: MultipleChoiceBlockPicker(
                        pickerColors: [],
                        onColorsChanged: (List<Color> colors) {
                          setState(() {
                            selectedColors = colors;
                          });
                          print(colors);
                          controller1.selectedColors.assignAll(colors);
                        },
                      ),
                    )
                  ])
                ],
              )),
          SizedBox(
            width: width! * 0.55,
            child: Obx(
              () => CustomDropDown(
                items: [
                  if (controller1.selectedCategory.value == null)
                    TextValueItem(
                        text: brandToSelect == null
                            ? "Select a category"
                            : brandToSelect!.name,
                        value: null),
                  if (controller1.selectedCategory.value != null)
                    ...controller1.brands
                        .where((field) => field.field.any((category) =>
                            category == controller1.selectedCategory.value?.id))
                        .map((name) => TextValueItem(
                              text: name.name.toString(),
                              value: name,
                            )),
                  if (controller1.selectedCategory.value != null)
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
                                      icon: const Icon(Icons.close_rounded)),
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
                                            if (controller1
                                                    .imageBytesBrand.value !=
                                                null)
                                              Image.memory(
                                                controller1
                                                    .imageBytesBrand.value!,
                                                width: width! * 0.2,
                                                height: hight! * 0.2,
                                                fit: BoxFit.cover,
                                              ),
                                            if (controller1
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
                                        controller1.addBrandsaveButton.value =
                                            true;
                                        late bool brandExists = controller1
                                            .brands
                                            .any((brand) => brand.name.contains(
                                                addBrand.text.trim()));

                                        if (brandExists) {
                                          controller1.addBrandsaveButton.value =
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
                                          controller1.imageBytesBrand.value!
                                              .clear();
                                          controller1.addBrandsaveButton.value =
                                              false;
                                          addBrand.clear();
                                          addBrand.dispose();
                                          Get.back();
                                        } else {
                                          controller1.addBrandsaveButton.value =
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
                                      child:
                                          controller1.addBrandsaveButton.value
                                              ? const CircularProgressIndicator(
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
                    controller1.selectedBrand.value = categories;
                  }
                },
                icon: const Icon(Icons.keyboard_arrow_down_outlined),
                filled: false,
                hintText: brandToSelect == null ? "Brand" : brandToSelect!.name,
                //'Brand',
                contentPadding: const EdgeInsets.all(20),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: width! * 0.55,
            child: Obx(() {
              List<TextValue> dropdownItems = [];

              if (controller1.selectedCategory.value == null &&
                  widget.product.size.isEmpty) {
                dropdownItems.add(TextValue(
                    text: 'Select a category',
                    value: null,
                    isSelectable: false));
              } else {
                var filteredSizes = controller1.sizes
                    .where((field) => field.field.any((category) =>
                        category == controller1.selectedCategory.value?.id))
                    .map((size) =>
                        TextValue(text: size.size.toString(), value: size))
                    .toList();

                if (filteredSizes.isNotEmpty) {
                  dropdownItems.addAll(filteredSizes);
                } else {
                  if (widget.product.size.isNotEmpty) {
                    var dropdownItem = sizeToSelect?.where((sizeSelection) {
                          return widget.product.size
                              .contains(sizeSelection.size.id);
                        }).map((sizeSelection) {
                          return TextValue(
                            text: sizeSelection.size.size,
                            value: sizeSelection.size,
                            isSelectable: true,
                          );
                        }).toList() ??
                        [];

                    dropdownItems.addAll(dropdownItem);
                  } else {
                    dropdownItems.add(TextValue(
                        text: 'No Variant available',
                        value: null,
                        isSelectable: false));
                  }
                }
              }

              return CustomMultipleDropDown(
                items: dropdownItems,
                onChanged: (selectedItems) {
                  controller1.selectedSize.value = selectedItems
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
                  labelText: "Product Price", controller: productpriceUpdate)),
          SizedBox(
            // width: width! * 0.55,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "In Stock",
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                CustomSwitch(
                  value: controller1.isStock.value,
                  onChanged: (value) {
                    controller1.isStock.value = value;
                  },
                ),
              ],
            ),
          ),
          SizedBox(
              width: width! * 0.55,
              child: customeTextField(
                labelText: "Stock",
                controller: stockCountUpdate,
              )),
          SizedBox(
            // width: width! * 0.55,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Offer",
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                CustomSwitch(
                  value: controller1.offer.value,
                  onChanged: (value) {
                    controller1.offer.value = value;
                  },
                ),
              ],
            ),
          ),
          SizedBox(
              width: width! * 0.55,
              child: customeTextField(
                labelText: "Offer Price",
                controller: offerPriceUpdate,
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
                        Get.back();
                      },
                      bgColor: const MaterialStatePropertyAll(Colors.black))),
              Obx(
                () => SizedBox(
                    width: width! * 0.2,
                    height: hight! * .06,
                    child: ElevatedButton(
                        onPressed: () async {
                          if (controller1.alreadyExisted.value == false)
                            controller1.addProductButtonBool.value =
                                !controller1.addProductButtonBool.value;
                          controller1.saveButton.value =
                              !controller1.saveButton.value;

                          //  await saveToStore();
                          await updateProductData(context,widget.product.id)
                          .then((value) =>
                              controller1.saveButton.value =
                                  !controller1.saveButton.value);
                          // productdescriptionUpdate.clear();
                          // productnameUpdate.clear();
                          // productpriceUpdate.clear();
                          // offerPriceUpdate.clear();
                          // stockCountUpdate.clear();
                          // brand.clear();
                          // controller1.imageBytes1Update.value = null;
                          // controller1.imageBytes2Update.value = null;
                          // controller1.imageBytes3Update.value = null;
                          // controller1.imageBytes4Update.value = null;

                          // controller1.productsList.refresh();
                               
                          // print("==============sucess====================");
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.black),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40))),
                        ),
                        child: controller1.saveButton.value
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

  Widget buildImageContainer(BuildContext context, int index) {
    // Logic to display each image, or an updated image if available
    return InkWell(
      onTap: () {
        fetchImageUpdate(index);
      },
      child: Container(
          width: width! * 0.2,
          height: hight! * 0.2,
          child: FittedBox(
            child: Image.network(widget.baseUrl + widget.imagefilename[index],
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) =>
                    const Text('Image failed to load'),
                height: hight! * 0.2,
                width: width! * 0.2),
          )),
    );
  }

  Widget buildPlaceholderContainer(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        fetchImageUpdate(index);
      },
      child: Container(
        width: width! * 0.2,
        height: hight! * 0.2,
        child: const Icon(Icons.image),
      ),
    );
  }

  Widget buildImageContainerUpdate(
      BuildContext context, int index, Uint8List imageBytes) {
    final Control imageController = Get.put(Control());

    Uint8List? image;
    switch (index) {
      case 0:
        image = imageController.imageBytes1Update.value;
        break;
      case 1:
        image = imageController.imageBytes2Update.value;
        break;
      case 2:
        image = imageController.imageBytes3Update.value;
        break;
      case 3:
        image = imageController.imageBytes4Update.value;
        break;
      default:
        break;
    }
    return InkWell(
        onTap: () {},
        child: Container(
            width: width! * 0.2,
            height: hight! * 0.2,
            child: FittedBox(
              child: Image.memory(
                image!,
                width: width! * 0.1,
                height: hight! * 0.1,
                // fit: BoxFit.fill,
              ),
            )));
  }

  Uint8List? getImageByIndex(int index, Control imageController) {
    switch (index) {
      case 0:
        return imageController.imageBytes1Update.value;
      case 1:
        return imageController.imageBytes2Update.value;
      case 2:
        return imageController.imageBytes3Update.value;
      case 3:
        return imageController.imageBytes4Update.value;
      default:
        return null; 
    }
  }
}

class SizeSelection {
  Sizes size;
  bool isSelected;

  SizeSelection({required this.size, this.isSelected = false});
}
