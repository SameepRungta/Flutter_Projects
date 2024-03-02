// news_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:login/components/news.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailScreen extends StatelessWidget {
  final News newsItem;

  NewsDetailScreen({required this.newsItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'CyberNews',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (newsItem.imageUrl.isNotEmpty)
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Container(
                  margin: EdgeInsets.only(top: 20, right: 10, left: 10),
                  child: Image.network(
                    newsItem.imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

          SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              newsItem.title,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),

          SizedBox(height: 8),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Author: ${newsItem.author}',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(width: 16),
                Text(
                  'Date: ${newsItem.publishedAt}',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),

          SizedBox(height: 16),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
            ),
          ),

          SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              newsItem.description,
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.justify,
            ),
          ),

          if (newsItem.url.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    'URL: ${newsItem.url}',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.blueAccent,
                      decoration: TextDecoration.underline,
                    ), textAlign: TextAlign.left,

                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      launch(newsItem.url);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent,
                    ),
                    child: Text(
                      'Read More',
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, top: 10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blueAccent,
              ),
              child: Text(
                'Back to News',
                style: GoogleFonts.poppins(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
