import 'package:eezy_admin/model/services/authentication_services.dart';
import 'package:eezy_admin/utils/colors.dart';
import 'package:eezy_admin/utils/variable.dart';
import 'package:eezy_admin/view-model/dashbord_items.dart';
import 'package:eezy_admin/view/add_product/add_products.dart';
import 'package:eezy_admin/view/dashbord/all_products.dart';
import 'package:eezy_admin/view/dashbord/dashboard.dart';
import 'package:eezy_admin/view/dashbord/users_data.dart';
import 'package:eezy_admin/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/getx_controller.dart';

class WebLayout extends StatelessWidget {
  // final Widget body;

  WebLayout({super.key});

  final Control controller = Get.put(Control());

  @override
  Widget build(BuildContext context) {
    hight = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: brandName(35.0, black, FontWeight.w600),
        elevation: 1,
        actions: [
          IconButton(onPressed: () {
            fetchAllData();
          }, icon: const Icon(Icons.refresh_rounded)),
          //IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_rounded)),
          // Obx(() {
          //   if (controller.userData.value != null) {
          //     return CircleAvatar(
          //       backgroundImage: NetworkImage(),
          //     );
          //   } else {
          //     return CircularProgressIndicator();
          //   }
          // }),
        ],
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                    itemCount: dashBoardItem.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AspectRatio(
                          aspectRatio: 3,
                          child: InkWell(
                            onTap: () {
                              controller.selectedHomePageIndex.value = index;
                            },
                            child: Obx(
                              () => Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: controller.selectedHomePageIndex
                                                  .value ==
                                              index
                                          ? Colors.blueGrey.withOpacity(0.7)
                                          : Colors.grey.shade200),
                                  width: width,
                                  height: hight! * 0.06,
                                  child: FittedBox(
                                    alignment: Alignment.centerLeft,
                                    fit: BoxFit.scaleDown,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child:
                                          Row(children: dashBoardItem[index]),
                                    ),
                                  )),
                            ),
                          ),
                        ),
                      );
                    })
              ],
            ),
          ),
          Expanded(
              flex: 6,
              child: Container(
                  color: grey.withOpacity(0.2),
                  child: Obx(() => buildSelectedPage(
                      selectedHomePageIndex:
                          controller.selectedHomePageIndex.value))

                  // AllProducts()
                  // DashBoard(),
                  ))
        ],
      ),
    );
  }
}

Widget buildSelectedPage({int selectedHomePageIndex = 0}) {
  switch (selectedHomePageIndex) {
    case 0:
      return const DashBoard();
    case 1:
      return AllProducts();
    case 2:
      return AddProductPage();
    case 3:
      return const UserDetails();

    default:
      return Container(); 
  }
}
