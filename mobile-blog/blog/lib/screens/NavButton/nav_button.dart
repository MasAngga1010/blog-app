// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, no_logic_in_create_state, prefer_const_literals_to_create_immutables, avoid_print, use_build_context_synchronously, use_rethrow_when_possible

import 'package:blog/config.dart';
import 'package:blog/screens/NavButton/button_bar.dart';
import 'package:blog/screens/pages/artikel.dart';
import 'package:blog/screens/pages/home.dart';
import 'package:blog/screens/pages/profil.dart';
import 'package:blog/screens/pages/tambahBlog.dart';
import 'package:blog/screens/pages/temukan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavButton extends StatefulWidget {
  final int initialIndex;

  const NavButton({
    Key? key,
    required this.initialIndex,
  }) : super(key: key);

  @override
  State<NavButton> createState() => _NavButtonState(initialIndex);
}

class _NavButtonState extends State<NavButton> {
  int current_index;

  _NavButtonState(this.current_index);

  void onIndexChanged(int newIndex) {
    setState(() {
      current_index = newIndex;
    });
  }

  List<Widget> screenList = [
    Home(),
    Temukan(),
    MyArtikel(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList[current_index],
      bottomNavigationBar: BottomAppBar(
        notchMargin: -2,
        height: 75.h,
        color: AppColor.primaryColor,
        shape: CircularNotchedRectangle(),
        child: SizedBox(
          width: double.infinity,
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  onIndexChanged(0);
                },
                child: ButtonBarr(
                  isActive: current_index == 0,
                  text: "Beranda",
                  icons: Icon(
                    Icons.home,
                    size: 22.sp,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  onIndexChanged(1);
                },
                child: Container(
                  margin: EdgeInsets.only(right: 28.w),
                  child: ButtonBarr(
                    isActive: current_index == 1,
                    text: "Temukan",
                    icons: Icon(
                      Icons.explore,
                      size: 22.sp,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  onIndexChanged(2);
                },
                child: Container(
                  margin: EdgeInsets.only(left: 28.w),
                  child: ButtonBarr(
                    isActive: current_index == 2,
                    text: "Artikel Saya",
                    icons: Icon(
                      Icons.description,
                      size: 22.sp,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  onIndexChanged(3);
                },
                child: ButtonBarr(
                  isActive: current_index == 3,
                  text: "Profil",
                  icons: Icon(
                    Icons.person_outline,
                    size: 22.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: 60.w,
        height: 60.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xff023047),
              Color(0xff023047),
            ],
          ),
        ),
        child: InkWell(
          onTap: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return _tambahBlog(
                  context,
                );
              },
            );
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _tambahBlog(BuildContext context) {
    return TambahBlog();
  }
}
