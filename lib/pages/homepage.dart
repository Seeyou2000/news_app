import 'package:flutter/material.dart';
import 'package:news_app/data/categorydata.dart';
import 'package:news_app/data/newsdata.dart';
import 'package:news_app/model/categorymodel.dart';
import 'package:news_app/model/newsmodel.dart';
import 'package:news_app/pages/categorypage.dart';
import 'package:news_app/pages/searchpage.dart';
import 'package:news_app/settings/setting.dart';
import 'package:news_app/template/newstemplate.dart';
import 'package:news_app/boundary/categoryboundary.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<CategoryModel> categories = [];

  List<NewsModel> news = [];

  bool isLoad = true;

  TextEditingController searchController = TextEditingController();

  getNews() async {
    NewsData newsData = NewsData();
    await newsData.getNews();
    news = newsData.newsDataSavedIn;
    setState(() {
      isLoad = false;
    });
  }

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  void onSearchPressed() {
    setState(() {
      Setting.isSearch = !Setting.isSearch;
      if (!Setting.isSearch) {
        Setting.searchText = "";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FlutterLogo(size: 70.0),
                  SizedBox(height: 10.0),
                  Text(
                    'Seeyou News',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            ...List.generate(categories.length, (index) {
              return ListTile(
                title: Text(
                  "- ${categories[index].categoryName}",
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                onTap: () {
                  int selectedCategoryIndex = categories.indexWhere(
                        (category) =>
                    category.categoryName.toLowerCase() ==
                        categories[index].categoryName.toLowerCase(),
                  );

                  if (selectedCategoryIndex != -1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryPages(
                          category: categories[selectedCategoryIndex]
                              .categoryName
                              .toLowerCase(),
                        ),
                      ),
                    );
                  }
                },
              );
            }),
          ],
        ),
      ),

      body: isLoad ? const Center(
        child: CircularProgressIndicator(),
      ): SingleChildScrollView(
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
                ListView.builder(
                  itemCount: news.length,
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index){
                    return NewsTemplate(
                      title: news[index].title,
                      description: news[index].description,
                      urlToImage: news[index].urlToImage,
                      url: news[index].url,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
  }

  PreferredSizeWidget homeAppBar() {
    if (Setting.isSearch) {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: TextField(
          controller: searchController,
          onChanged: (query){
            setState(() {
              Setting.searchText = query;
            });
          },
          decoration: const InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Setting.isSearch = !Setting.isSearch;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchPage(query: Setting.searchText),
                ),
              );
              Setting.searchText = "";
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              onSearchPressed();
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ],
      );
    } else {
      return AppBar(
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
        actions: <Widget>[
          IconButton(
              onPressed: (){
                onSearchPressed();
              }, icon: const Icon(Icons.search)),
        ],
      );
    }
  }
}
