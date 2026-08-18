import 'dart:convert';
import 'package:http/http.dart';
import 'package:news_app/model/news_model.dart';

class ApiService {
  final allNewsUrl =
      "https://newsapi.org/v2/everything?q=news&apiKey=74f97ae19bc848278875e31193b39299";
  final breakingNewsUrl =
      "https://newsapi.org/v2/top-headlines?language=en&apiKey=74f97ae19bc848278875e31193b39299";

  Future<List<NewsModel>> getAllNews() async {
    try {
      Response res = await get(Uri.parse(allNewsUrl));
      if (res.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(res.body);
        List<dynamic> body = json['articles'];
        List<NewsModel> news = body
            .map((dynamic item) => NewsModel.fromJson(item))
            .toList();
        return news;
      } else {
        throw "Unable to retrieve news";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<NewsModel>> getBreakingNews() async {
    try {
      Response res = await get(Uri.parse(breakingNewsUrl));
      if (res.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(res.body);
        List<dynamic> body = json['articles'];
        List<NewsModel> news = body
            .map((dynamic item) => NewsModel.fromJson(item))
            .toList();
        return news;
      } else {
        throw "Unable to retrieve news";
      }
    } catch (e) {
      rethrow;
    }
  }
}
