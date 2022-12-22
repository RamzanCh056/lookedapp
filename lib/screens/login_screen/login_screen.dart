import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:locked_wallet/common_widget/state_info.dart';
import 'package:locked_wallet/screens/admin_dashboard/admin_dashboard.dart';
import 'package:locked_wallet/screens/signup_screen/signup_screen.dart';
import 'package:locked_wallet/screens/user_dashboard/user_dashboard.dart';
import '../../common_widget/common_textfield.dart';
import '../../common_widget/reusable_textfield.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool showPass = false;
  final formKey = GlobalKey<FormState>();
  bool isLoad = false;
  loginUser() async {
    isLoad = true;
    setState(() {});
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('https://api.lockedvaultenterprises.com/api/auth/signin'));
    request.body =
        json.encode({"email": email.text, "password": password.text});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //  print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      var message = body['msg'];
       StaticInfo.token = body['token'];

      isLoad = false;
      setState(() {});
      print("my msg == $message");

      Fluttertoast.showToast(
          msg: '$message',
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: Colors.black);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) {
            return UserDashboard();
          },
        ),
      );
    } else {
      isLoad = false;
      setState(() {});
      print(response.reasonPhrase);
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
                  SizedBox(
                    height: 150,
                    width: double.infinity,
                    child: Image.asset(
                      "assets/hersheybar381.png",
                    ),
                  ),
                  CommonTextFieldWithTitle('Email', 'Enter Email', email,
                      (val) {
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
                  }),
                  //remember me
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF563AFF),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //Sign Up
                  isLoad
                      ? Center(child: CircularProgressIndicator())
                      : Container(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xFF0C331F)),
                            onPressed: () {
                              if (formKey.currentState!.validate())
                              {
                                loginUser();
                              }
                            },
                            child: Text("Login"),
                          ),
                        ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account ?",
                        style: TextStyle(color: Colors.black),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) {
                                return SignUpScreen();
                              }),
                            );
                          },
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                              color: Color(0xFF563AFF),
                            ),
                          ))
                    ],
                  ),
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
