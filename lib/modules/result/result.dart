import 'package:flutter/material.dart';
import 'package:onsite/core/utils/line_separator.dart';
import 'package:pie_chart/pie_chart.dart';


class ResultPage extends StatefulWidget {
  ResultPage(
      {Key key,
      @required this.patientName,
      @required this.patientId,
      @required this.patientAnalysisData})
      : super(key: key);
  final String patientName;
  final String patientId;
  final String patientAnalysisData;

  @override
  _ResultPageState createState() => _ResultPageState();
}


class _ResultPageState extends State<ResultPage> {
  String title = "Result Analysis";
  double tbPoint = 0.9;
  double tbRemainPoint = 1;
  @override
  void initState(){
    super.initState();
     widget.patientAnalysisData == null?
    tbPoint = 0 :
        tbPoint = double.parse(widget.patientAnalysisData);
  }

  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {"TB": tbPoint, "": 1 - tbPoint};

    List<Color> colorList = [Colors.redAccent, Colors.green, Colors.blue];

    BoxShape legendShape = BoxShape.circle;

    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )
            ],
          ),
        ),
        body: Container(
            //padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
            child: Material(
          type: MaterialType.card,
          elevation: 0,
          child: Container(
            height: MediaQuery.of(context).size.height / 2 +
                30, // // padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),

            color: Color(0xFFFFFFF),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                LineSeperator(
                  color: Colors.grey,
                  height: 1,
                ),
                Text(
                  "TB Client Precision Information",
                ),
                LineSeperator(
                  color: Colors.grey,
                  height: 1,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 25,
                ),
                Material(
                  type: MaterialType.card,
                  elevation: 3,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Patient ID   :",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(widget.patientId,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width / 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Patient Name :",
                                style: TextStyle(color: Colors.grey)),
                            Text(widget.patientName,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 12,
                ),
                PieChart(
                  dataMap: dataMap,
                  animationDuration: Duration(milliseconds: 800),
                  chartLegendSpacing: 32,
                  chartRadius: MediaQuery.of(context).size.width / 2,
                  colorList: colorList,
                  initialAngleInDegree: 0,
                  chartType: ChartType.ring,
                  ringStrokeWidth: 32,
                  centerText: "${tbPoint * 100}%",
                  legendOptions: LegendOptions(
                    showLegendsInRow: false,
                    legendPosition: LegendPosition.right,
                    showLegends: true,
                    legendShape: legendShape,
                    legendTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  chartValuesOptions: ChartValuesOptions(
                    showChartValueBackground: true,
                    showChartValues: true,
                    showChartValuesInPercentage: true,
                    showChartValuesOutside: true,
                  ),
                )
              ],
            ),
          ),
        )));
  }
}
