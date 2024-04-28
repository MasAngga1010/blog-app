// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_cast, use_build_context_synchronously, avoid_print
import 'package:blog/screens/auth/login.dart';
import 'package:http/http.dart' as http;
// import 'dart:convert';

import 'package:blog/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isLoading = false;
  bool buttonClicked = false;
  String? selectedGender;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController authorNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();

  Future<void> register() async {
    final Uri url = Uri.parse('${ApiConfig.baseUrl}/register/');
    final String email = emailController.text.trim();

    // Validasi alamat email
    if (!email.endsWith('@gmail.com')) {
      AfterDialog(
        title: 'Pendaftaran Gagal',
        content: 'Mohon masukkan alamat email yang valid (format: @gmail.com)',
        buttonText: 'OK',
      ).show(context);

      setState(() {
        isLoading = false;
      });
      return;
    }

    try {
      final response = await http.post(
        url,
        body: {
          'gender': selectedGender,
          'username': usernameController.text.trim(),
          'author_name': authorNameController.text.trim(),
          'email': email,
          'password': passwordController.text.trim(),
          'password_confirmation': passwordConfirmController.text.trim(),
        },
      );

      if (response.statusCode == 200) {
        // Pendaftaran berhasil, langsung menuju ke halaman login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );

        AfterDialog(
          title: 'Pendaftaran Berhasil',
          content: 'Selamat akun anda berhasil terdaftar, Silahkan Login!',
          buttonText: 'OK',
        ).show(context);
      } else {
        AfterDialog(
          title: 'Pendaftaran Gagal',
          content:
              'Gagal melakukan pendaftaran. Sepertinya Username atau Email anda sudah di pakai.',
          buttonText: 'OK',
        ).show(context);
      }
    } catch (e) {
      AfterDialog(
        title: 'Terjadi Kesalahan',
        content:
            'Terjadi kesalahan saat melakukan pendaftaran. Silakan coba lagi.',
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
                                  "Register",
                                  style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 24.sp,
                                  ),
                                ),
                                Text(
                                  "Silakan daftarkan akun anda",
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
                          child: Scrollbar(
                            thumbVisibility: true,
                            trackVisibility: true,
                            thickness: 1.5,
                            child: Stack(
                              children: [
                                SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text("Jenis Kelamin :"),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Radio(
                                                            activeColor: AppColor
                                                                .primaryColor,
                                                            value: "L",
                                                            groupValue:
                                                                selectedGender,
                                                            onChanged: (value) {
                                                              setState(() {
                                                                selectedGender =
                                                                    value
                                                                        as String?;
                                                              });
                                                            },
                                                          ),
                                                          Text(
                                                            "Laki-laki",
                                                            style: TextStyle(
                                                              fontSize: 12.sp,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Radio(
                                                            activeColor: AppColor
                                                                .primaryColor,
                                                            value: "P",
                                                            groupValue:
                                                                selectedGender,
                                                            onChanged: (value) {
                                                              setState(() {
                                                                selectedGender =
                                                                    value
                                                                        as String?;
                                                              });
                                                            },
                                                          ),
                                                          Text(
                                                            "Perempuan",
                                                            style: TextStyle(
                                                              fontSize: 12.sp,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  if (selectedGender == null &&
                                                      buttonClicked)
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                        top: 4.h,
                                                      ),
                                                      child: Text(
                                                        "* Jenis Kelamin tidak boleh kosong",
                                                        style: TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 12.sp,
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          TextInput(
                                            prefixIcon: Icon(
                                              Icons.account_circle_outlined,
                                              color: AppColor.primaryColor,
                                              size: 20.sp,
                                            ),

                                            controller: usernameController,
                                            placeholder: "Masukan Username",
                                            validasi: buttonClicked &&
                                                    usernameController
                                                        .text.isEmpty
                                                ? "* Username tidak boleh kosong"
                                                : "", //
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          TextInput(
                                            prefixIcon: Icon(
                                              Icons.person_outline,
                                              color: AppColor.primaryColor,
                                              size: 20.sp,
                                            ),

                                            controller: authorNameController,
                                            placeholder: "Masukan Nama",
                                            validasi: buttonClicked &&
                                                    authorNameController
                                                        .text.isEmpty
                                                ? "* Nama tidak boleh kosong"
                                                : "", //
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          TextInput(
                                            prefixIcon: Icon(
                                              Icons.email_outlined,
                                              color: AppColor.primaryColor,
                                              size: 20.sp,
                                            ),

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
                                                ? "* Kata sandi tidak boleh kosong (-4 karakter)"
                                                : "",
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          InputPassword(
                                            controller:
                                                passwordConfirmController,
                                            sandi: "Masukan Konfirmasi Sandi",
                                            validasi: buttonClicked &&
                                                    passwordConfirmController
                                                        .text.isEmpty
                                                ? "* Konfirmasi sandi tidak boleh kosong (-4 karakter)"
                                                : "",
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: AppColor.primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                14.r,
                                              ),
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
                                                      if (selectedGender ==
                                                              null &&
                                                          buttonClicked) {
                                                        return;
                                                      }
                                                      if (emailController
                                                              .text.isEmpty ||
                                                          passwordController
                                                              .text.isEmpty) {}
                                                      setState(() {
                                                        isLoading = true;
                                                      });
                                                      register();
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
                                                      "Register",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 30.h,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
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

class TextInput extends StatefulWidget {
  const TextInput({
    Key? key,
    required this.placeholder,
    required this.controller,
    required this.validasi,
    required this.prefixIcon,
  }) : super(key: key);

  final TextEditingController controller;
  final String placeholder;
  final String validasi;
  final Icon prefixIcon;

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
                prefixIcon: widget.prefixIcon,
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
