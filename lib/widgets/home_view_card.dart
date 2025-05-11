import 'package:bharatnxt_task/models/article.dart';
import 'package:bharatnxt_task/routes/routes_list.dart';
import 'package:bharatnxt_task/view_models/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeViewCard extends StatelessWidget {
  final Article article;
  final VoidCallback onPressed;
  const HomeViewCard({
    super.key,
    required this.article,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.of(
            context,
          ).pushNamed(RoutesList.articleInformationView, arguments: article);
        },
        leading: CircleAvatar(child: Text(article.id.toString())),
        title: Text(article.title),
        subtitle: Text(article.description),
        trailing: IconButton(
          onPressed: onPressed,
          icon: Icon(context.watch<HomeViewModel>().favouriteArticles.contains(article) ? Icons.favorite : Icons.favorite_border),
        ),
      ),
    );
  }
}
