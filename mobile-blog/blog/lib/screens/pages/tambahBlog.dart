// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element, prefer_const_declarations, avoid_print, use_build_context_synchronously
import 'dart:convert';
import 'dart:io';
import 'package:blog/screens/NavButton/nav_button.dart';
import 'package:blog/token.dart';
import 'package:http/http.dart' as http;

import 'package:blog/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class TambahBlog extends StatefulWidget {
  const TambahBlog({super.key});

  @override
  State<TambahBlog> createState() => _TambahBlogState();
}

class _TambahBlogState extends State<TambahBlog> {
  bool _isImagePickerActive = false;
  File? _imageFile;
  String? base64Image;
  bool isLoading = false;
  bool isLoadingDraft = false;
  bool isLoadingUnggah = false;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  Future<void> _pickImage() async {
    if (_isImagePickerActive) return;

    setState(() {
      _isImagePickerActive = true;
    });

    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    setState(() {
      _isImagePickerActive = false;
    });

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<String> _convertImageToBase64(File imageFile) async {
    List<int> imageBytes = await imageFile.readAsBytes();
    return base64Encode(imageBytes);
  }

  Future<int> getAuthorId() async {
    final token = await StorageUtil.getToken();
    final headers = {
      'Authorization': 'Bearer $token',
    };

    final response = await http.get(
      Uri.parse('${ApiConfig.baseUrl}/me/'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final authorId = int.parse(data['author']['author_id']);
      return authorId;
    } else {
      throw Exception('Failed to load author ID');
    }
  }

  Future<void> _uploadBlog(String status) async {
    setState(() {
      isLoading = true;
    });

    if (_imageFile != null) {
      base64Image = await _convertImageToBase64(_imageFile!);
    }

    final authorId = await getAuthorId();

    final Map<String, dynamic> requestBody = {
      'title': _titleController.text,
      'content': _contentController.text,
      'image': base64Image ?? '',
      'author_id': authorId,
      'status': status,
    };

    final token = await StorageUtil.getToken();

    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final response = await http.post(
      Uri.parse('${ApiConfig.baseUrl}/blogs/'),
      headers: headers,
      body: json.encode(requestBody),
    );

    // Cek status respons
    if (response.statusCode == 201) {
      AfterDialog(
        title: 'Berhasil',
        content: "Hore...Anda berhasil upload artikel hari ini",
        buttonText: 'OK',
      ).show(context);

      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => NavButton(
          initialIndex: 0,
        ),
      ));
    } else {
      final responseBody = json.decode(response.body);
      final errorMessage = responseBody['message'] ?? 'Terjadi kesalahan';

      AfterDialog(
        title: 'gagal',
        content: errorMessage,
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
        child: SizedBox(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  child: Icon(
                                    Icons.arrow_back,
                                    size: 24.sp,
                                    color: AppColor.primaryColor,
                                  ),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  "Tambah Artikel...",
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
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100.r),
                                    border: Border.all(
                                      color:
                                          AppColor.primaryColor, // Warna border
                                    ),
                                  ),
                                  width: 80,
                                  height: 40.h,
                                  child: TextButton(
                                    onPressed: isLoadingDraft
                                        ? null
                                        : () {
                                            setState(() {
                                              isLoadingDraft = true;
                                            });
                                            _uploadBlog('draft').then((_) {
                                              setState(() {
                                                isLoadingDraft = false;
                                              });
                                            });
                                          },
                                    child: isLoadingDraft
                                        ? SizedBox(
                                            width: 15.w,
                                            height: 15.w,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                AppColor.primaryColor,
                                              ),
                                            ),
                                          )
                                        : Text(
                                            "Draft",
                                            style: TextStyle(
                                              color: AppColor.primaryColor,
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColor.primaryColor,
                                    borderRadius: BorderRadius.circular(100.r),
                                  ),
                                  width: 80,
                                  height: 40.h,
                                  child: TextButton(
                                    onPressed: isLoadingUnggah
                                        ? null
                                        : () {
                                            setState(() {
                                              isLoadingUnggah = true;
                                            });
                                            _uploadBlog('published').then((_) {
                                              setState(() {
                                                isLoadingUnggah = false;
                                              });
                                            });
                                          },
                                    child: isLoadingUnggah
                                        ? SizedBox(
                                            width: 15.w,
                                            height: 15.w,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                Colors.white,
                                              ),
                                            ),
                                          )
                                        : Text(
                                            "Unggah",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      GestureDetector(
                        onTap: _isImagePickerActive ? null : _pickImage,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 18.w),
                          height: 300.h,
                          decoration: BoxDecoration(
                            color: AppColor.strokeColor,
                            borderRadius: BorderRadius.circular(14.r),
                          ),
                          child: _imageFile == null
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.image_rounded,
                                          size: 50.sp,
                                          color: AppColor.textColor,
                                        ),
                                        SizedBox(
                                          height: 30.h,
                                        ),
                                        Text(
                                          "Tambahkan gambar artikel anda",
                                          style: TextStyle(
                                            color: AppColor.textColor,
                                            fontSize: 14.sp,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                )
                              : Image.file(
                                  _imageFile!,
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Judul",
                              style: TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            TextField(
                              controller: _titleController,
                              decoration: InputDecoration(
                                hintText: 'Judul artikel',
                                hintStyle: TextStyle(
                                  color: AppColor.textColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Artikel",
                              style: TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            TextFormField(
                              controller: _contentController,
                              cursorColor: AppColor.primaryColor,
                              autocorrect: false,
                              style: TextStyle(color: AppColor.secondColor),
                              minLines: 8,
                              maxLines: null,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                contentPadding: EdgeInsets.only(
                                  top: 20.h,
                                  bottom: 20.h,
                                  left: 20.w,
                                  right: 40.w,
                                ),
                                filled: true,
                                fillColor: AppColor.strokeColor,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.r),
                                  ),
                                  borderSide: BorderSide(
                                    color: AppColor.strokeColor,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.r),
                                  ),
                                  borderSide: BorderSide(
                                    color: AppColor.strokeColor,
                                  ),
                                ),
                                hintText: "Tulis artikel Anda di sini...",
                                hintStyle: TextStyle(
                                  color: AppColor.textColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
    );
  }
}
