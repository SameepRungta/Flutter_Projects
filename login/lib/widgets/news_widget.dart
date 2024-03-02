// news_widget.dart

import 'package:flutter/material.dart';
import 'package:login/Controller/fetchNews.dart';
import 'package:login/components/news.dart';
import 'package:login/screens/components/news_detail_screen.dart';
import 'package:login/components/functions.dart';
import 'package:login/screens/components/side_menu.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsWidget extends StatefulWidget {
  @override
  _NewsWidgetState createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  late Future<List<News>> _news;

  @override
  void initState() {
    super.initState();
    _news = FetchNews.fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SafeSphere',
          style: GoogleFonts.josefinSans(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.grey, size: 28),
        actions: [
          IconButton(
            onPressed: () => navigateBack(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      drawer: SideMenu(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blueAccent, Colors.indigo],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'CyberNews',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<News>>(
                future: _news,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    return ListView.builder(
                      padding: EdgeInsets.all(8),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        News newsItem = snapshot.data![index];
                        return _buildNewsCard(newsItem);
                      },
                    );
                  } else {
                    return Center(child: Text('No news available.'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsCard(News newsItem) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: Colors.white,
        child: InkWell(
          onTap: () => _openNewsDetail(context, newsItem),
          child: Container(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  newsItem.title,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  newsItem.description,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Author: ${newsItem.author}',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    Text(
                      'Date: ${newsItem.publishedAt}',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openNewsDetail(BuildContext context, News newsItem) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewsDetailScreen(newsItem: newsItem)),
    );
  }
}
