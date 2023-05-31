import 'package:flutter/material.dart';
import '../../../core/utils/line_separator.dart';

class ReportHeader extends StatelessWidget {
  const ReportHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [                 
              LineSeperator(color: Colors.grey,height: 1,),
               Padding(padding: EdgeInsets.symmetric(vertical: 10), ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                Text("Label"),
                  Text("Name"),
                  Text("Analysis Data"),
                  Text("Action")
                ],
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10), ),
              LineSeperator(color: Colors.grey,height: 1,)
              ],)
              
              
              
              );
  }
}