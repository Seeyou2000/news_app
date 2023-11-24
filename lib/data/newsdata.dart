import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/model/newsmodel.dart';
import 'package:http/http.dart';

class NewsData{
  List<NewsModel> newsDataSavedIn = [];

  Future<void> getNews() async {
    String apiUri = "https://newsapi.org/v2/top-headlines?country=us&apiKey=${dotenv.env['API_KEY']}";
    var response = await get(Uri.parse(apiUri));
    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == 'ok'){
      jsonData['articles'].forEach((e){
        if(e['urlToImage'] != null && e['description'] != null){
          NewsModel newsModel = NewsModel(
            title: e['title'],
            urlToImage: e['urlToImage'],
            description: e['description'],
            url: e['url'],
          );

          newsDataSavedIn.add(newsModel);
        }
      });
    }
  }
}

class CategoryNewsData{
  List<NewsModel> categoryDataSavedIn = [];

  Future<void> getNews(String category) async {
    String apiUri = "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=${dotenv.env['API_KEY']}";
    var response = await get(Uri.parse(apiUri));
    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == 'ok'){
      jsonData['articles'].forEach((e){
        if(e['urlToImage'] != null && e['description'] != null){
          NewsModel newsModel = NewsModel(
            title: e['title'],
            urlToImage: e['urlToImage'],
            description: e['description'],
            url: e['url'],
          );

          categoryDataSavedIn.add(newsModel);
        }
      });
    }
  }
}