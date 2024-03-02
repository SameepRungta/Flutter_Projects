// fetchNews.dart

import 'dart:convert';
import 'package:http/http.dart';
import 'package:login/components/news.dart';

class FetchNews {
  static Future<List<News>> fetchNews() async {
    try {
      Response response = await get(Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=12e818a49e91484db02b496c42900746"));

      List<dynamic> newsList = jsonDecode(response.body)['articles'];

      List<News> parsedNews = newsList.map((json) => News.fromJson(json)).toList();

      return parsedNews.where((news) => !news.removed).toList();
    } catch (e) {
      print("Error fetching news: $e");
      return [];
    }
  }
}
