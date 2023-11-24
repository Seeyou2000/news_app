import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data/categorydata.dart';
import 'package:news_app/model/categorymodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<CategoryModel> categories = [];

  @override
  void initState() {
    super.initState();
    categories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              Text("Seeyou", style: TextStyle(color: Colors.black
              ),),
              Text(" News", style: TextStyle(color: Colors.blue
              ),),
          ],
        ),
      ),

      //category widgets
      body: Container(
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
          ],
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
    return Container(
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
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),),
          ),
        ],
      ),
    );
  }
}
