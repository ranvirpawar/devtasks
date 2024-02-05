import 'package:devtasks/http/users.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:get/get.dart';

// Add this line to import the 'intl' package

class HomePage extends StatelessWidget {
  String currentDate = CurrentDate().getCurrentDate();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            child: new Text(currentDate),
            color: Colors.teal[100],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('How'),
            color: Colors.teal[200],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('you'),
            color: Colors.teal[300],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: TextButton(
                onPressed: () {
                  Get.to(() => DataFromAPI());
                },
                child: const Text('USER Data')),
            color: Colors.teal[400],
          )
        ],
      ),
    );
  }
}

class CurrentDate {
  String getCurrentDate() {
    var now = DateTime.now();
    var formatter = DateFormat(
        'yyyy-MM-dd'); // Add this line to define the 'DateFormat' class
    String formattedDate = formatter.format(now);
    return formattedDate;
  }
}
