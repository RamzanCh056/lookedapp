import 'package:flutter/material.dart';

class ContractPage extends StatefulWidget {
  const ContractPage({Key? key}) : super(key: key);

  @override
  State<ContractPage> createState() => _ContractPageState();
}

class _ContractPageState extends State<ContractPage> {
  List<String> _items = [
    'item 1',
    'item 2',
    'item 3',
    'item 4',
  ];
  String ? _initialValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Issue",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Color(0xFF0C331F),width: 1)
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              value: _initialValue,
              borderRadius: BorderRadius.circular(10),
              style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18,),
              hint: Text("General",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18),),
              items: _items.map((e) => DropdownMenuItem<String>(child: Text(e),value: e,)).toList(),
              onChanged: (v) {
                setState(() {
                  _initialValue = v!;
                });

              },
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Message",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          maxLines: 6,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide( color: Color(0xFF0C331F),
                  width: 1
              )
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Color(0xFF0C331F),
                width: 1
              )
            ),
          ),
        )
      ],
    );
  }
}
