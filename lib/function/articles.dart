// lib/function/articles.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

Future<List> fetchArticles() async {
  final response = await http.get(Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=id&category=health&apiKey=002ff817bcf94509b8635f29d85093e7'));
  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    return data['articles'];
  } else {
    throw Exception('Failed to load articles');
  }
}

Future<void> launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
