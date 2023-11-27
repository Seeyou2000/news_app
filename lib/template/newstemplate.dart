import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsTemplate extends StatelessWidget {
  final String title, description, url, urlToImage;

  const NewsTemplate({
    Key? key,
    this.title = "",
    this.description = "",
    this.url = "",
    this.urlToImage = "",
  }) : super(key: key);

  _launchURL() async {
    await launchUrl(Uri.parse(url),  mode: LaunchMode.inAppWebView);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchURL, // When tapped, launch the URL
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                imageUrl: urlToImage,
                width: 300,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}