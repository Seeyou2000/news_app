import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/pages/categorypage.dart';

class CategoryBoundary extends StatelessWidget {
  final String categoryName, imageUrl;
  const CategoryBoundary({super.key, this.categoryName = '', this.imageUrl = ''});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => CategoryPages(
          category: categoryName.toLowerCase(),
        ),
        ));
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