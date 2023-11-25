import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data/categorydata.dart';
import 'package:news_app/data/newsdata.dart';
import 'package:news_app/model/categorymodel.dart';
import 'package:news_app/model/newsmodel.dart';
import 'package:news_app/template/newstemplate.dart';
import 'package:news_app/boundary/categoryboundary.dart';

class CategoryPages extends StatefulWidget {

  String category;
  CategoryPages({this.category = ""});

  @override
  State<CategoryPages> createState() => _CategoryPagesState();
}

class _CategoryPagesState extends State<CategoryPages> {
  List<CategoryModel> categories = [];

  List<NewsModel> categoryNews = [];

  getNews() async {
    CategoryNewsData categoryNewsData = CategoryNewsData();
    await categoryNewsData.getNews(widget.category);
    categoryNews = categoryNewsData.categoryDataSavedIn;
  }

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(widget.category.toUpperCase(),
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),


      body: SingleChildScrollView(
        child: Container(
          color: Colors.white70,
          child: Column(
            children: <Widget>[
              Container(
                height: 70.0,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: ListView.builder(
                  itemCount: categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                    return CategoryBoundary(
                      imageUrl: categories[index].imageUrl,
                      categoryName: categories[index].categoryName,
                    );
                  },
                ),
              ),
              Container(
                child: ListView.builder(
                  itemCount: categoryNews.length,
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index){
                    return NewsTemplate(
                      title: categoryNews[index].title,
                      description: categoryNews[index].description,
                      urlToImage: categoryNews[index].urlToImage,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
