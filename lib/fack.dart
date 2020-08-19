import 'dart:math';

var rng = new Random();

class FakeChartSeries {
  Map<DateTime, double> createLineData(double factor) {
    Map<DateTime, double> data = {};
    for (int c = 50; c > 0; c--) {
      data[DateTime.now().subtract(Duration(minutes: c))] =
          c.toDouble() * factor;
    }
    return data;
  }

  Map<DateTime, double> createLine1() {
    Map<DateTime, double> data = {};
    data[DateTime.now().subtract(Duration(minutes: 140))] = rng.nextDouble();
    data[DateTime.now().subtract(Duration(minutes: 130))] = rng.nextDouble();
    data[DateTime.now().subtract(Duration(minutes: 125))] = rng.nextDouble();
    data[DateTime.now().subtract(Duration(minutes: 120))] = rng.nextDouble();
    data[DateTime.now().subtract(Duration(minutes: 115))] = rng.nextDouble();
    data[DateTime.now().subtract(Duration(minutes: 112))] = rng.nextDouble();
    data[DateTime.now().subtract(Duration(minutes: 105))] = rng.nextDouble();
    data[DateTime.now().subtract(Duration(minutes: 40))] = rng.nextDouble();
    data[DateTime.now().subtract(Duration(minutes: 30))] = rng.nextDouble();
    data[DateTime.now().subtract(Duration(minutes: 25))] = rng.nextDouble();
    data[DateTime.now().subtract(Duration(minutes: 20))] = rng.nextDouble();
    data[DateTime.now().subtract(Duration(minutes: 15))] = rng.nextDouble();
    data[DateTime.now().subtract(Duration(minutes: 12))] = rng.nextDouble();
    data[DateTime.now().subtract(Duration(minutes: 5))] = rng.nextDouble();
    return data;
  }
}
