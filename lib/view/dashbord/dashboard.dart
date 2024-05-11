import 'package:eezy_admin/utils/colors.dart';
import 'package:eezy_admin/utils/texts.dart';
import 'package:eezy_admin/utils/variable.dart';
import 'package:eezy_admin/view-model/dashbord_items.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
     hight = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return 
       Container(
        width: width,
        height: hight,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                dashBoardText

                
                
              ],
            ),

            SizedBox(
              width: width,
              height: hight!*0.15,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:combinedList.length ,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AspectRatio(
                      aspectRatio: 2,
                      child: Container(
                        width: width!*0.2,
                        height: hight,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: white),
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                   ...combinedList[index]['typeOfOrders']!,
                                ],
                                
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                   ...combinedList[index]['typeOfOrdersValues']!,
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );

                }),
            )
          ],
        ),
      )
    ;
  }
}