
import 'package:donationdiversity/Routes/app_routes.dart';
import 'package:donationdiversity/Widgets/text_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import '../Widgets/app_color.dart';
import '../Widgets/myButton.dart';
import '../Widgets/primary_text_field.dart';
import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  
  // Getter for _isChecked

    @override
    Widget build(BuildContext context) {
      Color myColor = Colors.black.withOpacity(0.2);
      // TODO: implement build

      return SafeArea(
          child: Scaffold(
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
                  child: Padding(
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

                          Text("Login", style: MyTextTheme.veryLargeWCB,),
                          SizedBox(
                            height: 30,
                          ),
                          PrimaryTextField(
                            prefixIcon: Icon(Icons.phone_android_rounded),
                            hintText: "Enter mobile number",
                            backgroundColor: Colors.white,
                          ),
                          SizedBox(
                            height: 15,
                          ),

                          PrimaryTextField(
                            prefixIcon: Icon(Icons.lock_outline_rounded),
                            hintText: "Enter password",


                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                checkColor: Colors.green,
                                activeColor: Colors.transparent,
                                value: false, onChanged: (bool?value) {},
                              ),
                              Text(
                                "Remember me", style: MyTextTheme.mediumBCN,),
                              SizedBox(
                                width: 85,
                              ),
                              Text("Forgot Password?",
                                  style: MyTextTheme.mediumBCN)
                            ],
                          ),

                          SizedBox(
                            height: 20,
                          ),

                          MyButton(
                            borderRadius: 10,
                            elevation: 2,
                            width: 353,
                            onPressed: () {},
                            title: "SIgn in",
                            color: AppColor.buttonColor,
                            suffixIcon: Icon(
                              Icons.arrow_forward, color: Colors.white,),),

                          SizedBox(
                            height: 15,
                          ),
                          Row(
                              children: <Widget>[
                                Expanded(
                                    child: Divider(
                                      color: Colors.white,
                                      indent: 80,
                                      endIndent: 1,
                                      thickness: 0.6,
                                    )
                                ),
                                SizedBox(
                                  width: 10,
                                ),

                                Text("or", style: MyTextTheme.mediumBCN,),

                                Expanded(
                                    child: Divider(
                                      color: Colors.white,
                                      endIndent: 80,
                                      indent: 10,
                                      thickness: 0.6,
                                    )
                                ),
                              ]
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "If you don't have an account registered,",
                                    style: MyTextTheme.mediumBCN
                                ),

                                TextSpan(
                                    text: "you can",
                                    style: MyTextTheme.mediumBCN
                                ),
                                TextSpan(
                                  text: " Register here!",
                                  style: MyTextTheme.largeBCB,

                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.toNamed(AppRoutes.signUpRoute);

                                      // Navigate to registration screen or perform action
                                    },
                                ),
                              ],
                            ),
                          ),
                        ]
                    ),
                  ),
                ),
              )
          )
      );
    }
  }

