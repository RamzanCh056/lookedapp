import 'package:flutter/material.dart';

import '../../../common_widget/reusable_tableRow.dart';

class WithdrawHistory extends StatelessWidget {
  const WithdrawHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Table(
          border: TableBorder.all(),
          columnWidths: {
            0: FractionColumnWidth(0.5),
            1: FractionColumnWidth(0.25),
            2: FractionColumnWidth(0.25),
            3: FractionColumnWidth(0.25),
            4: FractionColumnWidth(0.25),
          },
          children: [
            ReusableTableRow(['WithDraw Methode','Amount','Date','Time'],isHeader: true),
            ReusableTableRow(['Btc Wallet','400','1/12/2022', '12:00'],),

          ],
        )
      ],
    );
  }
}
