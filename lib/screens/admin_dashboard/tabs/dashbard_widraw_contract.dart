import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:locked_wallet/common_widget/state_info.dart';
import 'package:locked_wallet/screens/admin_dashboard/admin_all_users_model/admin_all_users_model.dart';
import 'package:locked_wallet/screens/admin_dashboard/admin_dashboard.dart';
import 'package:locked_wallet/screens/user_dashboard/user_dashboard.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../common_widget/reusable_tableRow.dart';
import 'package:http/http.dart' as http;

class DashBoardWithDrawContract extends StatefulWidget {
  const DashBoardWithDrawContract({Key? key}) : super(key: key);

  @override
  State<DashBoardWithDrawContract> createState() =>
      _DashBoardWithDrawContractState();
}

class _DashBoardWithDrawContractState extends State<DashBoardWithDrawContract> {
  List<String> items = ["All User", "Ramazan", "Latif Ullah", "Asad"];
  String _initialValue = "All User";
  bool allUsers = true;

  var message = [];
  var sync = [];
  List<UserModel> list = [];
  UserModel? select;
  void initState() {
    super.initState();
    GetAllUsers();
    getData();
  }

  GetAllUsers() async {
    var headers = {
      'Authorization':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFkaXRpMTIzNEB0ZXN0LmNvbSIsImlhdCI6MTY3MDM0MTY4OH0.BjE1w14UkKa8fjkq7cf5rxd1P9lQUqEXi4qnmSuDj1w'
    };
    var request = http.Request(
        'GET', Uri.parse('http://3.109.216.76:30111/api/admin/getallusers'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      message = body['data'];
      for (int i = 0; i < message.length; i++) {
        UserModel getList = UserModel.fromJson(message[i]);
        list.add(getList);
        setState(() {

        });
      }
    } else {
      print(response.reasonPhrase);
    }
  }

  syncDash() async {
    var headers = {'Authorization': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImJpcGluMTIzNEB0ZXN0LmNvbSIsImlhdCI6MTY3MTE4MjI1MX0.oqI_vc868nkJ24CeCtLXcyrxnJW3QM15cxFsdOmrFf0'};
    var request = http.Request(
        'GET', Uri.parse('http://3.109.216.76:30111/api/user/getdashboard'));
    request.body = '''''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      sync = body['data'];
      setState(() {

      });
      // print('Sync is =$sync');
    } else {
      print(response.reasonPhrase);
    }
  }
  var data = [];
  getData()async{
    var headers = {
      'Authorization': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFkaXRpMTIzNEB0ZXN0LmNvbSIsImlhdCI6MTY3MDM0MTY4OH0.BjE1w14UkKa8fjkq7cf5rxd1P9lQUqEXi4qnmSuDj1w',
      'Cookie': 'connect.sid=s%3AmBcOuoyugB54QXZqpWGQQbK88si9NELb.HBHNqX4GA599IDUwztdjItc%2B6yrnEzELzfKGnwRfu8Q'
    };
    var request = http.Request('GET', Uri.parse('https://api.lockedvaultenterprises.com/api/admin/getallusers'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      data= body['data'];
      setState(() {

      });
      print(data);
    }
    else {
    print(response.reasonPhrase);
    }


  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: Image.asset(
                  "assets/hersheybar381.png",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 40,
              ),
              //DropDownButton
              InkWell(
                onTap: () async {
                  await showDialog(
                      context: context,
                      builder: (_) {
                        return StatefulBuilder(
                          builder: (BuildContext context,
                              void Function(void Function()) setState) {
                            return Dialog(
                              backgroundColor: Colors.grey.shade200,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    ListView.builder(
                                        shrinkWrap: true,
                                        physics: ScrollPhysics(),
                                        itemCount: message.length,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(list[index]
                                                        .username
                                                        .toString()),
                                                  ),
                                                  Checkbox(
                                                    focusColor:
                                                        const Color(0xFFFFC000),
                                                    checkColor: Colors.black,
                                                    activeColor:
                                                        const Color(0xFFFFC000),
                                                    value:
                                                        list[index].isSelected!,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        list[index].isSelected =
                                                            !list[index]
                                                                .isSelected!;

                                                        setState(() {});
                                                      });
                                                    },
                                                  ),
                                                ],
                                              )
                                            ],
                                          );
                                        }),
                                    Spacer(),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        width: 120,
                                        height: 60,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: Color(0xFF0C331F),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Text(
                                          "Submit",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      });
                  setState(() {});
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color(0xFF0C331F),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Text(
                        _initialValue,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              Spacer(),
              // InkWell(
              //     onTap: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (_) {
              //             return UserDashboard();
              //           },
              //         ),
              //       );
              //     },
              //     child: Icon(Icons.menu)),
              SizedBox(
                width: 10,
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          //graph
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .5,
            child: SfCartesianChart(
                palette: [Color(0xFF0C331F)],
                primaryXAxis: CategoryAxis(title: AxisTitle(text: 'Days')),
                primaryYAxis:
                    NumericAxis(title: AxisTitle(text: 'Profit / Loss')),
                series: <ChartSeries>[
                  ColumnSeries<ProfitLoss, String>(
                      dataSource: <ProfitLoss>[
                        ProfitLoss('1', 89),
                        ProfitLoss('2', 280),
                        ProfitLoss('3', 54),
                        ProfitLoss('4', 320),
                        ProfitLoss('5', 400),
                        ProfitLoss('6', -190),
                        ProfitLoss('7', 200),
                        ProfitLoss('8', -111),
                        ProfitLoss('9', 320),
                        ProfitLoss('10', 240),
                        ProfitLoss('11', 280),
                        ProfitLoss('12', 900),
                        ProfitLoss('13', -220),
                        ProfitLoss('14', 400),
                        ProfitLoss('15', -190),
                        ProfitLoss('16', 600),
                        ProfitLoss('17', -111),
                        ProfitLoss('18', 320),
                        ProfitLoss('19', -240),
                        ProfitLoss('20', 440),
                      ],
                      xValueMapper: (ProfitLoss sales, _) => sales.day,
                      yValueMapper: (ProfitLoss sales, _) => sales.profit,
                      dataLabelSettings: DataLabelSettings(isVisible: true))
                ]),
          ),
          SizedBox(
            height: 30,
          ),
          //Buttons
         
          FutureBuilder(
                future: syncDash(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data != null || sync != null) {
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: sync.length,
                        itemBuilder: (context, index) {
                         // sync[index]['positions'][index]['openPrice'];
                          return GestureDetector(
                            onTap: (){

                              getData();
                            },
                            child: Column(
                              children: [

                                               Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(color: Colors.black)),
                                        padding: EdgeInsets.symmetric(vertical: 20),
                                        child: Column(
                                          children: [
                                            Text(
                                              "Balance",
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              sync[index]['balance'].toString(),
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(color: Colors.black)),
                                        padding: EdgeInsets.symmetric(vertical: 20),
                                        child: Column(
                                          children: [
                                            Text(
                                              "Equity",
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              sync[index]['equity'].toString(),
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                // Buttons
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(color: Colors.black)),
                                        padding: EdgeInsets.symmetric(vertical: 20),
                                        child: Column(
                                          children: [
                                            Text(
                                              "Net Path",
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                             sync[index]['margin'].toString(),
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(color: Colors.black)),
                                        padding: EdgeInsets.symmetric(vertical: 20),
                                        child: Column(
                                          children: [
                                            Text(
                                              "Profit",
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                          sync[index]['equity'].toString(),
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        });
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          

          SizedBox(
            height: 20,
          ),

             ListView.builder(
               shrinkWrap: true,
               itemCount: data.length,
                 itemBuilder: (contex,index){
                   // var date=DateTime(int.parse(list[index].createDate.toString()));
                   // print(date);


                     // var f = DateFormat('E, d MMM yyyy HH:mm:ss');
                     // var date = f.format(DateFormat(TimeOfDay.fromDateTime()).toUtc()) + " GMT";
                   //  print(date);
               return GestureDetector(
                 onTap: (){
                   print(
                       list[index].createDate.toString() ?? ""
                   );

                 },
                 child: Column(
                   children: [
                     CustomTable(


                 // heading: ['Trades', 'P/Ps', 'Time'],
                       firstList:
                       [
                         data[index]['username'].toString(),
                         data[index]['totalProfit'].toString(),
                        // data[index]['totalProfit'].toString(),
                         data[index]['createdAt'].toString()
                       ],
                       // secondList: ['Jpy/USD', '40', '74'],
                       // thirdList: ['BTC/USD', '71', '17'],
                       // fourthList: ['XUA/USD', '67', '11']
                     ),

                   ],
                 ),
               );
               //   Column(children: [
               //   Row(
               //     children: [
               //      Column(children: [
               //        Text(list[index].username ?? "null"),
               //        SizedBox(height: 2,),
               //        Divider(color: Colors.grey,)
               //      ],)
               //     ],
               //   ),
               // ],);
             }),

          // CustomTable(
          //     heading: ['Trades', 'P/Ps', 'Time'],
          //     firstList: [list[1].username ?? "null", '20', '55'],
          //     secondList: ['Jpy/USD', '40', '74'],
          //     thirdList: ['BTC/USD', '71', '17'],
          //     fourthList: ['XUA/USD', '67', '11'])
        ],
      ),
    );
  }

  Table CustomTable({
   // required List<String> heading,
    required List<String> firstList,
    // required List<String> secondList,
    // required List<String> thirdList,
    // required List<String> fourthList,
  }) {
    return Table(
      border: TableBorder.all(),
      columnWidths: {
        0: FractionColumnWidth(0.5),
        1: FractionColumnWidth(0.15),
        2: FractionColumnWidth(0.35),

      },
      children: [
        //ReusableTableRow(heading),
        ReusableTableRow(firstList),
        // ReusableTableRow(secondList),
        // ReusableTableRow(thirdList),
        // ReusableTableRow(fourthList),
      ],
    );
  }
}

class ProfitLoss {
  ProfitLoss(this.day, this.profit);

  final String day;
  final double profit;
}
