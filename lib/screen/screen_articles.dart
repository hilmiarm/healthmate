import 'package:flutter/material.dart';
import '../function/articles.dart';
import '../styles/styles_articles.dart';
import '../universal/app_bar.dart';
import '../universal/navbar.dart';

class ArticlesScreen extends StatefulWidget {
  @override
  _ArticlesScreenState createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  List _articles = [];

  @override
  void initState() {
    super.initState();
    _loadArticles();
  }

  _loadArticles() async {
    try {
      List articles = await fetchArticles();
      setState(() {
        _articles = articles;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: _articles.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                children: [
                  Center(
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Text(
                          'Artikel Kesehatan',
                          style: pageTitleStyle,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Jumlah artikel: ${_articles.length}',
                          style: articleCountStyle,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _articles.length,
                      itemBuilder: (context, index) {
                        var article = _articles[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(height: 16),
                                    Text(
                                      article['publishedAt'] ?? '',
                                      style: articleDateStyle,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Text(
                                  article['title'] ?? '',
                                  style: articleTitleStyle,
                                ),
                                SizedBox(height: 8),
                                Center(
                                  child: ElevatedButton(
                                    style: articleButtonStyle,
                                    onPressed: () {
                                      String articleUrl = article['url'];
                                      launchURL(articleUrl);
                                    },
                                    child: Text('Kunjungi Artikel'),
                                  ),
                                ),
                                SizedBox(height: 8),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
      bottomNavigationBar: CustomNavBar(selectedIndex: 3),
    );
  }
}
