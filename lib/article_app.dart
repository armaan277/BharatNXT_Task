import 'package:bharatnxt_task/routes/routes.dart';
import 'package:bharatnxt_task/routes/routes_list.dart';
import 'package:flutter/material.dart';

class ArticleApp extends StatelessWidget {
  const ArticleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RoutesList.homeView,
      debugShowCheckedModeBanner: false,
      routes: Routes.routes,
    );
  }
}
