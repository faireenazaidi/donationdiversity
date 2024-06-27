import 'package:donationdiversity/Widgets/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'dashboardController.dart';

class DashboardView extends GetView<DashboardController>{
  get index => null;
  final DashboardController dashboardController = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
appBar: AppBar(
  backgroundColor: AppColor.packageGray,
),
drawer: Drawer(
  child: ListView(
    children: [

    ],
  ),
),
      body: Column(

        children: [
          Expanded(
              child: PageView.builder(
                scrollDirection: Axis.vertical,
                  itemCount: dashboardController.imageUrls.length,
              itemBuilder: (context,index){
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    image: DecorationImage(
                      image: NetworkImage( dashboardController.imageUrls[index],
                      ),
                    )

                  ),
                );
                  }
                        )
          )
        ]
      )
    );
  }

}