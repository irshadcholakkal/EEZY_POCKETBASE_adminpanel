import 'dart:io';

import 'package:eezy_admin/model/services/api_services.dart';
import 'package:eezy_admin/model/services/categories/categories_model.dart';
import 'package:eezy_admin/model/services/product/product_details_model_class.dart';
import 'package:eezy_admin/model/user/get_user_data_model_class.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'services/product/product_data.dart';

class Control extends GetxController {
  @override
  void onInit() async {
    super.onInit(); 
    
    try {
      
      final userToken = pb.authStore.isValid;
      if (userToken) {
        // await getProductData();
        // await getAllBrands();
        // await getAllCategories();
        

        print("--------------------Fetched------------------------------------");
      } else {
    
        print("No user token found. Please log in.");
      }
    } catch (error) {
      
      print("An error occurred during initialization: $error");
      
    }
  

    //  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    //     if (user == null) {
    //       Get.offAll(() => const LandingPage());
    //     } else {
    //       getUserData();
    //       // productdata();
    //      // retrieveAllProductData();
    //     //if (user.providerData.any((userInfo) => userInfo.providerId == 'google.com')) {
    //       Get.offAll(() => WebLayout());
    //   //  }
    //     }
    //   },

    //   );

    // if (user.isValid ) {
    //   // If user is not authenticated, navigate to LandingPage
    //   Get.offAll(() => WebLayout());
    // } else {
    //   // If user is authenticated, fetch user data and navigate to appropriate screen
    // //  getUserData();
    //   Get.offAll(() => const LandingPage());/
    //}
  }

  Rx<File?> imageFile = Rx<File?>(null);
  Rx<Uint8List?> imageBytes1 = Rx<Uint8List?>(null);
  Rx<Uint8List?> imageBytes2 = Rx<Uint8List?>(null);
  Rx<Uint8List?> imageBytes3 = Rx<Uint8List?>(null);
  Rx<Uint8List?> imageBytes4 = Rx<Uint8List?>(null);
  Rx<Uint8List?> imageBytesBrand = Rx<Uint8List?>(null);
  Rx<Uint8List?> categoryimage = Rx<Uint8List?>(null);
  Rx<Uint8List?> imageBytes1Update = Rx<Uint8List?>(null);
  Rx<Uint8List?> imageBytes2Update = Rx<Uint8List?>(null);
  Rx<Uint8List?> imageBytes3Update = Rx<Uint8List?>(null);
  Rx<Uint8List?> imageBytes4Update = Rx<Uint8List?>(null);

  RxList<ProductData> productsList = RxList<ProductData>([]);
  RxList<UsersData?> usersData = RxList<UsersData?>([]);
  Rx<ProductData?> productdata = Rx<ProductData?>(null);

  RxInt selectedHomePageIndex = 0.obs;
  RxInt index = 0.obs;
  RxBool addProductButtonBool = true.obs;
  RxBool alreadyExisted = true.obs;
  RxString imgUrl = "".obs;
  RxBool saveButton = true.obs;
  RxBool addcategorysaveButton = false.obs;
  RxBool addBrandsaveButton = false.obs;

  RxBool categoryExists = false.obs;
  RxBool brandExists = false.obs;
  RxBool sizeExists = false.obs;

  RxList<Categories> categories = <Categories>[].obs;
  Rx<Categories?> selectedCategory = Rx<Categories?>(null);
  RxList<Categories> dropdownCategoryItems = <Categories>[].obs;
  RxList<Sizes> sizes = <Sizes>[].obs;
  RxList<Sizes> selectedSize = <Sizes>[].obs;
  RxList<Brands> brands = <Brands>[].obs;
  Rx<Brands?> selectedBrand = Rx<Brands?>(null);

  RxList<Color> selectedColors = <Color>[].obs;
  RxBool isStock = true.obs;
  RxBool offer = true.obs;

}
