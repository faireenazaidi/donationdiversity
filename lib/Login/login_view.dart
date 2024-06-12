import 'dart:ui';

import 'package:donationdiversity/Routes/app_routes.dart';
import 'package:donationdiversity/Widgets/hex_color_extention.dart';
import 'package:donationdiversity/Widgets/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import '../Widgets/app_color.dart';
import '../Widgets/primary_text_field.dart';
import 'login_controller.dart';
class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    Color myColor=Colors.black.withOpacity(0.2);
    // TODO: implement build

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: Get.height,width: Get.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg.png'),
                fit: BoxFit.cover,

              )
          ),
      
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: HexColor('#DDB887')),
                    borderRadius: BorderRadius.circular (15),


                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                      child: Image.asset("assets/ddlogo.png",height: 150,)),
                ),
                SizedBox(
                  height: 20,
                ),

                Text("Login",style: TextStyle(fontSize: 24,color: Colors.white),),
                SizedBox(
                  height: 20,
                ),
                PrimaryTextField(
                  prefixIcon: Icon(Icons.phone_android_rounded),
                    hintText: "Enter mobile number",
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                  height: 10,
                ),

                PrimaryTextField(
                    prefixIcon: Icon(Icons.lock_outline_rounded),
                    hintText: "Enter password",


                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      checkColor: Colors.green,
                      activeColor: Colors.transparent,
                      value: false, onChanged:(value) {

                      },

                    ),
                    Text("Remember me",style: MyTextTheme.mediumBCN,),
                    SizedBox(
                      width: 80,
                    ),
                    Text("Forgot Password?",style: MyTextTheme.mediumBCN)
                  ],
                ),

                SizedBox(
                  height: 10,
                ),

                ElevatedButton(

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('SignIn',style: MyTextTheme.mediumBCN,),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),

                    )

                  ),
                  onPressed: () {},

                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                    children: <Widget>[
                      Expanded(
                          child: Divider(
                            color: Colors.white,
                            indent: 80,
                            thickness: 0.3,
                          )
                      ),
                      SizedBox(
                        width: 10,
                      ),

                      Text("or",style: MyTextTheme.mediumBCN,),

                      Expanded(
                          child: Divider(
                            color: Colors.white,
                            endIndent: 80,
                            thickness: 0.3,
                          )
                      ),
                    ]
                ),
                SizedBox(height: 10,),
                Text("Login with OTP",style: MyTextTheme.largeBCB,),
                SizedBox(
                  height: 10,
                ),
                Text("If you don't have an account registered,",style: MyTextTheme.mediumBCN,),
                Text("you can",style: MyTextTheme.mediumBCN,)
              ],
            ),
          ),
        )
      ),
    );
  }
}
