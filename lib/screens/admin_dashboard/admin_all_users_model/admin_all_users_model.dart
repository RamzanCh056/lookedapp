

class UserModel{
   String? username;
   String? createDate;
   String? totalProfit;


  bool? isSelected;

  UserModel({this.username,  this.isSelected = false, this.createDate , this.totalProfit});


  UserModel.fromJson(Map<String, dynamic> json) {
    username = json['username'] ;
    createDate = json['createdAt'];
    createDate = json['totalProfit'];

    isSelected = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username ?? "";
    data['createdAt'] = this.createDate;
    data['totalProfit'] = this.totalProfit ?? "";

    isSelected = false;
    return data;
  }
}