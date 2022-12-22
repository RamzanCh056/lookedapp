import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WithdrawAddress extends StatefulWidget {
  const WithdrawAddress({Key? key}) : super(key: key);

  @override
  State<WithdrawAddress> createState() => _WithdrawAddressState();
}

class _WithdrawAddressState extends State<WithdrawAddress> {
  List<String> _bankItems = [
    'Bank Wire',
    'Crypto Wallet',
  ];
  String? _wallet;
  List<String> _walletItems = [
    'Wallet 1',
    'Wallet 2',
  ];
  String? _bank;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color(0xFF0C331F), width: 1)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              value: _bank,
              borderRadius: BorderRadius.circular(10),
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 18,
              ),
              hint: Text(
                "Select Bank",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
              ),
              items: _bankItems
                  .map((e) => DropdownMenuItem<String>(
                        child: Text(e),
                        value: e,
                      ))
                  .toList(),
              onChanged: (v) {
                setState(() {
                  _bank = v!;
                });
              },
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color(0xFF0C331F), width: 1)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              value: _wallet,
              borderRadius: BorderRadius.circular(10),
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 18,
              ),
              hint: Text(
                "Select Wallet",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
              ),
              items: _walletItems
                  .map((e) => DropdownMenuItem<String>(
                        child: Text(e),
                        value: e,
                      ))
                  .toList(),
              onChanged: (v) {
                setState(() {
                  _wallet = v!;
                });
              },
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Add Wallet",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.all(15),
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFF0C331F),
            ),
            borderRadius: BorderRadius.circular(10)
          ),
          child: Text(
            "BTC Address",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.all(15),
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xFF0C331F),
              ),
              borderRadius: BorderRadius.circular(10)
          ),
          child: Text(
            "BTC Address CONFIRM",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Color(0xFF0C331F)),
            onPressed: () {
            },
            child: Text("Save"),
          ),
        ),
      ],
    );
  }
}
