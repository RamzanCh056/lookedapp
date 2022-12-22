import 'package:flutter/material.dart';
import 'package:locked_wallet/screens/user_dashboard/tabs/running_monthl_total_roz.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class RozByWeek extends StatelessWidget {
  const RozByWeek({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: SfCartesianChart(
              primaryXAxis: CategoryAxis(
                  title: AxisTitle(text: 'Dates')
              ),

              primaryYAxis: NumericAxis(title: AxisTitle(text: 'Percentage')),
              // Enable legend
              legend: Legend(isVisible: true),
              // Enable tooltip
              palette: [Color(0xFF0C331F)],
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <LineSeries<GraphModel, String>>[
                LineSeries<GraphModel, String>(
                    dataSource: <GraphModel>[
                      GraphModel('12/5/2022', 2),
                      GraphModel('2/6/2022', 6),
                      GraphModel('2/6/2022', 13),
                      GraphModel('1/7/2022', 15),
                      GraphModel('1/7/2022', 17),
                      GraphModel('12/8/2022', 25),
                      GraphModel('12/11/2022', 30)
                    ],
                    xValueMapper: (GraphModel sales, _) => sales.year,
                    yValueMapper: (GraphModel sales, _) => sales.sales,
                    // Enable data label
                    dataLabelSettings: DataLabelSettings(isVisible: true))
              ]),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Text(
              "This Week % Roz =",
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
                "30%",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ],
    );
  }
}
