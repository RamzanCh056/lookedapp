import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:locked_wallet/common_widget/state_info.dart';
import 'package:locked_wallet/screens/admin_dashboard/admin_dashboard.dart';
import 'package:locked_wallet/screens/signup_screen/signup_screen.dart';
import 'package:locked_wallet/screens/user_dashboard/user_dashboard.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart' as http;

class DailyProfitLoss extends StatefulWidget {
  const DailyProfitLoss({Key? key}) : super(key: key);

  @override
  State<DailyProfitLoss> createState() => _DailyProfitLossState();
}

class _DailyProfitLossState extends State<DailyProfitLoss> {
  var body;
  Week1()async{
    var headers = {
      'Authorization': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImJpcGluMTIzNEB0ZXN0LmNvbSIsImlhdCI6MTY3MTE4MjI1MX0.oqI_vc868nkJ24CeCtLXcyrxnJW3QM15cxFsdOmrFf0',
      'Cookie': 'connect.sid=s%3Akl5SvZTkz-3fQwmXsKewBlW05RKa_LjV.DHFs1ZvHP%2FbrrPgXXmCBrZotBftv9%2FU%2FFvo%2FRYTvVTo'
    };
    var request = http.Request('GET', Uri.parse('https://api.lockedvaultenterprises.com/api/user/week1/profit'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
   body = jsonDecode(res);
   print(body);

    }
    else {
      print(response.reasonPhrase);
    }

  }

  @override
  Widget build(BuildContext context) {
    return    FutureBuilder(
        future: Week1(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data != null || body != null) {
            return ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: 1,
                itemBuilder: (context, index) {
                  return    Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height*.5,
                        child: SfCartesianChart(
                            palette: [Color(0xFF0C331F)],
                            primaryXAxis: CategoryAxis(
                                title: AxisTitle(text: 'Days')
                            ),

                            primaryYAxis: NumericAxis(title: AxisTitle(text: 'Profit / Loss')),
                            series: <ChartSeries>[
                              ColumnSeries<ProfitLoss, String>(
                                  dataSource:  <ProfitLoss>[
                                    ProfitLoss('1', double.parse( body['totalProfit'].toString(),)),
                                    ProfitLoss('2',double.parse( body['totalProfit'].toString(),)),
                                    ProfitLoss('3', double.parse( body['totalProfit'].toString(),)),
                                    ProfitLoss('4', double.parse( body['totalProfit'].toString(),)),

                                  ],
                                  xValueMapper: (ProfitLoss sales, _) => sales.day,
                                  yValueMapper: (ProfitLoss sales, _) => sales.profit,
                                  dataLabelSettings: DataLabelSettings(
                                      isVisible: true
                                  )
                              )
                            ]
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "Today Profit  =",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            padding: EdgeInsets.all(15),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Color(0xFF0C331F))
                            ),
                            child: Text(
                              body['totalProfit'].toString(),
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ],
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });



  }
}
class ProfitLoss {
  ProfitLoss(this.day, this.profit);
  final String day;
  final double profit;
}