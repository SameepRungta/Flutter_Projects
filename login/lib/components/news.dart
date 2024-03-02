// news.dart

class News {
  final String title;
  final String description;
  final String author;
  final String publishedAt;
  final String url;
  final String source;
  final String imageUrl;
  final String content;
  final bool removed;

  News({
    required this.title,
    required this.description,
    required this.author,
    required this.publishedAt,
    required this.url,
    required this.source,
    required this.imageUrl,
    required this.content,
    this.removed = false,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      author: json['author'] ?? "",
      publishedAt: json['date'] ?? "",
      url: json['url'] ?? "",
      source: json['source']['name'] ?? "",
      imageUrl: json['urlToImage'] ?? "",
      content: json['content'] ?? "",
    );
  }
}
