import 'package:devtasks/http/connectivity.dart';
import 'package:devtasks/http/controller.dart';
import 'package:devtasks/http/users.dart';
import 'package:devtasks/url-handling/url%20_input.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:get/get.dart';

// Add this line to import the 'intl' package

class HomePage extends StatelessWidget {
  String currentDate = CurrentDate().getCurrentDate();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[100],
            child: Text(currentDate),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.red,
            child: TextButton(
                onPressed: () {
                  Get.to(() => UrlIconPage());
                },
                child: const Text('Url Input')),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[300],
            child: TextButton(
                onPressed: () {
                  Get.to(() => ApiCallPage());
                },
                child: const Text('api connectivity')),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[400],
            child: TextButton(
                onPressed: () {
                  Get.to(() => const DataFromAPI());
                  // throw Exception('manual exception');
                },
                child: const Text('USER Data')),
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
