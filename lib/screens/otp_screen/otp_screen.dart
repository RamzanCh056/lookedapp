import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../common_widget/otp_text_field.dart';
import '../admin_dashboard/admin_dashboard.dart';
import '../login_screen/login_screen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Text(
                    "Enter the OTP received on your email",
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OtpTextField(
                        keyboardType: TextInputType.number,
                        onChanged: (v){
                          int value = int.parse(v);
                          if (v.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                      ),
                      SizedBox(width: 20,),
                      OtpTextField(
                        keyboardType: TextInputType.number,
                        onChanged: (v){
                          int value = int.parse(v);
                          if (v.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                      ),
                      SizedBox(width: 20,),
                      OtpTextField(
                        keyboardType: TextInputType.number,
                        onChanged: (v){
                          int value = int.parse(v);
                          if (v.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                      ),
                      SizedBox(width: 20,),
                      OtpTextField(
                        keyboardType: TextInputType.number,
                        onChanged: (v){
                          int value = int.parse(v);
                          if (v.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                      ),
                      SizedBox(width: 20,),
                      OtpTextField(
                        keyboardType: TextInputType.number,
                        onChanged: (v){
                          int value = int.parse(v);
                          if (v.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                      ),
                      SizedBox(width: 20,),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Color(0xFF0C331F)),
                      onPressed: () {

                        Navigator.push(context, MaterialPageRoute(builder: (_){
                          return AdminDashBoard();
                        }),);
                      },
                      child: Text("Verify"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


