import 'package:data_analysis/charts/bar_chart.dart';
import 'package:data_analysis/charts/dynamic.dart';
import 'package:data_analysis/charts/pie_charts.dart';
import 'package:data_analysis/circular_gauge_chart/circulargauge.dart';
import 'package:data_analysis/radial_graphs/radialgraphs.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:data_analysis/services/employee.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<Employee> _employees = [];

  Future<void> _fetchData() async {
    try {
      final response =
          await Dio().get('https://dummy.restapiexample.com/api/v1/employees');

      if (response.statusCode == 200) {
        final List<dynamic> employeeData = response.data['data'];

        // _employees =
        //     employeeData.map((json) => Employee.fromJson(json)).toList();
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(
        //     content: Text('Data fetched successfully'),
        //   ),
        // );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to fetch data'),
          ),
        );
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Chart '),
      ),
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _fetchData,
                child: const Text('fetch data'),
              ),

              // ElevatedButton(
              //   onPressed: _employees != null
              //       ? () {
              //           if (_employees.isNotEmpty) {
              //             Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                 builder: (context) => BarChartPage(
              //                     key: Key('barChart'), employees: _employees),
              //               ),
              //             );
              //           }
              //         }
              //       : null,
              //   style: ButtonStyle(
              //     backgroundColor: _employees != null && _employees.isNotEmpty
              //         ? MaterialStateProperty.all(Colors.blue)
              //         : MaterialStateProperty.all(Colors.grey),
              //   ),
              //   child: Text('Bar Chart'),
              // ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PieChartSample2(),
                    ),
                  );
                },
                child: Text('Pie Chart'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChartPage(),
                    ),
                  );
                },
                child: Text('Dynamic Chart '),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RadialChart(),
                    ),
                  );
                },
                child: Text('Radial Chart'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SpeedometerChart(),
                    ),
                  );
                  // Navigator.push(
                  //     context,
                  // MaterialPageRoute(
                  // builder: (context) => SalaryComparisonGauge(
                  //   persons: [
                  //     Person('John', 50000),
                  //     Person('Alice', 60000),
                  //     Person('Bob', 70000),
                  //     Person('Carol', 55000),
                  //     Person('David', 75000),
                  //     Person('Emily', 80000),
                  //     Person('Frank', 65000),
                  //     Person('Grace', 72000),
                  //     Person('Henry', 68000),
                  //     Person('Ivy', 59000),
                  //   ],
                  //   averageSalary: 67000,
                  // ),
                  // ));
                },
                child: Text('Radial Gauge chart'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
