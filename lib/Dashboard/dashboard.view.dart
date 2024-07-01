import 'package:donationdiversity/Widgets/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Widgets/listItem.dart';
import 'dashboardController.dart';
import 'package:flutter/material.dart' as flutter;


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
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.home_work_outlined,color: Colors.black,),
                    title: flutter.Text('Dashboard',style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,),),
                    tileColor: Colors.red[50],
                    onTap: () {

                    },
                  ),
                      ListTile(
                      title: flutter.Text('Item 2'),
                      tileColor: Colors.red[100],
                      onTap: () {

                      },
                    ),

                  ListTile(
                    title: flutter.Text('Item 3'),
                    tileColor: Colors.red[200],
                    onTap: () {
                    },
                  ),
                  ListTile(
                    title: flutter.Text('Item 4'),
                    tileColor: Colors.red[300],
                    onTap: () {
                    },
                  ),
                  ListTile(
                    title: flutter.Text('Item 5'),
                    tileColor: Colors.red[400],
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("Item 6"),
                    tileColor: Colors.red,
                    onTap:(){}
                  ),
                  ListTile(
                    title: Text("Item 7"),
                    tileColor: Colors.red[600],
                    onTap: (){},
                  ),
                  ListTile(
                    title: Text("Item 8"),
                    tileColor: Colors.red[700],
                    onTap: (){},
                  ),ListTile(
                    title: Text("Item 8"),
                    tileColor: Colors.red[800],
                    onTap: (){},
                  ),
                  ListTile(
                    title: Text("Item 8"),
                    tileColor: Colors.red[900],
                    onTap: (){},
                  )



                ],

              ),

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
                    // borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: Colors.black,width: 2.0)
                  ),
                  hintText: 'Search for Categories..',
                  prefixIcon:  Icon(Icons.search,color: AppColor.black,),
                ),
              ),
            ),
            Container(
              height: 100,
              // Adjust the height as needed
              child: flutter.ListView(
                scrollDirection: flutter.Axis.horizontal,
                children: <flutter.Widget>[
                  Container(
                      child: ListItemWidget(icon:Icons.accessibility_outlined, label:'All Needs')),
                  ListItemWidget(icon:Icons.category_outlined, label: 'Categories'),
                  ListItemWidget(icon:Icons.monetization_on_outlined, label: 'Donate'),
                ],
              ),
            ),
            SizedBox(
              height: 200,width: Get.width,
              child: PageView.builder(
                // pageSnapping: true,
                itemCount: controller.imageUrls.length,
                controller: controller.pageController,
                // scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                        child: Image.network(controller.imageUrls[index],fit: BoxFit.fill,)),
                  );
                },
              ),
            ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SmoothPageIndicator(
                            controller: controller.pageController,
                            count:  4,
                            axisDirection: Axis.horizontal,
                            effect:  const SlideEffect(
                                spacing:  8.0,
                                radius:  4.0,
                                dotWidth:  5.0,
                                dotHeight:  5.0,
                                paintStyle:  PaintingStyle.fill,
                                strokeWidth:  1.5,
                                dotColor:  Colors.grey,
                                activeDotColor:  Colors.black
                            ),
                          ),
                        ],
                      ),
                    )
                  ]
              )
    ),
    )
    );


  }


}
