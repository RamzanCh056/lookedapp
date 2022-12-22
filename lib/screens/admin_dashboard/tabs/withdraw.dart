import 'package:flutter/material.dart';

class withdraw extends StatefulWidget {
  const withdraw({Key? key}) : super(key: key);

  @override
  State<withdraw> createState() => _withdrawState();
}

class _withdrawState extends State<withdraw> {
  List<String> _compoundItems = [
    'Monthly',
    'Bi-Monthly',
  ];
  List<String> _payOutItems = [
    'Monthly',
    'Bi-Monthly',
    'Compound',
    'Compound-Custom',
  ];
  String? _payout;
  String? _compound;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Payout Frequency",
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
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color(0xFF0C331F), width: 1)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              value: _payout,
              borderRadius: BorderRadius.circular(10),
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 18,
              ),
              hint: Text(
                "Select",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
              ),
              items: _payOutItems
                  .map((e) => DropdownMenuItem<String>(
                        child: Text(e),
                        value: e,
                      ))
                  .toList(),
              onChanged: (v) {
                setState(() {
                  _payout = v!;
                });
              },
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF0C331F),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 50,),
                    Text("75%",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.white),),
                    Spacer(),
                    Column(
                      children: [
                        InkWell(
                          onTap: (){},
                          child: Container(
                            height: 30,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                              ),
                              border: Border.all(color: Colors.white)
                            ),
                            child: Icon(Icons.arrow_drop_up,color: Colors.white,),
                          ),
                        ),
                        InkWell(
                          onTap: (){},
                          child: Container(
                            height: 30,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                              ),
                              border: Border.all(color: Colors.white)
                            ),
                            child: Icon(Icons.arrow_drop_down,color: Colors.white,),
                          ),
                        ),
                      ],
                    )
                  ],
                ),

              ),
            ),
            SizedBox(width: 50,),
            Expanded(
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF0C331F),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 50,),
                    Text("75%",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.white),),
                    Spacer(),
                    Column(
                      children: [
                        InkWell(
                          onTap: (){},
                          child: Container(
                            height: 30,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                ),
                                border: Border.all(color: Colors.white)
                            ),
                            child: Icon(Icons.arrow_drop_up,color: Colors.white,),
                          ),
                        ),
                        InkWell(
                          onTap: (){},
                          child: Container(
                            height: 30,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                ),
                                border: Border.all(color: Colors.white)
                            ),
                            child: Icon(Icons.arrow_drop_down,color: Colors.white,),
                          ),
                        ),
                      ],
                    )
                  ],
                ),

              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Custom Compound",
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
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color(0xFF0C331F), width: 1)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              value: _compound,
              borderRadius: BorderRadius.circular(10),
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 18,
              ),
              hint: Text(
                "Select",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
              ),
              items: _compoundItems
                  .map((e) => DropdownMenuItem<String>(
                        child: Text(e),
                        value: e,
                      ))
                  .toList(),
              onChanged: (v) {
                setState(() {
                  _compound = v!;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
