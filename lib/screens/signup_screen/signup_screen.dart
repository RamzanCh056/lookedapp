import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:locked_wallet/common_widget/common_textfield.dart';

import '../../common_widget/reusable_textfield.dart';
import '../login_screen/login_screen.dart';
import '../otp_screen/otp_screen.dart';
import 'package:http/http.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController username = TextEditingController();
    TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();

  bool showPass = false;
  final formKey = GlobalKey<FormState>();
  bool isLoad = false;
  Signup()async{
     isLoad = true;
    setState(() {});
    var headers = {
  'Content-Type': 'application/json'
};
var request = http.Request('POST', Uri.parse('https://api.lockedvaultenterprises.com/api/auth/signup'));
request.body = json.encode({
  "username": username.text,
  "email": email.text,
  "password": password.text,
  "phone": phone.text,
  "address": address.text
});
request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

if (response.statusCode == 200) {
  // print(await response.stream.bytesToString());
    var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      var message = body['msg'];
      isLoad = false;
      setState(() {});
      // print("my msg == $message");

      Fluttertoast.showToast(msg: '$message');
      Navigator.push(context, MaterialPageRoute(builder: (_){
                          return LogInScreen();
                        }),
                        );
}
else {
  print(response.reasonPhrase);
  isLoad = false;
      setState(() {});
}
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 150,width: double.infinity,
                    child: Image.asset("assets/hersheybar381.png",),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //Name
                 
                  CommonTextFieldWithTitle(
                        'User Name', 'Enter User Name', username, (val) {
                      if (val!.isEmpty) {
                        return 'This is required field';
                      }
                    }),const SizedBox(
                      height: 14,
                    ),
                     CommonTextFieldWithTitle(
                        'Email', 'Enter Email', email, (val) {
                      if (val!.isEmpty) {
                        return 'This is required field';
                      }
                    }),
                    const SizedBox(
                      height: 14,
                    ),
                    CommonTextFieldWithTitle(
                        'Password', 'Enter Password', password,
                        suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                showPass = !showPass;
                              });
                            },
                            child: const Icon(Icons.remove_red_eye)),
                        obscure: showPass, (val) {
                      if (val!.isEmpty) {
                        return 'This is required field';
                      }
                    }), const SizedBox(
                      height: 14,
                    ), CommonTextFieldWithTitle(
                        'Phone Number', 'Enter Phone Number', phone, (val) {
                      if (val!.isEmpty) {
                        return 'This is required field';
                      }
                    }),
                    const SizedBox(
                      height: 14,
                    ), CommonTextFieldWithTitle(
                        'Address', 'Enter Address', address, (val) {
                      if (val!.isEmpty) {
                        return 'This is required field';
                      }
                    }),
            
                  SizedBox(
                    height: 20,
                  ),
                  //Sign Up
                   isLoad
                      ? Center(child: CircularProgressIndicator())
                      :
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Color(0xFF0C331F)),
                      onPressed: () {
                          if (formKey.currentState!.validate())
                              {
                                Signup();
                              }
                        
                      },
                      child: Text("Sign Up"),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?",style: TextStyle(color: Colors.black),),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_){
                          return LogInScreen();
                        }));
                      }, child: Text("Login",style: TextStyle(color: Color(0xFF563AFF),),))
                    ],),
                  SizedBox(
                    height: 40,
                  ),
            
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
