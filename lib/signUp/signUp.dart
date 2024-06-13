import 'package:donationdiversity/signUp/signUpController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

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
                    Text("Login", style: MyTextTheme.veryLargeWCB,),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio<String>(value: 'mobile', groupValue: _selectedOption, onChanged: (value){
                          setState(() {
                            _selectedOption=value!;
                          });
                        }),
                        Text("Mobile"),
                        Radio<String>(value: 'Email', groupValue: _selectedOption, onChanged: (value){
                          setState(() {
                            _selectedOption=value!;
                          });
                        }),
                        Text("Email"),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    if(!isEmail)
                      Row(
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
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter Phone Number',
                            ),
                            keyboardType: TextInputType.phone,
                          ))
                        ],
                      )
                    else
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Enter email"
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(onPressed: (){}, child: Text('Send OTP')),
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(onPressed: (){}, child: Text('Already registered, you can login here!',style: MyTextTheme.mediumBCB,))
                  ]
                  ),
            ),
          )
        )
    );

  }

  void setState(Null Function() param0) {}

}