import 'package:bharatnxt_task/view_models/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteArticleView extends StatelessWidget {
  const FavouriteArticleView({super.key});

  @override
  Widget build(BuildContext context) {
    final provierRead = context.read<HomeViewModel>();
    return Scaffold(
      appBar: AppBar(title: Text('Favourite Articles')),
      body:
          provierRead.favouriteArticles.isEmpty
              ? Center(child: Text('No Favourite Articles'))
              : ListView.builder(
                itemCount: provierRead.favouriteArticles.length,
                itemBuilder: (context, index) {
                  final favourite = provierRead.favouriteArticles[index];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(favourite.id.toString()),
                      ),
                      title: Text(favourite.title),
                      subtitle: Text(favourite.description),
                    ),
                  );
                },
              ),
    );
  }
}
