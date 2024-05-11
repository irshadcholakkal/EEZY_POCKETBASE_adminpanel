import 'package:eezy_admin/model/services/product/product_data.dart';
import 'package:eezy_admin/model/services/product/product_details_model_class.dart';
import 'package:eezy_admin/model/user/get_user_data_model_class.dart';
import 'package:flutter/material.dart';
double?hight;
double?width;
bool isPasswordHide = true;
// int  selectedHomePageIndex = 0;
TextEditingController stockCount =TextEditingController();
TextEditingController brand =TextEditingController();

TextEditingController offerPrice =TextEditingController();
TextEditingController productprice =TextEditingController();
TextEditingController productname =TextEditingController();
TextEditingController productdescription =TextEditingController();
TextEditingController addCategory =TextEditingController();
TextEditingController addBrand =TextEditingController();
TextEditingController addsize =TextEditingController();



ProductData productdata = controller.productdata.value!;
//UsersData userData = controller.usersData.value!;


TextEditingController stockCountUpdate =TextEditingController();
TextEditingController brandUpdate =TextEditingController();
TextEditingController offerPriceUpdate =TextEditingController();
TextEditingController productpriceUpdate =TextEditingController();
TextEditingController productnameUpdate =TextEditingController();
TextEditingController productdescriptionUpdate =TextEditingController();
TextEditingController addCategoryUpdate =TextEditingController();
TextEditingController addBrandUpdate =TextEditingController();
TextEditingController addsizeUpdate =TextEditingController();