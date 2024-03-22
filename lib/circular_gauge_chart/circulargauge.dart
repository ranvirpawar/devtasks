import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SpeedometerChart extends StatelessWidget {
  const SpeedometerChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Speedometer Chart'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(16.0),
              height: 300,
              width: 300,
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    minimum: 0,
                    maximum: 100,
                    ranges: <GaugeRange>[
                      GaugeRange(
                        startValue: 0,
                        endValue: 30,
                        color: Colors.green,
                        label: 'Low',
                        startWidth: 50,
                        endWidth: 50,
                      ),
                      GaugeRange(
                        startValue: 30,
                        endValue: 70,
                        color: Colors.orange,
                        label: 'Moderate',
                        startWidth: 50,
                        endWidth: 50,
                      ),
                      GaugeRange(
                        startValue: 70,
                        endValue: 100,
                        color: Colors.red,
                        label: 'High',
                        startWidth: 50,
                        endWidth: 50,
                      )
                    ],
                    pointers: const  <GaugePointer>[
                      NeedlePointer(
                        value: 40,
                        needleLength: 0.8,
                        needleColor: Colors.blue,
                        knobStyle:
                            KnobStyle(knobRadius: 0.1, color: Colors.grey),
                        tailStyle: TailStyle(
                          color: Colors.blue,
                          width: 3,
                          lengthUnit: GaugeSizeUnit.factor,
                          length: 0.1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
