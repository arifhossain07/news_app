import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/ui/news_details.dart';

class NewsItemList extends StatelessWidget {
  final NewsModel news;

  const NewsItemList({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NewsDetails(news)),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        margin: const EdgeInsets.symmetric(horizontal: 12),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
              imageUrl: news.urlToImage.toString(),
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            SizedBox(height: 8),

            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    news.source!.name.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                SizedBox(width: 8),
                Text(news.publishedAt.toString()),
              ],
            ),
            SizedBox(height: 3),

            Text(news.author == null ? "" : "Written By ${news.author}"),
            SizedBox(height: 8),

            Text(news.title.toString(), style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
