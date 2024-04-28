class BlogPost {
  final String title;
  final String content;
  final String imageUrl;
  final int authorId;
  final String status;
  final DateTime publishedDate;
  final DateTime createDate;
  final DateTime lastUpdate;

  BlogPost({
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.authorId,
    required this.status,
    required this.publishedDate,
    required this.createDate,
    required this.lastUpdate,
  });

  factory BlogPost.fromJson(Map<String, dynamic> json) {
    return BlogPost(
      title: json['title'],
      content: json['content'],
      imageUrl: json['image'],
      authorId: json['author_id'],
      status: json['status'],
      publishedDate: DateTime.parse(json['published_date']),
      createDate: DateTime.parse(json['create_date']),
      lastUpdate: DateTime.parse(json['last_update']),
    );
  }
}
