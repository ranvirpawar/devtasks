import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RadialChart extends StatelessWidget {
  final List<Employee> employees = [
    Employee('John', 50000, Colors.red),
    Employee('Alice', 60000, Colors.green),
    Employee('Bob', 70000, Colors.blue),
    Employee('Carol', 55000, Colors.orange),
    Employee('David', 75000, Colors.purple),
    Employee('Emily', 80000, Colors.yellow),
    Employee('Frank', 65000, Colors.teal),
    Employee('Grace', 72000, Colors.cyan),
    Employee('Henry', 68000, Colors.pink),
    Employee('Ivy', 59000, Colors.brown),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radial Chart '),
      ),
      body: Center(
        child: Container(
          color: Colors.blue,
          height: 700,
          child: Stack(
            children: [
              SfCircularChart(
                title: ChartTitle(
                  text: 'Employee Salary',
                  alignment: ChartAlignment.near,
                ),
                series: <RadialBarSeries<Employee, String>>[
                  RadialBarSeries<Employee, String>(
                    dataSource: employees,
                    xValueMapper: (Employee employee, _) => employee.name,
                    yValueMapper: (Employee employee, _) => employee.salary,
                    pointColorMapper: (Employee employee, _) =>
                        employee.color, // Assigning colors to employees
                    cornerStyle: CornerStyle.endCurve,
                    innerRadius: '20%',
                    trackColor: Colors.deepPurple,
                    gap: '0',
                    radius: '250', // Adjust inner radius for the radial effect
                    maximumValue: 100000, // Maximum value for the chart
                  ),
                ],
                annotations: <CircularChartAnnotation>[
                  CircularChartAnnotation(
                    widget: Container(
                      child: Text(
                        ' Salary',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: employees.map((employee) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              width: 12,
                              height: 12,
                              color: employee.color,
                            ),
                            SizedBox(width: 4),
                            Text(
                              employee.name,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Employee {
  final String name;
  final int salary;
  final Color color; // Added color property

  Employee(this.name, this.salary, this.color);
}
