// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_const_declarations
import 'package:blog/shimmer.dart';
import 'package:blog/token.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:blog/config.dart';
import 'package:blog/model/artikel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String getRelativeDateString(DateTime publishedDate) {
    final DateTime now = DateTime.now();
    final Duration difference = now.difference(publishedDate);

    if (difference.inDays == 0) {
      return "hari ini";
    } else if (difference.inDays == 1) {
      return "kemarin";
    } else {
      // Gunakan format tanggal jika lebih dari satu hari yang lalu
      final DateFormat dateFormat = DateFormat('d MMM yyyy');
      return dateFormat.format(publishedDate);
    }
  }

  Future<List<BlogPost>> fetchBlogs() async {
    final url = '${ApiConfig.baseUrl}/blogs/';

    final token = await StorageUtil.getToken();

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => BlogPost.fromJson(json)).toList();
    } else {
      throw Exception('Gagal mengambil data blog');
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
            Container(
              margin: EdgeInsets.only(
                left: 3.w,
              ),
              width: 70.w,
              height: 70.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/blog-images3.png"),
                ),
              ),
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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 18.w,
                        ),
                        height: 180.h,
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(
                            14.r,
                          ),
                        ),
                        child: Row(
                          children: [
                            Text("ok"),
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
                              "Artikel Terbaru",
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
                        child: FutureBuilder<List<BlogPost>>(
                          future: fetchBlogs(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 16.w,
                                  mainAxisSpacing: 16.h,
                                  childAspectRatio: 1 / 1.379,
                                ),
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 2,
                                itemBuilder: (context, index) {
                                  return myShimmer();
                                },
                              );
                            } else if (snapshot.hasError) {
                              return Center(
                                child: Text('Error: ${snapshot.error}'),
                              );
                            } else if (snapshot.hasData) {
                              List<BlogPost> blogPosts = snapshot.data!;

                              blogPosts.sort((a, b) =>
                                  b.publishedDate.compareTo(a.publishedDate));

                              DateTime now = DateTime.now();
                              blogPosts = blogPosts.where((post) {
                                Duration difference =
                                    now.difference(post.publishedDate);
                                return difference.inDays < 1;
                              }).toList();

                              if (blogPosts.isNotEmpty) {
                                // Sesuaikan itemCount dengan panjang blogPosts
                                int itemCount =
                                    blogPosts.length < 2 ? blogPosts.length : 2;

                                return GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 14.w,
                                    childAspectRatio: 1 / 1.379,
                                  ),
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: itemCount,
                                  itemBuilder: (context, index) {
                                    // Akses blogPost berdasarkan indeks yang valid
                                    final BlogPost blogPost = blogPosts[index];

                                    final blogPostTitle = blogPost.title;
                                    final blogPostImage = blogPost.imageUrl;
                                    final blogPostPublished =
                                        blogPost.publishedDate;

                                    final publishedDateText =
                                        getRelativeDateString(
                                            blogPostPublished);

                                    return ArtikelCard(
                                      blogPostImage: blogPostImage,
                                      blogPostTitle: blogPostTitle,
                                      publishedDateText: publishedDateText,
                                    );
                                  },
                                );
                              } else {
                                return Center(
                                  child: Text('Tidak ada data blog.'),
                                );
                              }
                            }
                            return SizedBox.shrink();
                          },
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
                              "Artikel Anda",
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
                                      "10 Tips jadi sukses usia muda mantap oke sip manta mantap ",
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
        ),
      ),
    );
  }
}

class ArtikelCard extends StatelessWidget {
  const ArtikelCard({
    super.key,
    required this.blogPostImage,
    required this.blogPostTitle,
    required this.publishedDateText,
  });

  final String blogPostImage;
  final String blogPostTitle;
  final String publishedDateText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  borderRadius: BorderRadius.circular(14.r),
                ),
                height: 150.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14.r),
                  child: Image.network(
                    blogPostImage,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Icon(Icons.error),
                      );
                    },
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
          SizedBox(height: 8.h),
          Container(
            constraints: BoxConstraints(
              maxWidth: 155.w,
            ),
            child: Text(
              blogPostTitle,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 8.h),
          // Konten lainnya tetap sama
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(14.r),
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
                  SizedBox(width: 4.w),
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
                publishedDateText,
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
    );
  }
}
