import 'package:bharatnxt_task/article_app.dart';
import 'package:bharatnxt_task/repositories/home_repository.dart';
import 'package:bharatnxt_task/view_models/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeViewModel(homeRepository: HomeRepositoryImp()),
        ),
      ],
      child: ArticleApp(),
    ),
  );
}
