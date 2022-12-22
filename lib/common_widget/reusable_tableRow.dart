import 'package:flutter/material.dart';
TableRow ReusableTableRow(List<String> cells,{isHeader = false}){
  return TableRow(
      children: cells.map((e) => Padding(
        padding: EdgeInsets.all(10),
        child: Text(e,style: TextStyle(fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,),),
      )).toList()
  );
}