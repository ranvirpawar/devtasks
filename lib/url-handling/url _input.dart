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

  void updateIcon(String url) {
    String? extension = url.split('.').last;
    if (extensions.containsKey(extension)) {
      icon.value = extensions[extension]!;
    } else {
      icon.value = Icons.link;
    }
  }
}

class UrlIconPage extends StatelessWidget {
  final UrlIconController urlController = Get.put(UrlIconController());

  UrlIconPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Hardcoded URL
    const String Url = "https://example.com/document.pdf";

    // Update icon based on the hardcoded URL
    urlController.updateIcon(Url);

    return Scaffold(
      appBar: AppBar(title: const Text("URL Input")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(() => Icon(urlController.icon.value)),
              const SizedBox(width: 8.0),
              const Text(
                Url,
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
