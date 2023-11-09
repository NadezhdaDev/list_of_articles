import 'package:flutter/material.dart';

import '../../data/model/article.dart';

class ArticleDetails extends StatelessWidget {
  final Article article;

  const ArticleDetails({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                article.title,
                style: const TextStyle(
                  fontFamily: 'Destroy',
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: Text(
                  article.date,
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Text(article.article),
            ),
          ],
        ),
      )),
    );
  }
}
