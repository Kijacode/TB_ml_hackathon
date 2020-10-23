import 'package:flutter/material.dart';


class Report extends StatefulWidget {
  Report({Key key}) : super(key: key);

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: Container(
       child: Text("Qestionare"),
    ),
    );
  }
}