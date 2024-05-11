import 'dart:typed_data';
import 'package:eezy_admin/model/services/api_services.dart';
import 'package:eezy_admin/model/services/product/product_details_model_class.dart';
import 'package:eezy_admin/utils/variable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:eezy_admin/model/services/authentication_services.dart';
import 'package:eezy_admin/model/getx_controller.dart';
import 'package:get/get.dart';
import 'package:m_toast/m_toast.dart';

final Control controller = Get.put(Control());

Future<void> storeProductrData(BuildContext context) async {
  ShowMToast toast = ShowMToast(context);

  try {
    if (authData != null) {
      String productName = productname.text;
      String productDescription = productdescription.text;
      String offerprice = offerPrice.text;
      String stock = stockCount.text;
      int productPrice = int.parse(productprice.text);
      final List<String> colorHexList = controller.selectedColors
          .map((color) => color.value.toRadixString(16))
          .toList();

      final imageFiles = [
        controller.imageBytes1.value,
        controller.imageBytes2.value,
        controller.imageBytes3.value,
        controller.imageBytes4.value,
      ];

      List<http.MultipartFile> files =
          await parseMessagesToMultipart(imageFiles);

      if (files.isNotEmpty) {
        final body = {
          "name": productName,
          "brand": controller.selectedBrand.value?.id,
          "offer": controller.offer.value,
          "offerprice": offerprice,
          "instock": controller.isStock.value,
          "price": productPrice,
          "category": controller.selectedCategory.value?.id,
          "color": colorHexList,
          "description": productDescription,
          "size": controller.selectedSize.map((size) => size.id).toList(),
          "stock": stock
        };

        print('Product data: $body');
        print('Files: $files');
        print('colors: $colorHexList');

        final record =
            await pb.collection('Products').create(body: body, files: files);
        print('New Products record created with ID: ${record.id}');
        toast.successToast(message: "Success", alignment: Alignment.bottomLeft);
      } else {
        print('No images picked.');
        toast.errorToast(message: "Failed", alignment: Alignment.bottomLeft);
      }
    } else {
      print('User is not signed in.');
      toast.errorToast(message: "Failed", alignment: Alignment.bottomLeft);
    }
  } catch (error) {
    print('Error storing product data: $error');
    toast.errorToast(message: "Failed", alignment: Alignment.bottomLeft);
  }
}

Future<List<http.MultipartFile>> parseMessagesToMultipart(
    List<Uint8List?> imageFiles) async {
  List<http.MultipartFile> multipartFiles = [];

  for (int i = 0; i < imageFiles.length; i++) {
    Uint8List? imageFile = imageFiles[i];
    if (imageFile != null) {
      http.MultipartFile multipart = http.MultipartFile.fromBytes(
        'field',
        imageFile,
        filename: 'image_$i.jpg', 
      );
      multipartFiles.add(multipart);
    }
  }

  return multipartFiles;
}

Future<void> getProductData() async {
    try {
      final response = await pb.collection('Products').getFullList();
      controller.productsList.value = response
          .map<ProductData>((record) => ProductData.fromJson(record.toJson()))
          .toList();
         print("product fetched ");
    } catch (error) {
      print('Error retrieving user data: $error');
    }
 
}





Future<void> updateProductData(BuildContext context, String productId) async {
  ShowMToast toast = ShowMToast(context);

  try {
      if (authData != null) { // Ensure authData is declared and valid
        Map<String, dynamic> body = {};

        String productName = productnameUpdate.text;
        String productDescription = productdescriptionUpdate.text;
        String offerprice = offerPriceUpdate.text;
        String stock = stockCountUpdate.text;
        int productPrice = int.parse(productpriceUpdate.text);

        if (productName.isNotEmpty) body["name"] = productName;
        if (productDescription.isNotEmpty) body["description"] = productDescription;
        if (offerprice.isNotEmpty) body["offerprice"] = offerprice;
        if (stock.isNotEmpty) body["stock"] = stock;
        body["price"] = productPrice;

        // Conditional additions based on null checks and list non-emptiness
        if (controller.selectedBrand.value?.id != null) body["brand"] = controller.selectedBrand.value?.id;
        if (controller.isStock.value != null) body["instock"] = controller.isStock.value;
        if (controller.offer.value != null) body["offer"] = controller.offer.value;

        if (controller.selectedCategory.value?.id != null) body["category"] = controller.selectedCategory.value?.id;

        final List<String> colorHexList = controller.selectedColors.map((color) => color.value.toRadixString(16)).toList();
        if (colorHexList.isNotEmpty) body["color"] = colorHexList;

        final List<String> sizeIds = controller.selectedSize.map((size) => size.id).toList();
        if (sizeIds.isNotEmpty) body["size"] = sizeIds;

        // Prepare image files for upload
        final imageFiles = [
          controller.imageBytes1Update.value,
          controller.imageBytes2Update.value,
          controller.imageBytes3Update.value,
          controller.imageBytes4Update.value,
        ];
        List<http.MultipartFile> files = await parseMessagesToMultipart(imageFiles);

        // Only proceed with the update if there's something to update
        if (body.isNotEmpty || files.isNotEmpty) {
          final record = await pb.collection('Products').update(productId, body: body, files: files);
          print('Product record updated with ID: ${record.id}');
          toast.successToast(message: "Success", alignment: Alignment.bottomLeft);
        } else {
          print('No changes detected, update not performed.');
          // Optionally notify the user that no changes were detected
        }
      } else {
        print('User is not signed in.');
        toast.errorToast(message: "Failed", alignment: Alignment.bottomLeft);
      }
    } catch (error) {
      print('Error updating product data: $error');
      toast.errorToast(message: "Failed", alignment: Alignment.bottomLeft);
    }
}


// Function to retrieve all product data from Firestore
//Future<void> retrieveAllProductData() async {
//   // Check if the user is signed in
//   User? user = FirebaseAuth.instance.currentUser;
//   if (user != null) {
//     // Get a reference to the Firestore database
//     FirebaseFirestore firestore = FirebaseFirestore.instance;

//     // Create a reference to the collection containing all products
//     CollectionReference productsCollection = firestore
//         .collection('Admin-User')
//         .doc("Admin_Panel")
//         .collection("user")
//         .doc(user.displayName)
//         .collection("Products");

//      try {
//     QuerySnapshot productsSnapshot = await productsCollection.get();

//     if (productsSnapshot.size > 0) {
//       controller.productsList.assignAll(productsSnapshot.docs.map(
//         (doc) => ProductData(
//           productName: doc['ProductName'],
//           productDescription: doc['ProductDescription'],
//           productPrice: doc['ProductPrice'],
//           imageUrl:doc['ProductImageUrl'],
//           productId:doc ['ProductId']
//         ),
//       ).toList());
//     } else {
//       print('No products found in the collection.');
//     }
//   } catch (error) {
//     print('Error retrieving product data: $error');
//   }

//   } else {
//     print('User is not signed in.');
//   }
// }

//    import 'package:eezy_admin/model/getx_controller.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';

// final Control controller = Get.put(Control()
