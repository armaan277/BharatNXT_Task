import 'dart:convert';
import 'dart:io';
import 'package:bharatnxt_task/models/article.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

abstract class HomeRepository {
  Future<Either<String, List<Article>>> getArticles();
}

class HomeRepositoryImp extends HomeRepository {
  @override
  Future<Either<String, List<Article>>> getArticles() async {
    List<Article> articles = [];
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final listResponse = jsonDecode(response.body);
        articles =
            (listResponse as List)
                .map((article) => Article.fromMap(article))
                .toList();
      } else if (response.statusCode == 401) {
        throw Exception('Unauthorization Error: ${response.statusCode}');
      } else if (response.statusCode == 404) {
        throw Exception('Failed to load articles: ${response.statusCode}');
      } else if (response.statusCode == 500) {
        throw Exception('Internal Server Error: ${response.statusCode}');
      } else {
        throw Exception('Something went wrong: ${response.statusCode}');
      }
    } on SocketException {
      throw Exception('No Internet Connection');
    } catch (e, s) {
      debugPrint('Stack Trace : $s');
      return left('Error : ${e.toString()}');
    }
    return right(articles);
  }
}
