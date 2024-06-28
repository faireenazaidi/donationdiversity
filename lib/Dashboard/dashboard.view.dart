
import 'package:donationdiversity/Widgets/app_color.dart';
import 'package:donationdiversity/Widgets/primary_text_field.dart';
import 'package:donationdiversity/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Widgets/Primarytext.dart';
import 'dashboardController.dart';

class DashboardView extends GetView<DashboardController>{
  get index => null;
  final DashboardController dashboardController = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return 
      SafeArea(
        child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
        Image.asset("assets/logoHeader2.png"),
        SizedBox(width: 5,),
        Image.asset("assets/logoHeader.png"),
            ],
          ),
          actions:[
            Padding(
        padding: const EdgeInsets.all(9.0),
        child: CircleAvatar(
          ),
            ),],
            leading: Builder(
              builder: (context)=>IconButton(
                  onPressed: ()=>Scaffold.of(context).openDrawer(), icon: Icon(Icons.menu,color: Colors.white,)),
            ),
        ),
        drawer: Drawer(
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:  TextField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(color: Colors.red, width: 2.0),
                  ),
                  hintText: 'Search for Categories..',
                  prefixIcon:  Icon(Icons.search,color: AppColor.black,),
                ),
              ),
            ),
              Row(
                children: [
                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:3,
                    shrinkWrap: true,
                    itemBuilder: (
                     context,index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.red
                        ),
                      );
                  },

                  )
                ],
              )
        
            ]
          ),
        )
            ),
      );
  }

}