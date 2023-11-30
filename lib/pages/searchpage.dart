import 'package:flutter/material.dart';
import 'package:news_app/data/newsdata.dart';
import 'package:news_app/template/newstemplate.dart';
import '../model/newsmodel.dart';

class SearchPage extends StatefulWidget {
  String query;
  SearchPage({super.key, this.query = ""});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<NewsModel> searchNews = [];

  var totalResults = 0;

  bool isLoad = true;

  getNews() async {
    SearchNewsData searchNewsData = SearchNewsData();
    await searchNewsData.getNews(widget.query);
    searchNews = searchNewsData.searchDataSavedIn;
    totalResults = searchNewsData.totalResults;
    setState(() {
      isLoad = false;
    });
  }

  void initState() {
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          "Seeyou News",
          style: TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: isLoad
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : SingleChildScrollView(
        child: Container(
          color: Colors.white70,
          child: Column(
            children: <Widget>[
              totalResults == 0
                  ? const Center(
                    child: Text(
                      "No data",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : ListView.builder(
                itemCount: searchNews.length,
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return NewsTemplate(
                    title: searchNews[index].title,
                    description: searchNews[index].description,
                    urlToImage: searchNews[index].urlToImage,
                    url: searchNews[index].url,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
