import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:locked_wallet/models/week2.dart';
import 'package:locked_wallet/models/week3.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../models/week4.dart';
class WeeklyEarning extends StatefulWidget {
  const WeeklyEarning({Key? key}) : super(key: key);

  @override
  State<WeeklyEarning> createState() => _WeeklyEarningState();
}

class _WeeklyEarningState extends State<WeeklyEarning> {
  void initState() {
    super.initState();
    firstWeek();
    secondWeek();
    thirdWeek();
    forthWeek();
  }
  firstWeek()async{
    var headers = {
      'Authorization': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImJpcGluMTIzNEB0ZXN0LmNvbSIsImlhdCI6MTY3MTE4MjI1MX0.oqI_vc868nkJ24CeCtLXcyrxnJW3QM15cxFsdOmrFf0',
      'Cookie': 'connect.sid=s%3Akl5SvZTkz-3fQwmXsKewBlW05RKa_LjV.DHFs1ZvHP%2FbrrPgXXmCBrZotBftv9%2FU%2FFvo%2FRYTvVTo'
    };
    var request = http.Request('GET', Uri.parse('https://api.lockedvaultenterprises.com/api/user/week1/profit'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
     // print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      print("body is == $body");
      weekOne = body['totalProfit'];
      print(" wee body is == $weekOne");
      setState(() {
        
      });
    }
    else {
    print(response.reasonPhrase);
    }

  }
  secondWeek()async{
    var headers = {
      'Authorization': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImJpcGluMTIzNEB0ZXN0LmNvbSIsImlhdCI6MTY3MTE4MjI1MX0.oqI_vc868nkJ24CeCtLXcyrxnJW3QM15cxFsdOmrFf0',
      'Cookie': 'connect.sid=s%3ABr9bRA-jt_G2RaOu2kIF14zAVXsF4kI0.gkCq6rVfjMANN9wrOKV%2B4iyjVhJySyaPbLOny%2BUc1ho'
    };
    var request = http.Request('GET', Uri.parse('https://api.lockedvaultenterprises.com/api/user/week2/profit'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
     // print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      weekTwo = body['totalProfit'];

      setState(() {

      });
    }
    else {
      print(response.reasonPhrase);
    }

  }
  thirdWeek()async{
    var headers = {
      'Authorization': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImJpcGluMTIzNEB0ZXN0LmNvbSIsImlhdCI6MTY3MTE4MjI1MX0.oqI_vc868nkJ24CeCtLXcyrxnJW3QM15cxFsdOmrFf0',
      'Cookie': 'connect.sid=s%3AlxqO18RM7HECRsgUIUqgu23iekFEEqiO.6E5DfAlK5FKeurbUhr9gaaTYYXGPqxW3Ia37LvBhiyQ'
    };
    var request = http.Request('GET', Uri.parse('https://api.lockedvaultenterprises.com/api/user/week3/profit'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      weekThree = body['totalProfit'];

      setState(() {

      });
    }
    else {
      print(response.reasonPhrase);
    }

  }
  forthWeek()async{
    var headers = {
      'Authorization': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImJpcGluMTIzNEB0ZXN0LmNvbSIsImlhdCI6MTY3MTE4MjI1MX0.oqI_vc868nkJ24CeCtLXcyrxnJW3QM15cxFsdOmrFf0',
      'Cookie': 'connect.sid=s%3AJCBdeDSx-j5UTyYDpomwth0PbJU4gAEl.F2TxguT1j81Dy42TKBqGNnidjpSXmHFK6OQ76e1M%2FGU'
    };
    var request = http.Request('GET', Uri.parse('https://api.lockedvaultenterprises.com/api/user/week4/profit'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
     // print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);

      setState(() {
        weekFour = body['totalProfit'];
      });
    }
    else {
      print(response.reasonPhrase);
    }

  }
 // var  message;
  var  weekOne;
  var weekTwo;
  var  weekThree;
  var  weekFour;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
        itemBuilder: (context, index){
      return
        weekThree  ==null && weekTwo ==null && weekFour==null&& weekOne ==null?
        Center(child: Text("Loading....."),):
        Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height*.5,
            child: SfCartesianChart(
                palette: [Color(0xFF0C331F)],
                primaryXAxis: CategoryAxis(
                    title: AxisTitle(text: 'Weeks')
                ),

                primaryYAxis: NumericAxis(title: AxisTitle(text: 'Earnings')
                ),

                series: <ChartSeries>[
                  ColumnSeries<EarningModel, String>(
                      dataSource:  <EarningModel>[

                        EarningModel('Week 1', double.parse(weekOne == null? "0": weekOne.toString())),
                        EarningModel('Week 2', double.parse(weekTwo == null? "0": weekTwo.toString())),
                        EarningModel('Week 3',   double.parse( weekThree == null? "0":
                            weekThree.toString())),
                        EarningModel('Week 4', double.parse( weekFour == null? "0":weekFour.toString())),

                      ],
                      xValueMapper: (EarningModel sales, _) => sales.week,
                      yValueMapper: (EarningModel sales, _) => sales.earning,
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
                "This Week Earning  =",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 30,
              ),
              GestureDetector(
                onTap: (){
                  firstWeek();
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xFF0C331F))
                  ),
                  child:
                  weekOne == null ? CircularProgressIndicator():
                  Text(

                    weekOne.toString(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ],
      );
    });
  }
}
class EarningModel {
  EarningModel(this.week, this.earning);
  final String week;
  final double earning;
}