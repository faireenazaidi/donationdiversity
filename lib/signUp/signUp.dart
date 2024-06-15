import 'package:donationdiversity/signUp/signUpController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Routes/app_routes.dart';
import '../Widgets/app_color.dart';
import '../Widgets/myButton.dart';
import '../Widgets/text_theme.dart';

class SignUpView extends GetView<SignUpController>{
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isEmail=false;
    String countryCode="+91";
    String _selectedOption='mobile';
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
            child: Padding(
              padding: const EdgeInsets.only(  top: 30.0, left: 8.0, right: 8.0),
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
                    Text("Signup", style: MyTextTheme.veryLargeWCN,),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio<String>(value: 'mobile', groupValue: _selectedOption, onChanged: (value){
                          setState(() {
                            _selectedOption=value!;
                          });
                        }),
                        Text("Mobile Number",style: MyTextTheme.mediumWCN,),
                        Radio<String>(value: 'Email', groupValue: _selectedOption, onChanged: (value){
                          setState(() {
                            _selectedOption=value!;
                          });
                        }),
                        Text("Email",style: MyTextTheme.mediumWCN,),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),

                    if(!isEmail)
                      Container(
                        padding: EdgeInsets.all(8.0), // Adjust padding as needed
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white), // Add border decoration if desired
                          borderRadius: BorderRadius.circular(8.0),
                          // Optional: Add border radius
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            DropdownButton<String>(
                                value: countryCode,items: <String>['+91','+1','+44','+61'].map((String value) {
                                  return DropdownMenuItem<String>(
                                      value:value,
                                      child: Text(value),);
                            }).toList(), onChanged: (newValue){
                                  setState(() {
                                    countryCode=newValue!;
                                  });
                            }),
                            Expanded(child: TextField(
                              keyboardType: TextInputType.phone,
                            )),
                          ],
                        ),
                      ),
                    SizedBox(
                      height: 20,
                    ),
                    MyButton(
                      borderRadius: 10,
                      elevation: 2,
                      width: 353,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => OTPDialog(),
                        );
                      },
                      title: "Send OTP",
                      color: AppColor.buttonColor,
                      suffixIcon: Icon(
                        Icons.arrow_forward, color: Colors.white,),),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("Already registered,",style: MyTextTheme.mediumBCN,),
                          ],
                        ),
                        Row(
                          children: [
                            Text("you can",style: MyTextTheme.mediumBCN,),
                            TextButton(onPressed: (){}, child: Text('Login here!',style: MyTextTheme.largeBCB,)),
                          ],
                        ),
                      ],
                    )
                  ]
                  ),
            ),
          )
        )
    );
  }
  void setState(Null Function() param0) {}
}
class OTPDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'OTP',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Please enter the 6 Digits verification code sent to +91 8318215534',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(6, (index) {
                return SizedBox(
                  width: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    style: TextStyle(fontSize: 18),
                  ),
                );
              }),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add submit action here
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), backgroundColor: Colors.brown,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Submit',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Didn't receive an OTP?",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Resend OTP in 0:15 min',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}