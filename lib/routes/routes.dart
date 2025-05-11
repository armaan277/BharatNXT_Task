import 'package:bharatnxt_task/models/article.dart';
import 'package:bharatnxt_task/routes/routes_list.dart';
import 'package:bharatnxt_task/views/article_information_view.dart';
import 'package:bharatnxt_task/views/favourite_article_view.dart';
import 'package:bharatnxt_task/views/home_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static final routes = {
    RoutesList.homeView: (context) => HomeView(),
    RoutesList.articleInformationView: (context) {
      final article = ModalRoute.of(context)?.settings.arguments as Article;
      return ArticleInformationView(
        title: article.title,
        description: article.description,
      );
    },
    RoutesList.favouriteArticlesView: (context) => FavouriteArticleView(),
  };
}
