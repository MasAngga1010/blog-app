// ignore_for_file: prefer_const_constructors, use_build_context_synchronously
import 'dart:convert';
import 'package:blog/screens/NavButton/nav_button.dart';
import 'package:blog/token.dart';
import 'package:http/http.dart' as http;

import 'package:blog/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  bool buttonClicked = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  _login() async {
    setState(() {
      isLoading = true;
    });

    try {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      if (email.isNotEmpty && password.isNotEmpty) {
        if (!email.endsWith('@gmail.com')) {
          setState(() {
            isLoading = false;
            buttonClicked = true;
          });

          AfterDialog(
            title: 'Login Gagal',
            content:
                'Mohon masukkan alamat email yang valid (format: @gmail.com)',
            buttonText: 'OK',
          ).show(context);
          return;
        }

        final response = await http.post(
          Uri.parse('${ApiConfig.baseUrl}/login/'),
          body: {
            'email': email,
            'password': password,
          },
        );

        if (response.statusCode == 200) {
          final jsonData = json.decode(response.body);
          final token = jsonData['token'];

          // Simpan token di SharedPreferences
          await StorageUtil.saveToken(token);
          try {
            final bearerResponse = await http.get(
              Uri.parse('${ApiConfig.baseUrl}/me/'),
              headers: {
                'Authorization': 'Bearer $token',
              },
            );

            if (bearerResponse.statusCode == 200) {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => NavButton(
                  initialIndex: 0,
                ),
              ));
            } else {
              final errorMessage = json.decode(bearerResponse.body)['message'];

              AfterDialog(
                title: 'Token Tidak Valid',
                content: errorMessage,
                buttonText: 'OK',
              ).show(context);
            }
          } catch (e) {
            AfterDialog(
              title: 'Error',
              content: 'Gagal tersambung ke server!',
              buttonText: 'OK',
            ).show(context);
          }
        } else {
          final errorMessage = json.decode(response.body)['message'];

          AfterDialog(
            title: 'Login Gagal',
            content: errorMessage,
            buttonText: 'OK',
          ).show(context);
        }
      }
    } catch (e) {
      AfterDialog(
        title: 'Error',
        content: 'Gagal tersambung ke server!',
        buttonText: 'OK',
      ).show(context);
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: AppColor.primaryColor,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 20.h,
                  left: 20.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      child: Icon(
                        Icons.arrow_back,
                        size: 24.sp,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20.w),
                child: Image(
                  width: 150.w,
                  height: 150.w,
                  image: AssetImage(
                    'assets/images/blog-images.png',
                  ),
                ),
              ),
              SizedBox(
                height: 45.w,
              ),
              Expanded(
                child: Container(
                  width: 360.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(34.r),
                      topRight: Radius.circular(34.r),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Login",
                                  style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 24.sp,
                                  ),
                                ),
                                Text(
                                  "Silakan masuk dengan akun Anda",
                                  style: TextStyle(
                                    color: AppColor.textColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Expanded(
                          child: Stack(
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        TextInput(
                                          controller: emailController,
                                          placeholder: "Masukan Alamat Email",
                                          validasi: buttonClicked &&
                                                  emailController.text.isEmpty
                                              ? "* Alamat Email tidak boleh kosong"
                                              : "", //
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        InputPassword(
                                          controller: passwordController,
                                          sandi: "Masukan Kata Sandi",
                                          validasi: buttonClicked &&
                                                  passwordController
                                                      .text.isEmpty
                                              ? "* Kata sandi tidak boleh kosong"
                                              : "", // Berikan pesan validasi sesuai kondisi
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: AppColor.primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(14.r),
                                            boxShadow: [
                                              BoxShadow(
                                                color: AppColor.primaryColor
                                                    .withOpacity(0.2),
                                                spreadRadius: 2,
                                                blurRadius: 5,
                                                offset: Offset(0, 5),
                                              ),
                                            ],
                                          ),
                                          width: double.infinity,
                                          height: 60.h,
                                          child: TextButton(
                                            onPressed: isLoading
                                                ? null
                                                : () {
                                                    setState(() {
                                                      buttonClicked = true;
                                                    });

                                                    if (emailController
                                                            .text.isEmpty ||
                                                        passwordController
                                                            .text.isEmpty) {}
                                                    setState(() {
                                                      isLoading = true;
                                                    });

                                                    _login();
                                                  },
                                            child: isLoading
                                                ? SizedBox(
                                                    width: 30.w,
                                                    height: 30.w,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        Colors.white,
                                                      ),
                                                    ),
                                                  )
                                                : Text(
                                                    "Login",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
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
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InputPassword extends StatefulWidget {
  const InputPassword({
    Key? key,
    required this.controller,
    required this.sandi,
    required this.validasi,
  }) : super(key: key);

  final TextEditingController controller;
  final String sandi;
  final String validasi;

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  var obscureText = true;
  String? inputValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              cursorColor: AppColor.primaryColor,
              style: TextStyle(
                color: AppColor.primaryColor,
              ),
              obscureText: obscureText,
              controller: widget.controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock_outline,
                  color: AppColor.primaryColor,
                  size: 20,
                ),
                hintText: widget.sandi,
                hintStyle: TextStyle(
                  color: AppColor.hintColor,
                  fontSize: 12.sp,
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  child: obscureText
                      ? Icon(
                          Icons.visibility_off,
                          color: AppColor.primaryColor,
                          size: 22.sp,
                        )
                      : Icon(
                          Icons.visibility,
                          color: AppColor.hintColor,
                          size: 22.sp,
                        ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColor.strokeColor,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColor.primaryColor,
                  ),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  inputValue = value.trim();
                });
              },
            ),
            if (widget.validasi.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  widget.validasi,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            SizedBox(
              height: 4.h,
            ),
          ],
        ),
      ),
    );
  }
}

class TextInput extends StatefulWidget {
  const TextInput({
    Key? key,
    required this.placeholder,
    required this.controller,
    required this.validasi,
  }) : super(key: key);

  final TextEditingController controller;
  final String placeholder;
  final String validasi;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  String? inputValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: TextFormField(
              controller: widget.controller,
              cursorColor: AppColor.primaryColor,
              autocorrect: false,
              style: TextStyle(color: AppColor.primaryColor),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: AppColor.primaryColor,
                  size: 20.sp,
                ),
                hintText: widget.placeholder,
                hintStyle: TextStyle(
                  color: AppColor.hintColor,
                  fontSize: 12.sp,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColor.strokeColor,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColor.primaryColor,
                  ),
                ),
              ),
              onChanged: (value) {
                setState(
                  () {
                    inputValue = value.trim();
                  },
                );
              },
            ),
          ),
          if (widget.validasi.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                widget.validasi,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 12.sp,
                ),
              ),
            ),
          SizedBox(
            height: 4.h,
          ),
        ],
      ),
    );
  }
}
