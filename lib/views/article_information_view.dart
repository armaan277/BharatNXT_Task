import 'package:flutter/material.dart';

class ArticleInformationView extends StatelessWidget {
  final String title;
  final String description;

  const ArticleInformationView({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Article Information')),
      body: Card(
        child: ListTile(
          title: Text('Title : $title'),
          subtitle: Text('Description : $description'),
        ),
      ),
    );
  }
}
