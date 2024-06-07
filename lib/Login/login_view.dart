import 'package:donationdiversity/Routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: Container(
        height: Get.height,width: Get.width,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg.png'),
              fit: BoxFit.cover


            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Image.asset("assets/ddlogo.png",height: 120,),
            Text("Login",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),),
            Container(

              height: 50,
              width: 370,
              decoration: BoxDecoration(
                color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone_android_rounded),
                  labelText: "Enter mobile number"
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Container(
                height: 50,
                width: 370,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline_rounded),
                    labelText: "Enter your Password",
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
