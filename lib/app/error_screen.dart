import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen(this.error, {Key? key}) : super(key: key);

  final Object error;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: GestureDetector(
        onTap: () => App.copyToClipboard(error.toString()),
        onDoubleTap: () => Get.back(),
        child: Scaffold(
          backgroundColor: Colors.red,
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(16),
              child: Center(
                child: Text(
                  error.toString(),
                  style: const TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
