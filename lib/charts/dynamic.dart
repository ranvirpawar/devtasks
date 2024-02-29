import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChartPage extends StatelessWidget {
  final List<Employee> employees = [
    Employee('John', 50000),
    Employee('Alice', 60000),
    Employee('Bob', 70000),
    Employee('Carol', 55000),
    Employee('David', 75000),
    Employee('Emily', 80000),
    Employee('Frank', 65000),
    Employee('Grace', 72000),
    Employee('Henry', 68000),
    Employee('Ivy', 59000),
  ];

  final ChartTypeController chartTypeController =
      Get.put(ChartTypeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic Charts'),
      ),
      body: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: _buildChart(),
              ),
            ),
            _buildChartTypeSelector(),
          ],
        ),
      ),
    );
  }

  Widget _buildChart() {
    switch (chartTypeController.chartType.value) {
      case ChartType.bar:
        return _buildBarChart();
      case ChartType.pie:
        return _buildPieChart();
      case ChartType.line:
        return _buildLineChart();
      case ChartType.scatter:
        return _buildScatterChart();
      case ChartType.radar:
        return _buildRadarChart();
      default:
        return Container();
    }
  }

  Widget _buildChartTypeSelector() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: ChartType.values.map((type) {
          return ElevatedButton(
            onPressed: () {
              chartTypeController.setChartType(type);
            },
            child: Text(type.toString().split('.').last),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildBarChart() {
    return BarChart(
      BarChartData(
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        barGroups: employees
            .asMap()
            .map(
              (index, employee) => MapEntry(
                index,
                BarChartGroupData(
                  x: index,
                  barRods: [
                    BarChartRodData(
                      toY: employee.salary.toDouble(),
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
            )
            .values
            .toList(),
      ),
    );
  }

  Widget _buildPieChart() {
    return PieChart(
      PieChartData(
        sections: employees
            .map(
              (employee) => PieChartSectionData(
                value: employee.salary.toDouble(),
                title: employee.name,
                color: Color.fromRGBO(
                  employee.name.hashCode % 256,
                  (employee.name.hashCode ~/ 256) % 256,
                  (employee.name.hashCode ~/ 256 ~/ 256) % 256,
                  1,
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildLineChart() {
    // Implement Line Chart
    return Container();
  }

  Widget _buildScatterChart() {
    // Implement Scatter Chart
    return Container();
  }

  Widget _buildRadarChart() {
    return PieChart(
      PieChartData(
        sections: employees
            .map(
              (employee) => PieChartSectionData(
                value: employee.salary.toDouble(),
                title: employee.name,
                color: Color.fromRGBO(
                  employee.name.hashCode % 256,
                  (employee.name.hashCode ~/ 256) % 256,
                  (employee.name.hashCode ~/ 256 ~/ 256) % 256,
                  1,
                ),
                radius: 100, // Adjust radius to make it radial
              ),
            )
            .toList(),
        sectionsSpace: 0, // Remove space between sections for a radial effect
        borderData: FlBorderData(show: false),
        centerSpaceRadius: 0, // No center space
      ),
    );
  }
}

class Employee {
  final String name;
  final int salary;

  Employee(this.name, this.salary);
}

class ChartTypeController extends GetxController {
  var chartType = ChartType.bar.obs;

  void setChartType(ChartType type) {
    chartType.value = type;
  }
}

enum ChartType { bar, pie, line, scatter, radar }
