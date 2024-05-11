
import 'package:eezy_admin/model/getx_controller.dart';
import 'package:eezy_admin/model/image-picker.dart';
import 'package:eezy_admin/model/services/categories/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:m_toast/m_toast.dart';

import '../api_services.dart';

Future getAllCategories() async {
  final Control controller = Get.put(Control());

  try {
    final response = await pb.collection('categories').getFullList();
    controller.dropdownCategoryItems.value = response
        .map<Categories>((record) => Categories.fromJson(record.toJson()))
        .toList();
  } catch (e) {
    print('Error fetching Category data: $e');
  }
}

Future getAllSizes() async {
  final Control controller = Get.put(Control());

  try {
    final response = await pb.collection('size').getFullList();
    controller.sizes.value = response
        .map<Sizes>((record) => Sizes.fromJson(record.toJson()))
        .toList();

    print(response);
  } catch (e) {
    print('Error fetching Size data: $e');
  }
}

Future getAllBrands() async {
  final Control controller = Get.put(Control());

  try {
    final response = await pb.collection('brands').getFullList();
    controller.brands.value = response
        .map<Brands>((record) => Brands.fromJson(record.toJson()))
        .toList();

    print(response);
  } catch (e) {
    print('Error fetching Size data: $e');
  }
}


Future createNewCategory(String category,BuildContext context) async {
    ShowMToast toast = ShowMToast(context);

  try {
 http.MultipartFile file = await parseMessageToMultipart(controller.categoryimage.value);





if(file !=null){

   final body = <String, dynamic>{
  "field": category
};



    
   
    
    
final record = await pb.collection('categories').create(body: body,files: [file]).then((value) =>getAllCategories() );
toast.successToast(message: "Success", alignment: Alignment.bottomLeft);
} 
    
  } catch (e) {
     toast.errorToast(message: "Failed", alignment: Alignment.bottomLeft);
    print("An expected error occurred: $e");
  }
}


Future createNewBrand(String name,BuildContext context) async {
    ShowMToast toast = ShowMToast(context);

  try {
    http.MultipartFile file = await parseMessageToMultipart(controller.imageBytesBrand.value);
   final body = <String, dynamic>{
  "field": [
    controller.selectedCategory.value?.id
  ],
  "brand_name": name
};
    
    
final record = await pb.collection('brands').create(body: body,files: [file]).then((value) =>getAllBrands() );
toast.successToast(message: "Success", alignment: Alignment.bottomLeft);
   
    
  } catch (e) {
     toast.errorToast(message: "Failed", alignment: Alignment.bottomLeft);
    print("An expected error occurred: $e");
  }
}


Future createNewsize(String name,BuildContext context) async {
    ShowMToast toast = ShowMToast(context);

  try {
   final body = <String, dynamic>{
  "SIZES": name,
  "field": [
        controller.selectedCategory.value?.id

  ]
};
    
    
final record = await pb.collection('size').create(body: body).then((value) =>getAllSizes() );
toast.successToast(message: "Success", alignment: Alignment.bottomLeft);
   
    
  } catch (e) {
     toast.errorToast(message: "Failed", alignment: Alignment.bottomLeft);
    print("An expected error occurred: $e");
  }
}


Future <http.MultipartFile> parseMessageToMultipart(Uint8List? imageFile) async {
  if (imageFile != null) {
    http.MultipartFile multipartFile = http.MultipartFile.fromBytes(
      'image', 
      imageFile,
      filename: 'image.jpg', 
    );
    return multipartFile;
  } else {
    throw Exception('No image file provided');
  }
}