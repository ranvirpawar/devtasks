import 'dart:async';
import 'dart:io';

import 'package:devtasks/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    print('Error caught by FlutterError.onError: ${details.exception}');
    print('Stack trace: ${details.stack}');
  };

  runZonedGuarded(() async {
    runApp(MyApp());
  }, (error, stackTrace) {
    // Handle all exceptions here in a centralized manner
    print("Error occurred: $error");
    print("StackTrace: $stackTrace");
    showDialog(
      barrierDismissible: false,
      context: Get.overlayContext!,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error occurred'),
          content: Text('$error'),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  });

  // Setup error handling for widget errors
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return ErrorWidget(details.exception!);
  };
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
