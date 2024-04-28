// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:blog/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Temukan extends StatefulWidget {
  const Temukan({super.key});

  @override
  State<Temukan> createState() => _TemukanState();
}

class _TemukanState extends State<Temukan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 3.w,
                ),
                Text(
                  "Temukan",
                  style: TextStyle(
                    color: AppColor.primaryColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.bookmark_border_outlined,
                  color: AppColor.hintColor,
                  size: 24.sp,
                ),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
          child: SizedBox(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 18.w,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Cari artikel atau penulis',
                          hintStyle: TextStyle(
                            color: AppColor.textColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          prefixIcon: Icon(
                            Icons.search_sharp,
                            color: AppColor.textColor,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(14.r),
                            ),
                            borderSide: BorderSide(
                              color: AppColor.strokeColor,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(14.r),
                            ),
                            borderSide: BorderSide(
                              color: AppColor.strokeColor,
                            ),
                          ),
                          filled: true,
                          fillColor: AppColor.strokeColor,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 15.h,
                            horizontal: 20.w,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 18.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Paling Populer",
                            style: TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 20.sp,
                            color: AppColor.primaryColor,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 18.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 155.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        color: AppColor.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(14.r),
                                      ),
                                      height: 155.w,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(14.r),
                                        child: Image.asset(
                                          "assets/images/foto1.jpeg",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 8,
                                      right: 8,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColor.primaryColor,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(4),
                                          child: Icon(
                                            Icons.bookmark_border_outlined,
                                            color: Colors.white,
                                            size: 20.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth: 155.w,
                                  ),
                                  child: Text(
                                    "10 Tips jadi sukses usia muda mantap oke hihi",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            color: AppColor.primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(14.r),
                                          ),
                                          width: 15.w,
                                          height: 15.w,
                                          child: ClipOval(
                                            child: Image.asset(
                                              "assets/images/foto1.jpeg",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 4.w,
                                        ),
                                        Text(
                                          "Roni",
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            color: AppColor.primaryColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "10 hari yang lalu",
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: AppColor.hintColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 155.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        color: AppColor.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(14.r),
                                      ),
                                      height: 155.w,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(14.r),
                                        child: Image.asset(
                                          "assets/images/foto1.jpeg",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 8,
                                      right: 8,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColor.primaryColor,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(4),
                                          child: Icon(
                                            Icons.bookmark_border_outlined,
                                            color: Colors.white,
                                            size: 20.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth: 155.w,
                                  ),
                                  child: Text(
                                    "10 Tips jadi sukses usia muda mantap oke sip manta mantap",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            color: AppColor.primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(14.r),
                                          ),
                                          width: 15.w,
                                          height: 15.w,
                                          child: ClipOval(
                                            child: Image.asset(
                                              "assets/images/foto1.jpeg",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 4.w,
                                        ),
                                        Text(
                                          "Roni",
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            color: AppColor.primaryColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "10 hari yang lalu",
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: AppColor.hintColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 18.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Jelajahi berdasarkan topik",
                            style: TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 20.sp,
                            color: AppColor.primaryColor,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 18.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 155.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        color: AppColor.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(14.r),
                                      ),
                                      height: 155.w,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(14.r),
                                        child: Image.asset(
                                          "assets/images/foto1.jpeg",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 8,
                                      right: 8,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColor.primaryColor,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(4),
                                          child: Icon(
                                            Icons.bookmark_border_outlined,
                                            color: Colors.white,
                                            size: 20.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth: 155.w,
                                  ),
                                  child: Text(
                                    "10 Tips jadi sukses usia muda mantap oke hihi",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            color: AppColor.primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(14.r),
                                          ),
                                          width: 15.w,
                                          height: 15.w,
                                          child: ClipOval(
                                            child: Image.asset(
                                              "assets/images/foto1.jpeg",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 4.w,
                                        ),
                                        Text(
                                          "Roni",
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            color: AppColor.primaryColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "10 hari yang lalu",
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: AppColor.hintColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 155.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        color: AppColor.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(14.r),
                                      ),
                                      height: 155.w,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(14.r),
                                        child: Image.asset(
                                          "assets/images/foto1.jpeg",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 8,
                                      right: 8,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColor.primaryColor,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(4),
                                          child: Icon(
                                            Icons.bookmark_border_outlined,
                                            color: Colors.white,
                                            size: 20.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth: 155.w,
                                  ),
                                  child: Text(
                                    "10 Tips jadi sukses usia muda mantap oke sip manta mantap",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            color: AppColor.primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(14.r),
                                          ),
                                          width: 15.w,
                                          height: 15.w,
                                          child: ClipOval(
                                            child: Image.asset(
                                              "assets/images/foto1.jpeg",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 4.w,
                                        ),
                                        Text(
                                          "Roni",
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            color: AppColor.primaryColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "10 hari yang lalu",
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: AppColor.hintColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
