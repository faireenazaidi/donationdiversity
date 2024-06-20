import 'package:donationdiversity/signUp/signUpController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../Routes/app_routes.dart';
import '../Widgets/app_color.dart';
import '../Widgets/myButton.dart';
import '../Widgets/primary_text_field.dart';
import '../Widgets/text_theme.dart';

class SignUpView extends GetView<SignUpController>{
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isEmail=false;
    String _selectedOption='mobile';
    // TODO: implement build
    return 
      SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children:[
              Container(
                height: Get.height, width: Get.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/bg.png'),
                      fit: BoxFit.fitHeight,
                    )
                ),
              ),
              Container(
                color: Colors.black.withOpacity(0.4),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(  top: 30.0, left: 8.0, right: 8.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
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
                      height: 40,
                      ),
                        Text("Signup", style: MyTextTheme.veryLargeWCN,),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio<String>(value: 'mobile', activeColor: AppColor.buttonColor, groupValue: _selectedOption, onChanged: (value){
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
                            child: IntlPhoneField(
                              decoration: InputDecoration(
                                hintText: "Enter phone number",
                                  filled: true,
                                  fillColor: Colors.white,
                                border: InputBorder.none,
                                counterText: ""
                              ),
                              initialCountryCode:'IN',
                              onChanged:(phone){
                                print(phone.completeNumber);
                              }
                            )
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
                                Text("Already registered,",style: MyTextTheme.mediumWCN,),
                              ],
                            ),
                            Row(
                              children: [
                                Text("you can",style: MyTextTheme.mediumWCN,),
                                TextButton(onPressed: (){}, child: Text('Login here!',style: MyTextTheme.largeBCB,)),
                              ],
                            ),
                          ],
                        )
                      ]
                      ),
                ),
              )
          ]
            ),
            ),
      );
  }
  void setState(Null Function() param0) {}
}

class OTPDialog extends StatefulWidget {
  @override
  _OTPDialogState createState() => _OTPDialogState();
}

class _OTPDialogState extends State<OTPDialog> {
  final int otpLength = 6;
  List<TextEditingController> otpControllers = [];
  List<FocusNode> focusNodes = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < otpLength; i++) {
      otpControllers.add(TextEditingController());
      focusNodes.add(FocusNode());
    }
  }

  @override
  void dispose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void handleOtpChange(String value, int index) {
    if (value.isNotEmpty && index < otpLength - 1) {
      FocusScope.of(context).requestFocus(focusNodes[index + 1]);
    }
    if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
    }
  }

  String getOtp() {
    String otp = '';
    for (var controller in otpControllers) {
      otp += controller.text;
    }
    return otp;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
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
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Stack(
                  children: [
                    Icon(Icons.lock),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: ('Please enter the 6 digits verification code sent to '),
                    style: MyTextTheme.mediumBCG
                  ),
                  TextSpan(
                    text: "+91 8318215534",style: MyTextTheme.smallBCN
                  )
                ]
              )
              ),

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(otpLength, (index) {
                return SizedBox(

                  width: 40,
                  child: TextField(
                    controller: otpControllers[index],
                    focusNode: focusNodes[index],
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      counterText: "",

                    ),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    style: TextStyle(fontSize: 18),
                    onChanged: (value) {
                      handleOtpChange(value, index);
                    },
                  ),
                );
              }),
            ),
            SizedBox(height: 20),
            MyButton(
              borderRadius: 10,
              elevation: 2,
              width: 353,
              onPressed: () {
                String otp = getOtp();
                Get.toNamed(AppRoutes.passwordRoute);
                // Add your submit action with the OTP value here
                print('Entered OTP: $otp');
              },
              title: "Submit",
              color: AppColor.buttonColor,
              suffixIcon: Icon(
                Icons.arrow_forward, color: Colors.white,),),
            SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Didn't receive an OTP?",style: MyTextTheme.mediumBCb,),
            ],
          ),
                  Align(
                    alignment: Alignment.topLeft,
                    child:   RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                                text: "Resend OTP  ",style: MyTextTheme.mediumBCb),
                            TextSpan(
                                text:  "in  ",style: MyTextTheme.smallBCN),

                            WidgetSpan(child: Icon(Icons.access_time_outlined,size: 20,color: AppColor.buttonColor,)),
                            TextSpan(
                                text: '  0:15 min',style: MyTextTheme.mediumBCB
                            )
                          ]
                      ),
                    ),
                  ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}