import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:data_analysis/services/employee.dart';

class BarChartPage extends StatelessWidget {
  final List<Employee> employees;

  const BarChartPage({required Key key, required this.employees})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bar Chart'),
      ),
      body: Container(
        height: 500,
        width: double.infinity,
        child: Center(
          child: SizedBox(
            width:
                MediaQuery.of(context).size.width, // Set width to screen width
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  
                  BarChart(
                    BarChartData(
                      barTouchData: BarTouchData(
                        touchTooltipData: BarTouchTooltipData(
                          tooltipBgColor: Colors.blueGrey,
                          getTooltipItem: (group, groupIndex, rod, rodIndex) {
                            return BarTooltipItem(
                              rod.toY.round().toString(),
                              const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                      ),
                  
                      alignment: BarChartAlignment
                          .spaceEvenly, // Evenly distribute space between groups
                      maxY: employees
                          .map<int>((e) => e.salary)
                          .reduce(
                              (value, element) => value > element ? value : element)
                          .toDouble(),
                  
                      titlesData: const FlTitlesData(
                        show: true,
                      ),
                      borderData: FlBorderData(
                        show: true,
                        border: const Border(
                          bottom: BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                          left: BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                      ),
                      barGroups: employees
                          .asMap()
                          .entries
                          .map(
                            (entry) => BarChartGroupData(
                              x: entry.key.toInt(),
                              barRods: [
                                BarChartRodData(
                                  toY: entry.value.salary.toDouble(),
                                  color: Colors.redAccent,
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
