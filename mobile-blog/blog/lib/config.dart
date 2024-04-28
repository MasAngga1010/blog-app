// ignore_for_file: prefer_const_declarations, prefer_const_constructors

import 'package:flutter/material.dart';

class AppColor {
  static const Color primaryColor = Color(0xff023047);
  static const Color secondColor = Color(0xff495057);
  static const Color sekunderColor = Color(0xff777777);
  static const Color borderColor = Color(0xffF0F0F0);
  static const Color textColor = Color(0xffAAAAAA);
  static const Color strokeColor = Color(0xffF0F0F0);
  static const Color hintColor = Color(0xffBEBEBE);
}

//configurasi IP
class ApiConfig {
  static final String baseUrl = "http://10.0.2.2:8000/api";
}

// alert
class AfterDialog {
  final String title;
  final String content;
  final String buttonText;

  AfterDialog({
    required this.title,
    required this.content,
    required this.buttonText,
  });

  void show(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  buttonText,
                  style: TextStyle(
                    color: AppColor.primaryColor,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          );
        },
      );
    });
  }
}
