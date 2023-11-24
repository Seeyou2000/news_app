import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data/categorydata.dart';
import 'package:news_app/data/newsdata.dart';
import 'package:news_app/model/categorymodel.dart';
import 'package:news_app/model/newsmodel.dart';
import 'package:news_app/template/newstemplate.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<CategoryModel> categories = [];

  List<NewsModel> news = [];

  getNews() async {
    NewsData newsData = NewsData();
    await newsData.getNews();
    news = newsData.newsDataSavedIn;
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
        title: const Text("Seeyou News",
          style: TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FlutterLogo(size: 70.0),
                  SizedBox(height: 10.0),
                  Text('Seeyou News',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                  ),),
                ],
              ),
            ),
            ListTile(
              title: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (CategoryModel category in categories)
                    Text("- ${category.categoryName}",
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ]
        ),
      ),

      //category widgets
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
                  itemCount: news.length,
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index){
                    return NewsTemplate(
                      title: news[index].title,
                      description: news[index].description,
                      urlToImage: news[index].urlToImage,
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

class CategoryBoundary extends StatelessWidget {
  final String categoryName, imageUrl;
  CategoryBoundary({this.categoryName = '', this.imageUrl = ''});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //TODO : categorypage 구현
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10.0),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
                child: CachedNetworkImage(imageUrl: imageUrl, width: 150, height: 80, fit: BoxFit.cover,)),
            Container(
              alignment: Alignment.center,
              width: 150, height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.black12,
              ),
              child: Text(categoryName,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),),
            ),
          ],
        ),
      ),
    );
  }
}

