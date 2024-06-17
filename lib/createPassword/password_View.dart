import 'package:donationdiversity/Widgets/myButton.dart';
import 'package:donationdiversity/createPassword/password_Controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Routes/app_routes.dart';
import '../Widgets/app_color.dart';
import '../Widgets/primary_text_field.dart';
import '../Widgets/text_theme.dart';

class PasswordView extends GetView<PasswordController> {
  bool _isPassword=true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     resizeToAvoidBottomInset: false,
     body: Container(
       height: Get.height, width: Get.width,
       decoration: BoxDecoration(
           image: DecorationImage(
             image: AssetImage('assets/bg.png'),
             fit: BoxFit.fitHeight,
           )
       ),
       child: SingleChildScrollView(
         child:Padding(
           padding: const EdgeInsets.only(
               top: 30.0, left: 8.0, right: 8.0),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Container(
                 decoration: BoxDecoration(
                   border: Border.all(color: HexColor('DDB887')),
                   borderRadius: BorderRadius.circular(15),
                 ),

                 child: ClipRRect(
                     borderRadius: BorderRadius.circular(15),

                     child: Image.asset(
                       "assets/ddlogo.png", height: 135,)),
               ),
               SizedBox(
                 height: 30,
               ),

               Text("Create Password", style: MyTextTheme.veryLargeWCN,),
               SizedBox(
                 height: 30,
               ),
               PrimaryTextField(
                 prefixIcon: Icon(Icons.lock_outline),
                 hintText: "Enter Password",
                 backgroundColor: Colors.white,
                 suffixIcon: IconButton(
                   icon: Icon(
                       _isPassword? Icons.visibility_off: Icons.visibility,
                   ),
                   onPressed: (){
                     setState((){
                       _isPassword = !_isPassword;
                     }
                     );
                   },
                 ),
               ),
               SizedBox(
                 height: 15,
               ),

               PrimaryTextField(
                 prefixIcon: Icon(Icons.lock_outline),
                 hintText: "Repeat password",
               ),
               SizedBox(
                 height: 20,
               ),
               MyButton(
                 borderRadius: 10,
                 elevation: 2,
                 width: 353,
                 onPressed: () {
                   Get.toNamed(AppRoutes.userInfoRoute);
                 },
                 title: "Create Account",
                 color: AppColor.buttonColor,
                 suffixIcon: Icon(
                   Icons.arrow_forward, color: Colors.white,),),

             ],
           ),
         ),
       )

     ),
   );
  }

  void setState(Null Function() param0) {}

}
