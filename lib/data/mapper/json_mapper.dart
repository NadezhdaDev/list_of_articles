import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:list_of_articles/data/model/article.dart';

class JsonMapper {
  Future<List<Article>> getArticleListFromJson(
      BuildContext context, int pageCounter) async {
    String data = await DefaultAssetBundle.of(context).loadString(
        "assets/articles/${pageCounter}1_${pageCounter + 1}0_articles.json");
    final decoded = jsonDecode(data);
    List<Article> listArticles = [];
    for (final item in decoded) {
      final Article person = Article.fromJson(item);
      listArticles.add(person);
    }

    return listArticles;
  }
}
