import 'package:flutter/material.dart';
import 'package:list_of_articles/data/model/article.dart';
import 'package:list_of_articles/presentation/navigation/la_route_path.dart';
import 'package:list_of_articles/presentation/screen/article_details.dart';
import 'package:list_of_articles/presentation/screen/auth_screen.dart';

import '../screen/articles_screen.dart';

class LARouter {
  static Route getAppRouteFactory(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case LARoutePath.authScreen:
        return _routeAuthScreen();

      case LARoutePath.articlesScreen:
        return _routeArticlesScreen();

      case LARoutePath.articleDetailsScreen:
        return _routeArticleDetailsScreen(routeSettings.arguments as Article);

      default:
        throw Exception(
          'Unsupported navigation route: ${routeSettings.name}!',
        );
    }
  }

  static Route _routeAuthScreen() => MaterialPageRoute(
        builder: (_) => const AuthScreen(),
      );

  static Route _routeArticlesScreen() => MaterialPageRoute(
        builder: (_) => const ArticlesScreen(),
      );

  static Route _routeArticleDetailsScreen(Article article) => MaterialPageRoute(
        builder: (_) => ArticleDetails(
          article: article,
        ),
      );
}
