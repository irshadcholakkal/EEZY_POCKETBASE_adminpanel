import 'package:eezy_admin/model/services/product/product_data.dart';
import 'package:eezy_admin/model/user/get_user_data_model_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../model/services/api_services.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key});
  @override
  Widget build(BuildContext context) {

    return ListView(children: <Widget>[  
            const Center(  
                child: Text(  
                  'Users',  
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),  
                )),  
            DataTable(  
              columns: const [  
                DataColumn(label: Text(  
                    'INDEX',  
                    style: TextStyle(fontSize: 18,)  
                )), 
                DataColumn(label: Text(  
                    'ID',  
                    style: TextStyle(fontSize: 18,)  
                )),  
                DataColumn(label: Text(  
                    'Name',  
                    style: TextStyle(fontSize: 18,)  
                )),  
                DataColumn(label: Text(  
                    'EMAIL',  
                    style: TextStyle(fontSize: 18,)  
                )),
                 
                DataColumn(label: Text(  
                    'CREATED',  
                    style: TextStyle(fontSize: 18,)  
                )), 
                // DataColumn(label: Text(  
                //     'IMAGE',  
                //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)  
                // )),
              ],  
              rows: List.generate(controller.usersData.length, (index) => 
                DataRow(cells: [  
                  DataCell(Text(index.toString())),  
                  DataCell(Text(controller.usersData[index]!.id.toString())),  
                  DataCell(Text(controller.usersData[index]!.name.toString())),  
                  DataCell(Text(controller.usersData[index]!.email.toString())),  
                  DataCell(Text(controller.usersData[index]!.created.toString())),  
                  // DataCell(
                  //   controller.usersData[index]!.avatar!=null?
                  //   Image.network(imageBaseUrl+controller.usersData[index]!.avatar!,width: 50,height: 50,):SizedBox()
                  // ), 
                ]), )
              
              
             
               
            ),  
          ]);
  }
}