import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:locked_wallet/common_widget/common_textfield.dart';
import 'package:locked_wallet/screens/adminAuth/login.dart';
import 'package:http/http.dart' as http;
class AdminRegister extends StatefulWidget {
  const AdminRegister({super.key});

  @override
  State<AdminRegister> createState() => _AdminRegisterState();
}

class _AdminRegisterState extends State<AdminRegister> {
   TextEditingController username = TextEditingController();
    TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();


  bool showPass = false;
  final formKey = GlobalKey<FormState>();
  bool isLoad = false;
   AdminSignup()async{
     isLoad = true;
    setState(() {});
    var headers = {
  'Content-Type': 'application/json'
};
var request = http.Request('POST', Uri.parse('https://api.lockedvaultenterprises.com/api/auth/admin/signup'));
request.body = json.encode({
  "username": username.text,
  "email": email.text,
  "password": password.text,
  
 
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
                          return AdminLogin();
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
                    ),
            
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
                                 AdminSignup();
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
                          return AdminLogin();
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