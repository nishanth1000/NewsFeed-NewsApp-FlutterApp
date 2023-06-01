import 'package:http/http.dart';
import 'dart:convert';
import 'package:newsfeed/Classes/newstemplate.dart';

class News {
  List<NewsTemplate> data = [];

  Future<void> getNews(String country, String category) async {
    Response response = await get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=fd2b0163415647cfa5939b64940e56c9'));
    Map jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['title'] != null &&
            element['urlToImage'] != null &&
            element['url'] != null) {
          data.add(NewsTemplate(
              title: element['title'],
              urlToImage: element['urlToImage'],
              urlToNews: element['url']));
        }
      });
    }
  }
}
