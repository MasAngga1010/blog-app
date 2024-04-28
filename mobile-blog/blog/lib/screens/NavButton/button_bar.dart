// ignore_for_file: file_names

import 'package:blog/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonBarr extends StatelessWidget {
  const ButtonBarr({
    Key? key,
    required this.isActive,
    required this.text,
    required this.icons,
  }) : super(key: key);

  final bool isActive;
  final String text;
  final Icon icons;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: 60.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icons.icon,
            size: icons.size,
            color: isActive ? Colors.white : AppColor.textColor,
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            text,
            style: TextStyle(
              color: isActive ? Colors.white : AppColor.textColor,
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
