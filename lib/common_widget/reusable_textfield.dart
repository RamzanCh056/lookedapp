import 'package:flutter/material.dart';
class ReUsableTextField extends StatelessWidget {
  final String ? hintText;
  final TextInputType ? keyboardType;
  final TextEditingController ? controller;
  final IconData ? prefixIcon;
  final Widget ? suffixIcon;
  final bool ? obSecureText;
  const ReUsableTextField({
    Key? key, this.hintText, this.keyboardType, this.controller, this.prefixIcon, this.suffixIcon, this.obSecureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 50,
        child: TextField(
          keyboardType: keyboardType,
          controller: controller,
          obscureText: obSecureText!,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10),
            prefixIcon: Icon(prefixIcon),
            hintText: hintText,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xFFA2A2A6))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xFFA2A2A6))),
          ),
        ),
      ),
    );
  }
}