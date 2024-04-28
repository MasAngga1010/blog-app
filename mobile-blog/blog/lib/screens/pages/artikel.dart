// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:blog/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyArtikel extends StatefulWidget {
  const MyArtikel({super.key});

  @override
  State<MyArtikel> createState() => _MyArtikelState();
}

class _MyArtikelState extends State<MyArtikel> {
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
                  "Artikel Saya",
                  style: TextStyle(
                    color: AppColor.primaryColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            Icon(
              Icons.bookmark_border_outlined,
              color: AppColor.hintColor,
              size: 24.sp,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          child: Column(
            children: [
              SizedBox(
                height: 10.w,
              ),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                childAspectRatio: 4,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: AppColor.primaryColor,
                            width: 2.w // Lebar border
                            ),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Draft (24)",
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColor.strokeColor,
                          width: 1.w, // Lebar border
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Unggah (40)",
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 18.w,
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "24 Artikel",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(bottom: 20.h),
                                    child: Row(
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                color: AppColor.primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(14.r),
                                              ),
                                              height: 120.w,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(14.r),
                                                child: Image.asset(
                                                  "assets/images/foto1.jpeg",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 16.w,
                                        ),
                                        SizedBox(
                                          width: 185.w,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                constraints: BoxConstraints(
                                                  maxWidth: 185.w,
                                                ),
                                                child: Text(
                                                  "10 Tips jadi sukses usia muda mantap oke hihi okok okok",
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Hari ini",
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: AppColor.hintColor,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.edit_outlined,
                                                        color: AppColor
                                                            .primaryColor,
                                                        size: 16.sp,
                                                      ),
                                                      SizedBox(
                                                        width: 10.w,
                                                      ),
                                                      Icon(
                                                        Icons
                                                            .delete_forever_rounded,
                                                        color: Colors.red,
                                                        size: 16.sp,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(bottom: 20.h),
                                    child: Row(
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                color: AppColor.primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(14.r),
                                              ),
                                              height: 120.w,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(14.r),
                                                child: Image.asset(
                                                  "assets/images/foto1.jpeg",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 16.w,
                                        ),
                                        SizedBox(
                                          width: 185.w,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                constraints: BoxConstraints(
                                                  maxWidth: 185.w,
                                                ),
                                                child: Text(
                                                  "10 Tips jadi sukses usia muda mantap oke hihi okok okok",
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Hari ini",
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: AppColor.hintColor,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.edit_outlined,
                                                        color: AppColor
                                                            .primaryColor,
                                                        size: 16.sp,
                                                      ),
                                                      SizedBox(
                                                        width: 10.w,
                                                      ),
                                                      Icon(
                                                        Icons
                                                            .delete_forever_rounded,
                                                        color: Colors.red,
                                                        size: 16.sp,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(bottom: 20.h),
                                    child: Row(
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                color: AppColor.primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(14.r),
                                              ),
                                              height: 120.w,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(14.r),
                                                child: Image.asset(
                                                  "assets/images/foto1.jpeg",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 16.w,
                                        ),
                                        SizedBox(
                                          width: 185.w,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                constraints: BoxConstraints(
                                                  maxWidth: 185.w,
                                                ),
                                                child: Text(
                                                  "10 Tips jadi sukses usia muda mantap oke hihi okok okok",
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Hari ini",
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: AppColor.hintColor,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.edit_outlined,
                                                        color: AppColor
                                                            .primaryColor,
                                                        size: 16.sp,
                                                      ),
                                                      SizedBox(
                                                        width: 10.w,
                                                      ),
                                                      Icon(
                                                        Icons
                                                            .delete_forever_rounded,
                                                        color: Colors.red,
                                                        size: 16.sp,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(bottom: 20.h),
                                    child: Row(
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                color: AppColor.primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(14.r),
                                              ),
                                              height: 120.w,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(14.r),
                                                child: Image.asset(
                                                  "assets/images/foto1.jpeg",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 16.w,
                                        ),
                                        SizedBox(
                                          width: 185.w,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                constraints: BoxConstraints(
                                                  maxWidth: 185.w,
                                                ),
                                                child: Text(
                                                  "10 Tips jadi sukses usia muda mantap oke hihi okok okok",
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Hari ini",
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: AppColor.hintColor,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.edit_outlined,
                                                        color: AppColor
                                                            .primaryColor,
                                                        size: 16.sp,
                                                      ),
                                                      SizedBox(
                                                        width: 10.w,
                                                      ),
                                                      Icon(
                                                        Icons
                                                            .delete_forever_rounded,
                                                        color: Colors.red,
                                                        size: 16.sp,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(bottom: 20.h),
                                    child: Row(
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                color: AppColor.primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(14.r),
                                              ),
                                              height: 120.w,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(14.r),
                                                child: Image.asset(
                                                  "assets/images/foto1.jpeg",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 16.w,
                                        ),
                                        SizedBox(
                                          width: 185.w,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                constraints: BoxConstraints(
                                                  maxWidth: 185.w,
                                                ),
                                                child: Text(
                                                  "10 Tips jadi sukses usia muda mantap oke hihi okok okok",
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Hari ini",
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: AppColor.hintColor,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.edit_outlined,
                                                        color: AppColor
                                                            .primaryColor,
                                                        size: 16.sp,
                                                      ),
                                                      SizedBox(
                                                        width: 10.w,
                                                      ),
                                                      Icon(
                                                        Icons
                                                            .delete_forever_rounded,
                                                        color: Colors.red,
                                                        size: 16.sp,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.w,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
