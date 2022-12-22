import 'package:flutter/material.dart';
import 'package:locked_wallet/screens/adminAuth/login.dart';
import 'package:locked_wallet/screens/landing.dart';
import 'package:locked_wallet/screens/login_screen/login_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogInScreen(),
    ),
  );
}
