import 'package:flutter/material.dart';
import 'package:onsite/app_state/questionare_state.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

class ResultPage extends StatefulWidget {
  ResultPage({Key key}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String title = "Result Analysis";
  double tbPoint = 0.9;
  double tbRemainPoint = 1;
  @override
  void initState() {
    super.initState();
     tbPoint =    Provider.of<QuestionareState>(context, listen: false)
                .analysisResult; }

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
                height: MediaQuery.of(context).size.height /
                    2, // // padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),

                color: Color(0xFFFFFFF),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "TB Precision Approximation",
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
