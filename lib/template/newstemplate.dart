import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewsTemplate extends StatelessWidget {
  String title, description, url, urlToImage;
  NewsTemplate({super.key,
    this.title = "",
    this.description = "",
    this.url = "",
    this.urlToImage = ""});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(imageUrl: urlToImage, width: 300, height: 200, fit: BoxFit.cover,),
          ),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.black),),
          const SizedBox(height: 8),
          Text(description, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0, color: Colors.black),),
        ],
      ),
    );
  }
}