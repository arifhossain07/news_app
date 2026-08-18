import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/news_model.dart';

class NewsDetails extends StatefulWidget {
  const NewsDetails(this.news, {super.key});

  final NewsModel news;

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.news.title.toString(),
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CachedNetworkImage(
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
              imageUrl: widget.news.urlToImage.toString(),
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),

            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    widget.news.source!.name.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                SizedBox(width: 8),
                Text(widget.news.publishedAt.toString()),
              ],
            ),
            SizedBox(height: 3),

            Text(
              widget.news.author == null
                  ? ""
                  : "Written By {widget.news.author}",
            ),
            SizedBox(height: 8),

            Text(widget.news.title.toString(), style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),

            Text(widget.news.description.toString()),

            SizedBox(height: 8),

            ElevatedButton(
              onPressed: () async {
                final Uri url = Uri.parse(widget.news.url.toString());
                if (!await launchUrl(url)) {
                  throw 'Could not launch';
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text(
                "Read More",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
