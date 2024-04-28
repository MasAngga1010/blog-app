// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

Widget myShimmer() {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 150.w,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[200]!,
            borderRadius: BorderRadius.circular(14.r),
          ),
        ),
        SizedBox(height: 8.h),
        // Teks shimmer placeholder
        Container(
          height: 12.h,
          width: double.infinity,
          color: Colors.grey[200]!,
        ),
        SizedBox(height: 8.h),
        Container(
          height: 12.h,
          width: double.infinity,
          color: Colors.grey[200]!,
        ),
      ],
    ),
  );
}
