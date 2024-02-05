import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UrlIconController extends GetxController {
  final Rx<IconData> icon = Icons.link.obs;

  final Map<String, IconData> extensions = {
    "pdf": Icons.picture_as_pdf,
    "docx": Icons.description,
    "ppt": Icons.slideshow,
    "xls": Icons.numbers,
    "zip": Icons.compress,
  };

  void updateUrl(String url) {
    String? extension = url.split('.').last;
    if (extensions.containsKey(extension)) {
      icon.value = extensions[extension]!;
    } else {
      icon.value = Icons.link;
    }
  }
}

class UrlIconPage extends StatelessWidget {
  final urlController = Get.put(UrlIconController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("URL Input")),
      body: Center(
        child: TextField(
          onChanged: (url) => urlController.updateUrl(url),
          decoration: InputDecoration(
              labelText: "Enter url",
              prefixIcon: Obx(() => Icon(urlController.icon.value))),
        ),
      ),
    );
  }
}
