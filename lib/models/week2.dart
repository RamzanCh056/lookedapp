

class WeekTwo{
  String? totalProfit;

  WeekTwo({this.totalProfit});


  WeekTwo.fromJson(Map<String, dynamic> json) {
    totalProfit = json['totalProfit'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalProfit'] = this.totalProfit;

    return data;
  }
}