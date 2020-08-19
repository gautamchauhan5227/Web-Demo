import 'package:fl_animated_linechart/chart/area_line_chart.dart';
import 'package:fl_animated_linechart/common/pair.dart';
import 'package:fl_animated_linechart/fl_animated_linechart.dart';
import 'package:flutter/material.dart';

import '../fack.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with FakeChartSeries {
  int chartIndex = 0;

  @override
  Widget build(BuildContext context) {
    Map<DateTime, double> line1 = createLine1();

    LineChart chart;

    if (chartIndex == 0) {
      chart = LineChart.fromDateTimeMaps(
        [line1],
        [Colors.green],
        ['C'],
      );
    }

    return Scaffold(
      body: Container(
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black45),
                            borderRadius: BorderRadius.all(Radius.circular(3))),
                        child: Text(
                          'LineChart',
                          style: TextStyle(
                              color: chartIndex == 0
                                  ? Colors.black
                                  : Colors.black12),
                        ),
                        onPressed: () {
                          setState(() {
                            chartIndex = 0;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimatedLineChart(
                  chart,
                  key: UniqueKey(),
                ), //Unique key to force animations
              )),
              SizedBox(width: 200, height: 50, child: Text('')),
            ]),
      ),
    );
  }
}
