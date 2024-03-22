import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SalaryComparisonGauge extends StatefulWidget {
  final List<Person> persons;
  final double averageSalary;

  SalaryComparisonGauge({required this.persons, required this.averageSalary});

  @override
  _SalaryComparisonGaugeState createState() => _SalaryComparisonGaugeState();
}

class _SalaryComparisonGaugeState extends State<SalaryComparisonGauge> {
  late double currentSalary;

  @override
  void initState() {
    super.initState();
    currentSalary = widget.averageSalary; // Initialize with the average salary
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Salary Comparison Gauge'),
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300,
                width: 300,
                child: SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                      minimum: 0,
                      maximum: widget.averageSalary * 1.5,
                      ranges: <GaugeRange>[
                        GaugeRange(
                          startValue: 0,
                          endValue: widget.averageSalary * 0.5,
                          color: Colors.red,
                          startWidth: 50,
                          endWidth: 50,
                          label: 'below average',
                        ),
                        GaugeRange(
                          startValue: widget.averageSalary * 0.5,
                          endValue: widget.averageSalary * 1.0,
                          color: Colors.yellow,
                          startWidth: 50,
                          endWidth: 50,
                          label: 'average',
                        ),
                        GaugeRange(
                          startValue: widget.averageSalary * 1.0,
                          endValue: widget.averageSalary * 1.5,
                          color: Colors.green,
                          startWidth: 50,
                          endWidth: 50,
                          label: 'above average',
                        ),
                      ],
                      pointers: <GaugePointer>[
                        NeedlePointer(
                          value: currentSalary,
                          needleLength: 0.8,
                          needleColor: Colors.blue,
                          knobStyle: const KnobStyle(knobRadius: 0.1),
                          tailStyle: const TailStyle(
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
              SizedBox(height: 20),
              Text(
                '',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 10,
                children: widget.persons.map((person) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentSalary = person.salary;
                      });
                    },
                    child: Chip(
                      label: Text(person.name),
                      backgroundColor: currentSalary == person.salary
                          ? Colors.blue
                          : Colors.grey,
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Person {
  final String name;
  final double salary;

  Person(this.name, this.salary);
}
