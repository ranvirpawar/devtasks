import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ApiCallController extends GetxController {
  final Dio _dio = Dio();
  RxBool isLoading = false.obs;

  void makeApiCall() async {
    isLoading.value = true; // Set isLoading to true to show loading animation
    Stopwatch sw = Stopwatch()..start();
    try {
      // Make API call with Dio
      final response =
          await _dio.get('https://jsonplaceholder.typicode.com/users');
      sw.stop();
      int timeTaken = sw.elapsedMilliseconds;
      print('API call took ${timeTaken}ms');

      if (timeTaken > 5000) {
        Get.snackbar(
          "Slow API",
          "API call took ${timeTaken}ms",
          snackPosition: SnackPosition.BOTTOM,
        );
      }

      // Show time taken in snackbar
      Get.snackbar(
        "API Call Completed",
        "API call took ${timeTaken}ms",
        snackPosition: SnackPosition.BOTTOM,
      );

      // Process response
      update();
    } catch (error) {
      print(error);
    } finally {
      isLoading.value =
          false; // Set isLoading to false to hide loading animation
    }
  }
}

class ApiCallPage extends StatelessWidget {
  // Remainder of UI code

  @override
  Widget build(BuildContext context) {
    final apiCtrl = Get.put(ApiCallController());

    return Scaffold(
      body: Center(
        child: Obx(() {
          return apiCtrl.isLoading.value
              ? CircularProgressIndicator() // Show loading animation
              : ElevatedButton(
                  onPressed: () {
                    apiCtrl.makeApiCall();
                  },
                  child: Text('Make API Call'),
                );
        }),
      ),
    );
  }
}
