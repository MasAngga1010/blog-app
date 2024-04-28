// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously, avoid_print
import 'package:blog/screens/auth/login.dart';
import 'package:blog/token.dart';
import 'package:http/http.dart' as http;

import 'package:blog/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<void> logout() async {
    String? token = await StorageUtil.getToken();
    if (token != null) {
      final response = await http.get(
        Uri.parse('${ApiConfig.baseUrl}/logout/'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        await StorageUtil.clearToken();

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      } else {
        print('Gagal logout: ${response.statusCode}');
      }
    } else {
      print('Token tidak tersedia');
    }
  }

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
                  "Profile",
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
                PopupMenuButton<String>(
                  icon: Icon(
                    Icons.settings_outlined,
                    color: AppColor.hintColor,
                    size: 24.sp,
                  ),
                  color: Colors.white,
                  shadowColor: AppColor.primaryColor,
                  // elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onSelected: (String value) {
                    if (value == 'logout') {
                      logout();
                    }
                  },

                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      value: 'logout',
                      child: Row(
                        children: [
                          Icon(
                            Icons.logout_outlined,
                            color: AppColor.secondColor,
                            size: 24.sp,
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            'Logout',
                            style: TextStyle(
                              color: AppColor.secondColor,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
            SizedBox(
              height: 10.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                        width: 70.w,
                        height: 70.w,
                        child: ClipOval(
                          child: Image.asset(
                            "assets/images/foto1.jpeg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mas Angga",
                            style: TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text(
                            "masangga@gmail.com",
                            style: TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 10.sp,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 20.w,
                      right: 20.w,
                      top: 10.h,
                      bottom: 10.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        100.r,
                      ),
                      border: Border.all(
                        color: AppColor.primaryColor, // Warna border
                        width: 2.0, // Ketebalan border
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.edit_outlined,
                          color: AppColor.primaryColor,
                          size: 16.sp,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          "Edit",
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.w,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 18.w,
              ),
              color: AppColor.strokeColor,
              height: 2.h,
            ),
            SizedBox(
              height: 10.w,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 18.w,
              ),
              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                childAspectRatio: 2,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          color: AppColor.strokeColor,
                          width: 1.0, // Lebar border
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "125",
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          "Artikel",
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 10.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "104",
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          "Followoing",
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 10.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: AppColor.strokeColor,
                          width: 1.0, // Lebar border
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "10.000",
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          "Follower",
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 10.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.w,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 18.w,
              ),
              color: AppColor.strokeColor,
              height: 2.h,
            ),
            SizedBox(
              height: 20.w,
            ),
          ],
        ),
      )),
    );
  }
}
